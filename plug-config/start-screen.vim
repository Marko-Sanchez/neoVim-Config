let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

" let g:startify_custom_header = [
" \' ███    ███  █████  ██████  ██   ██  ██████         █████ ',
" \' ████  ████ ██   ██ ██   ██ ██  ██  ██    ██       ██   ██',
" \' ██ ████ ██ ███████ ██████  █████   ██    ██ █████  ██████',
" \' ██  ██  ██ ██   ██ ██   ██ ██  ██  ██    ██            ██',
" \' ██      ██ ██   ██ ██   ██ ██   ██  ██████         █████',
" \]
