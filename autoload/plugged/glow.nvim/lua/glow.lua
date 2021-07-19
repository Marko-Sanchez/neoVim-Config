local api = vim.api
local win, buf
local M = {}

local function validate(path)
  if vim.fn.executable("glow") == 0 then
    api.nvim_err_writeln("glow is not installed. Call :GlowInstall to install it")
    return
  end

  -- trim and get the full path
  path = string.gsub(path, "%s+", "")
  path = string.gsub(path, "\"", "")
  path = path == "" and "%" or path
  path = vim.fn.expand(path)
  path = vim.fn.fnamemodify(path, ":p")
  local file_exists = vim.fn.filereadable(path) == 1 and vim.fn.bufexists(path) == 1
  -- check if file exists
  if not file_exists then
    api.nvim_err_writeln("file does not exists")
    return
  end

  local ext = vim.fn.fnamemodify(path, ":e")
  if ext ~= "md" then
    api.nvim_err_writeln("glow only support markdown files")
    return
  end

  return path
end

local function call_install_script()
  local script = [[
    version="1.4.1"
    os=$(uname -s | tr "[:upper:]" "[:lower:]")
    arch=$(uname -p)
    # edge case for osx
    if [ "$os" == "darwin" ]; then
      os="Darwin"
      arch=$(uname -m)
    fi
    [ -z "$arch" ] || [ "$arch" == "unknown" ] && arch="x86_64"
    filename="glow_${version}_${os}_${arch}.tar.gz"
    url="https://github.com/charmbracelet/glow/releases/download/v${version}/${filename}"

    [ -f "$GOPATH/bin/glow" ] && rm "$GOPATH/bin/glow"
    [ -f glow.tar.gz ] && rm glow.tar.gz

    curl -sL -o glow.tar.gz ${url}
    tar -zxf glow.tar.gz -C "$GOPATH/bin"
    [ -f "glow.tar.gz" ] && rm "glow.tar.gz"
    echo "Glow installed sucessfully!"
  ]]
  vim.cmd("new")
  local shell = vim.o.shell
  vim.o.shell = '/bin/bash'
  vim.fn.termopen("set -e\n" .. script)
  vim.o.shell = shell
  vim.cmd("startinsert")
end

function M.close_window()
  api.nvim_win_close(win, true)
end

function M.download_glow()
  if not vim.fn.executable("go") == 0 then
    api.nvim_err_writeln("golang not installed. Please provide it first")
  end

  if vim.fn.executable("glow") == 1 then
    local answer = vim.fn.input(
                     "latest glow already installed, do you want update? Y/n = ")
    answer = string.lower(answer)
    while answer ~= "y" and answer ~= "n" do
      answer = vim.fn.input("please answer Y or n = ")
      answer = string.lower(answer)
    end

    if answer == "n" then
      api.nvim_out_write("\n")
      return
    end
    api.nvim_out_write("updating glow..\n")
  else
    print("installing glow..")
  end
  call_install_script()
end
-- open_window draws a custom window with the markdown contents
local function open_window(path)

  -- window size
  local width = api.nvim_get_option("columns")
  local height = api.nvim_get_option("lines")
  local win_height = math.ceil(height * 0.8 - 4)
  local win_width = math.ceil(width * 0.8)
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = "shadow",
  }

  -- create preview buffer and set local options
  buf = api.nvim_create_buf(false, true)
  win = api.nvim_open_win(buf, true, opts)
  api.nvim_buf_set_keymap(buf, "n", "q", ":lua require('glow').close_window()<cr>",
                          {noremap = true, silent = true})
  api.nvim_buf_set_keymap(buf, "n", "<Esc>", ":lua require('glow').close_window()<cr>",
                          {noremap = true, silent = true})

  -- set local options
  api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  api.nvim_win_set_option(win, "winblend", 0)
  vim.fn.termopen(string.format("glow %s", vim.fn.shellescape(path)))
end

function M.glow(file)
  local current_win = vim.fn.win_getid()
  if current_win == win then
    M.close_window()
  else
    local path = validate(file)
    if path == nil then
      return
    end
    open_window(path)
  end
end

return M
