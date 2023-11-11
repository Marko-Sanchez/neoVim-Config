[![Neovim](https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png)](https://neovim.io)

![Linux](https://img.shields.io/badge/Linux-Ubuntu-critical)
![nvim](https://img.shields.io/static/v1?label=Neovim&message=v0.8.2&color=darkgreen)

Custom Neovim v0.8.2 configuration for quick setup.

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

    .
    ├── autoload     location where plugin data gets installed too
    ├── general      default vim settings
    ├── lua          lua files containing plugin configurations
    │   └── user
    │       └── lsp  lsp config files
    └── vim-plug     vim-plug installation source

Installation and Guide
---------------------

## Prerequisites

In order to clone this repository, you need to have `git` and `curl` installed. If you are installing on a windows
machine you will need to have VCRUNTIME140.dll downloaded and installed, this is needed to run neovim and vim. You
can find installation for this by on microsofts websites "Visual Studio C++ Redistributable."

## Linux

If you are using versions above, >=, Ubuntu Jammy or if your distro is up to date on it's packages,
you can try installing neovim via a package manager. For ubuntu jammy >=, using snap or apt will get you neovim
v0.8.2 as of the date this read me was updated. Although, this might not be the case for later version therefore installing via
appimage or from source will be needed. My perferred way is using an appimage, which I will go through the steps of installing.

1. Visit the [NeoVim github] page for the latest stable version, in my case v0.8.2 and download the app.image.
2. Once downloaded, give user execute permissions to the app image via `chmod u+x ~/Downloads/nvim.appimage`
    *these instructions can also be found in the download/release page of neovim*
3. Run `nvim.appimage --version` to see if it works fine, you can also change the appimage name to just `nvim`
   I typically place the appimage under ~/usr/bin/
4. To call nvim, globally make an alias to it. This can be done in your .bashrc file:
    echo "alias nvim="~/usr/bin/nvim"" >> ~/.bashrc
    *you can also just open .bashrc in notepad and write the alias manually, although there might be better ways of calling nvim globally idk*
5. Finally, clone this repository `git clone <link-to-this-repo> ~/.config/nvim`

Before running neovim, you need to install the plugin manager `vim-plug` the file vim-plug/plugins.vim tries to do this for you when runing neovim,
in case that does not work the work-around is `curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >> ~/.config/nvim/autoload/plug.vim`
Once downloaded, start neovim and run `:PlugInstall` if plug install command does not show up vim-plug was not installed correctly.

## Windows

On Windows, the first step is to visit the neovim github package to download latest stable version of neovim. Once downloaded, you can create a folder
in your C drive called C:\nvim and extract the zip folder to that location, any location you wish to extract to is fine. Note as mentioned in [prerequisites](##Prerequisites)
you will need to have VCRUNTIME140.dll to run neovim properly. To run nvim from anywhere in the terminally, add the path to `nvim.exe` in your Enviroment Variables. You can access
Enviroment Variables by going to Advanced Settings > Enviroment Variables, and in PATH paste the path to `nvim.exe` ex. C:\nvim\nvim.exe you would paste C:\nvim at the end of PATH.

Once you finished installing neovim, you can go ahead and clone this repository. I clone the repo to `C:\Users\<user-profile>\AppData\Local\nvim`, once you clone the repo you can
follow similiar steps as those under [linux](##Linux)


[NeoVim github]: https://github.com/neovim/neovim/releases/
