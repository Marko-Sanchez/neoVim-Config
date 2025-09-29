require("mason").setup()

-- Files, under 'user/lua/lsp/*', containing servers to install and their configuration.
require "user.lsp.configs"
require("user.lsp.handlers").setup()
