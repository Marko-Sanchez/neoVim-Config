[![Neovim](https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png)](https://neovim.io)

![Linux](https://img.shields.io/badge/Linux-Ubuntu-critical)
![nvim](https://img.shields.io/static/v1?label=Neovim&message=v0.6.1&color=darkgreen)

Custom Neovim v0.6.1 configuration for quick setup. Moving from vim script to lua.

Features
--------
- start page
- colorscheme
- Git intergration
- LSP
- tab-completion with code snippets, definitions, declarations.
- lsp diagnostics

Project Layout
--------------

    ├─ general/         Defualt neovim settings
    ├─ plug-config/     Plugin settings
    ├─ lua/user/        lua files
    ├─ vim-plug/        Plugin Installaion
    ├─ autoload/        Vim-plug folder
    │  ├─ plugged/      Contains plugin files
    └─ init.vim         Source all files from plug-config/ into init.vim

Installaion and Guide
---------------------
This Installaion uses Neovim v0.6.1, installed via appImage; Using the fallowing steps:

### Steps

1. mkdir -p ~/appimage
2. mkdir -p ~/usr/bin
3. wget -P ~/appimage 'https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage'
    - safer: grab tar from [neovim tag](https://github.com/neovim/neovim/releases/tag/v0.6.1)
4. chmod u+x ~/appimage/nvim.appimage
5. echo "alias nvim="~/appimage/nvim.appimage"" >> ~/.bashrc

Run `:checkhealth` you will want python2 & python3 support incase some future package might need it.
The guide used to configure neovim was fallowed from [ChrisAtMachine](https://www.youtube.com/c/ChrisAtMachine/videos).
