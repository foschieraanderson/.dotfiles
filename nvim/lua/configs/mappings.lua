vim.g.mapleader = ','  -- 'vim.g' sets global variables


vim.api.nvim_set_keymap('n', '<s-Down>', ':m +1<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<s-Up>', ':m -2<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<C-X>', ':bd<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<C-P>', ':Telescope find_files<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-F>', ':Telescope live_grep<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-B>', ':Telescope buffers<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-H>', ':Telescope help_tags<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<F1>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F2>', ':BufferLineCycleNext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F3>', ':BufferLineMovePrev<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F4>', ':BufferLineMoveNext<CR>', { silent = true })

vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", { silent = true })
vim.api.nvim_set_keymap("x", "<leader>c", "<Plug>kommentary_visual_default", { silent = true })
