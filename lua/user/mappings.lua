local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Better tab navigation
keymap("n", "<TAB>", "gt", opts)
keymap("n", "<S-TAB>", "gT", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Trouble Mappings
keymap("n", "<leader>t", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", opts)
keymap("n", "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>", opts)
keymap("n", "<leader>td", "<cmd>TroubleToggle lsp_definitions<cr>", opts)

-- NvimTree Mappings
keymap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)

-- Telescope Mappings
keymap("n", "<leader>fd", "<cmd>lua require'telescope.builtin'.diagnostics(require('telescope.themes').get_dropdown({ preview = true }))<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ preview = true }))<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

-- Gitsigns mappings
keymap("n", "<leader>g[", "<cmd>Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>g]", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gr", "<cmd>Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gl", "<cmd>Gitsigns toggle_signs<CR>", opts)
keymap("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
