let data_dir = has('nvim') ? stdpath('data') . '/site' : 'nvim'

if has('unix') && empty(glob(data_dir . '/autoload/plug.vim'))
    echo "Running on a Unix Machine, installing vim plug"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

elseif has('win32') && empty(glob(data_dir . '/autoload/plug.vim'))
    echo "Running on a Windows Machine, installing vim plug"
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

endif

let pluginPath = stdpath('config') . '/autoload/plugged'
call plug#begin(pluginPath)

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " Colorscheme
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'folke/tokyonight.nvim'
    Plug 'tanvirtin/monokai.nvim'
    Plug 'shaunsingh/nord.nvim'
    Plug 'marko-cerovac/material.nvim'

    " Statusline
    Plug 'nvim-lualine/lualine.nvim'

    " Git stuff
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'

    " nvim-tree
    Plug 'kyazdani42/nvim-tree.lua'

    " Start page
    Plug 'mhinz/vim-startify'

    " Commenter
    Plug 'tpope/vim-commentary'

    " Auto pairs
    Plug 'windwp/nvim-autopairs'

    " Auto-Complete
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer' " buffer completions
    Plug 'hrsh7th/cmp-path' " path completions
    Plug 'hrsh7th/cmp-cmdline' " cmdline completions

    " Snippets
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'

    " Markdown Preview
    Plug 'npxbr/glow.nvim'

    " Tresitter
    Plug 'nvim-treesitter/nvim-treesitter'

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-media-files.nvim'

    Plug 'folke/trouble.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

call plug#end()
