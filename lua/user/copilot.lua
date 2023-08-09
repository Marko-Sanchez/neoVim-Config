vim.g.copilot_no_tab_map = true

vim.keymap.set("i", "<C-Left>", "copilot#Dismiss()", { expr = true, replace_keycodes = false, silent = true })
vim.keymap.set("i", "<C-Right>", "copilot#Accept()", { expr = true, replace_keycodes = false, silent = true })
vim.keymap.set("i", "<C-Up>", "copilot#Previous()", { expr = true, replace_keycodes = false, silent = true })
vim.keymap.set("i", "<C-Down>", "copilot#Next()", { expr = true, replace_keycodes = false, silent = true })
