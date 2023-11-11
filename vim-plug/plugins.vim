if !has('nvim')
    echo "Download neovim first, before config installation"
    finish
endif

let data_dir = stdpath('config')

if has('unix') && empty(glob(data_dir . '/autoload/plug.vim'))
    echo "Running on a Unix Machine, installing vim plug"

    !mkdir -p data_dir . '/autoload'
    let plug_path = data_dir . '/autoload/plug.vim'
    let cmd = '!curl -fLo ' .plug_path. ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    execute cmd

    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

elseif has('win32') && empty(glob(data_dir . '\autoload\plug.vim'))
    echo "Running on a Windows Machine, installing vim plug"

    silent !powershell -Command "
            \ New-Item -Path '$env:LOCALAPPDATA\nvim\' -Name autoload -Type Directory -Force;
            \ Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            \ "

    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

endif

let pluginPath = stdpath('config') . (has('unix')? '/autoload/plugged': '\autoload\plugged')
call plug#begin(pluginPath)

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " Colorscheme
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'folke/tokyonight.nvim'
    Plug 'tanvirtin/monokai.nvim'
    Plug 'marko-cerovac/material.nvim'
    Plug 'sainnhe/everforest'
    " Plug 'marko-sanchez/california.nvim'

    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'rktjmp/lush.nvim'

    " Statusline
    Plug 'nvim-lualine/lualine.nvim'

    " Git stuff
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'

    " nvim-tree
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-tree/nvim-tree.lua'

    " Start page
    Plug 'mhinz/vim-startify'

    " Commenter
    Plug 'tpope/vim-commentary'

    " Auto pairs
    Plug 'windwp/nvim-autopairs'

    " Snippets
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'

    " Auto-Complete
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'  " buffer completions
    Plug 'hrsh7th/cmp-path'    " path completions
    Plug 'hrsh7th/cmp-cmdline' " cmdline completions

    " Tresitter
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-tree/nvim-web-devicons'

    " Co-pilot
    Plug 'github/copilot.vim'

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'williamboman/mason.nvim'

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-media-files.nvim'

    Plug 'folke/trouble.nvim'

call plug#end()
