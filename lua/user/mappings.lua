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

-- Lsp mappings
keymap("n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
keymap("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
keymap("n", "<leader>ll", "<cmd>lua vim.lsp.inlay_hints(not vim.lsp.inlay_hint.is_enabled())<cr>", opts)

-- Trouble Mappings
keymap("n", "<leader>t", "<cmd>Trouble diagnostics toggle mydiagnostics<cr>", opts)
keymap("n", "<leader>tq", "<cmd>Trouble quickfix toggle<cr>", opts)
keymap("n", "<leader>tr", "<cmd>Trouble lsp_references toggle<cr>", opts)
keymap("n", "<leader>td", "<cmd>Trouble lsp_definitions toggle<cr>", opts)

-- NvimTree Mappings
keymap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)

-- Telescope Mappings
keymap("n", "<leader>fd", "<cmd>Telescope diagnostics theme=dropdown<cr>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep theme=dropdown<cr>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope colorscheme theme=dropdown<cr>", opts)

-- Gitsigns mappings
keymap("n", "<leader>hm", "<cmd>Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>hn", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>hh", "<cmd>Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>hl", "<cmd>Gitsigns toggle_signs<CR>", opts)
keymap("n", "<leader>hb", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
