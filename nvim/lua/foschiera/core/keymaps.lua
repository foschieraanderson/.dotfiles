local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Remap , as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Normal Mode --------------------
-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- Select all
keymap('n', '<A-a>', 'gg<S-v>G',  { desc = "Select all" })

-- Close buffer
keymap('n', '<C-X>', ':bd<CR>', opts, { desc= "Close current buffer" })

-- clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts, { desc = "Resize up" })
keymap("n", "<C-Down>", ":resize +2<CR>", opts, { desc = "Resize down" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts, { desc = "Resize left" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts, { desc = "Resize right" })

-- Move text up and down
keymap('n', '<s-Up>', ':m -2<CR>', opts, { desc = "Move text up" })
keymap('n', '<s-Down>', ':m +1<CR>', opts, { desc = "Move text down" })

-- Visual Mode --------------------
-- Move text up and down
keymap("v", "<s-Up>", ":m '<-2<CR>gv=gv", opts, { desc = "Move text up" })
keymap("v", "<s-Down>", ":m '>+1<CR>gv=gv", opts, { desc = "Move text down" })

-- Visual Block Mode --------------------
-- Move text up and down
keymap("x", "<s-Up>", ":m '<-2<CR>gv=gv", opts, { desc = "Move text up" })
keymap("x", "<s-Down>", ":m '>+1<CR>gv=gv", opts, { desc = "Move text down" })
