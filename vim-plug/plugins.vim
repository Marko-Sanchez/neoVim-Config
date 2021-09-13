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
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Colorscheme
    Plug 'junegunn/seoul256.vim'
    Plug 'folke/tokyonight.nvim'
    " Statusline
    Plug 'itchyny/lightline.vim'
    " Git stuff
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    " Start page
    Plug 'mhinz/vim-startify'
    " Commenter
    Plug 'tpope/vim-commentary'
    " Auto-Complete
    Plug 'hrsh7th/nvim-compe'
    " Markdown Preview
    Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}
    " Tresitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
call plug#end()
