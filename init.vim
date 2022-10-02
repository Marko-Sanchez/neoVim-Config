let $homepath = stdpath('config')

if has('unix')

    source $homepath/general/settings.vim
    source $homepath/vim-plug/plugins.vim
    source $homepath/plug-config/start-screen.vim
    source $homepath/luaSetup.lua

elseif has('win32')

    source $homepath\general\settings.vim
    source $homepath\vim-plug\plugins.vim
    source $homepath\plug-config\start-screen.vim
    source $homepath\luaSetup.lua
endif
