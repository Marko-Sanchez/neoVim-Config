[![Neovim](https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png)](https://neovim.io)

[![Linux](https://img.shields.io/badge/Linux-Ubuntu-critical)]
[![nvim](https://img.shields.io/static/v1?label=Neovim&message=v0.5.0&color=brightgreen)]

Custom Neovim v0.5.0 configuration for quick setup.

Features
--------
- Autocomplete
- Neovim start page
- Seoul256 colorscheme
- Git intergration

Project Layout
--------------

    ├─ general/         Defualt Neovim settings & Mappings
    ├─ plug-config/     Plugin settings
    ├─ vim-plug/        Plugin Installaion
    ├─ autoload/        Vim-plug folder
    │  ├─ plugged/      Containts plugin files
    └─ init.vim         Source all files from plug-config/ into init.vim

Installaion and Guide
---------------------
This Installaion uses Neovim v0.5.0, installed via appImage; Using the fallowing steps:
### Steps
1. mkdir -p ~/appimage
2. mkdir -p ~/usr/bin
3. wget -P ~/appimage 'https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage'
4. chmod u+x ~/appimage/nvim.appimage
5. echo "alias nvim="~/appimage/nvim.appimage"" >> ~/.bashrc

Running `:checkhealth` you will want python2 & python3 support incase some future package might need it.
The guide used to configure neovim was fallowed from [ChrisAtMachine](https://www.youtube.com/c/ChrisAtMachine/videos).

*Note: LSP is not installed in this repo, that is to prevent this build from being to complex*
