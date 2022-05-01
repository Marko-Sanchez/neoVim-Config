-- local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
-- if not status_ok then
-- 	return
-- end

-- local lspconfig = require("lspconfig")

-- local servers = { "pyright", "clangd", "sumneko_lua" }

-- lsp_installer.setup {
-- 	ensure_installed = servers
-- }

-- for _, server in pairs(servers) do
-- 	local opts = {
-- 		on_attach = require("user.lsp.handlers").on_attach,
-- 		capabilities = require("user.lsp.handlers").capabilities,
-- 	}
-- 	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
-- 	if has_custom_opts then
-- 		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
-- 	end
-- 	lspconfig[server].setup(opts)
-- end

-- TODO: once we update ot neovim 0.7.0 we will have to use above config

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	  if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
