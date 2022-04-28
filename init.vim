" General Stuff
source $HOME/.config/nvim/general/paths.vim
source $HOME/.config/nvim/general/settings.vim
luafile $HOME/.config/nvim/lua/user/mappings.lua

" Plug
source $HOME/.config/nvim/vim-plug/plugins.vim

" Plug Configs
source $HOME/.config/nvim/plug-config/lightline.vim
source $HOME/.config/nvim/plug-config/start-screen.vim

source $HOME/.config/nvim/plug-config/handler.lua
luafile $HOME/.config/nvim/lua/user/treesitter.lua

" luafile $HOME/.config/nvim/lua/user/tokyonight.lua
luafile $HOME/.config/nvim/lua/user/material.lua
" luafile $HOME/.config/nvim/lua/user/nord.lua
" luafile $HOME/.config/nvim/lua/user/gruvbox.lua
" luafile $HOME/.config/nvim/lua/user/monokai.lua

luafile $HOME/.config/nvim/lua/user/gitsigns.lua
luafile $HOME/.config/nvim/lua/user/cmp.lua
luafile $HOME/.config/nvim/lua/user/autopairs.lua
luafile $HOME/.config/nvim/lua/user/telescope.lua
luafile $HOME/.config/nvim/lua/user/trouble.lua
