local status_ok, mason_installer = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

local lspconfig = require("lspconfig")

local servers = {"pyright", "clangd", "gopls", "jsonls", "lua_ls"}
if vim.fn.has("win32") == 1 then
    table.insert(servers, "powershell_es")
end

mason_installer.setup({
    ensure_installed = servers
})

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
    if has_custom_opts then
         opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
    end
    lspconfig[server].setup(opts)
end
