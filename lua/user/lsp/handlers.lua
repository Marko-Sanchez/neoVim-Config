local M = {}
M.setup = function()

  local config = {
    virtual_text = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    -- https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.Opts.Signs
    signs = {
      active = true,
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN]  = "",
        [vim.diagnostic.severity.HINT]  = "",
        [vim.diagnostic.severity.INFO]  = "",
      },
    },
    float = {
      focusable = false,
      border = "double",
      scope = "line",
      source = true,
      pos    = 0,
    }
  }

  vim.diagnostic.config(config)

end

local function lsp_keymaps(bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'gl','<cmd>lua vim.diagnostic.open_float({focusable = true, border = "double"})<cr>', bufopts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(_, bufnr)
  lsp_keymaps(bufnr)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
