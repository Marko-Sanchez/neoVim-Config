local M = {}
  M.setup = function()

    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
      -- disable virtual text
      virtual_text = true,
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.diagnostic.config(config)
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
  end

  local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded"})<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
  end

  local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
      vim.api.nvim_exec(
        [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
        false
      )
    end
  end
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
  end

  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  -- local servers = {'pyright'}
  -- for _, lsp in pairs(servers) do
  --   require('lspconfig')[lsp].setup {
  --     on_attach = on_attach,
  --     flags = {
  --       -- This will be the default in neovim 0.7+
  --       debounce_text_changes = 150,
  --     }
  --   }
  -- end

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    print("nvim-lsp-installer not found")
  return
end

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
M.setup()
lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = M.on_attach,
    }

--     Custome definition for servers:
--     if server.name == "pyright" then
--       local pyright_ops = require('lspconfig.pyright').on_attach
--       opts = vim.tbl_deep_extend("force", pyright_ops, opts)
--     end

--     if server.name == "clangd" then
--       local clangd_ops = require('lspconfig.clangd').on_attach
--       opts = vim.tbl_deep_extend("force", clangd_ops, opts)
--     end

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
