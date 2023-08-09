-- check if where in a windows environment or linux/unix
local is_windows = vim.fn.has("win32") == 1

-- grab path to nvim config
local config_path = vim.fn.stdpath("config")

if is_windows then
  print("Windows")
  config_path = config_path .. "\\"

  vim.cmd("source " .. config_path .. "general\\settings.vim")
  vim.cmd("source " .. config_path .. "vim-plug\\plugins.vim")
  vim.cmd("source " .. config_path .. "plug-config\\start-screen.vim")

else
  print("Linux/Unix")
  config_path = config_path .. "/"

  vim.cmd("source " .. config_path .. "general/settings.vim")
  vim.cmd("source " .. config_path .. "vim-plug/plugins.vim")
  vim.cmd("source " .. config_path .. "plug-config/start-screen.vim")


end

require "user.mappings"
require "user.treesitter"

-- require "user.colorschemes.material"
require "user.colorschemes.everforest"
-- require "user.tokyonight"
-- require "user.gruvbox"
-- require "user.monokai"

require "user.colorizer"

require "user.lualine"
-- require "user.evil-lualine"
-- require "user.bubble-lualine"

require "user.copilot"

require "user.lsp"
require "user.nvim-tree"
require "user.gitsigns"
require "user.cmp"
require "user.autopairs"

require "user.telescope"
require "user.trouble"
