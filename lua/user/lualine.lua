
require('lualine').setup ({
  options = {
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
  },
  extensions = {
    'nvim-tree'
  },
  sections = {
    lualine_a = {{function() return '★' end, padding = {left = 0, right = 1} }, {'mode'} },
    lualine_b = {{'branch'} , {'diff'}, {'diagnostics', sources = {'nvim_lsp'}} },
    lualine_c = {{'filename'}},
    lualine_x = {{'encoding'}, {'fileformat'}, {'filetype'} },
    lualine_y = {{'progress'}, {'filesize'} },
    lualine_z = {{'location'}, {function() return '★' end, padding = {left = 0, right = 1} } }

  }
})
