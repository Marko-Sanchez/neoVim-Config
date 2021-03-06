let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename' : 'LightlineFilename',
      \ },
      \ }
function! LightlineFilename()
      return expand('%:p:h:t') . "/" . expand('%:f')
endfunction
