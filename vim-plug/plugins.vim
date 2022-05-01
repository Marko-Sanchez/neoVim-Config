" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " Colorscheme
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'folke/tokyonight.nvim'
    Plug 'tanvirtin/monokai.nvim'
    Plug 'shaunsingh/nord.nvim'
    Plug 'marko-cerovac/material.nvim'

    " Statusline
    Plug 'itchyny/lightline.vim'

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

    " Markdown Preview
    Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}

    " Tresitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

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
