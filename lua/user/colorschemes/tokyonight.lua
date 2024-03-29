-- Example config in Lua
vim.g.tokyonight_style = "dark"
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
