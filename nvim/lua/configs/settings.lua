vim.cmd([[ set encoding=utf8 ]])
vim.cmd([[ set hidden ]])
vim.cmd([[ set nu! ]])
vim.cmd([[ set relativenumber ]])
vim.cmd([[ set mouse=a ]])
vim.cmd([[ set wildmenu ]])
vim.cmd([[ set confirm ]])
vim.cmd([[ set inccommand=split ]])
vim.cmd([[ set smartcase ]])
vim.cmd([[ set incsearch ]])
vim.cmd([[ set hlsearch ]])
vim.cmd([[ set title ]])
vim.cmd([[ set t_Co=256 ]])
vim.cmd([[ set autoread ]])
vim.cmd([[ set cc=80 ]])
vim.cmd([[ set wrap ]])
vim.cmd([[ set autoindent ]])
vim.cmd([[ set smarttab ]])
vim.cmd([[ set tabstop=4 ]])
vim.cmd([[ set softtabstop=4 ]])
vim.cmd([[ set shiftwidth=4 ]])
vim.cmd([[ set expandtab ]])
vim.cmd([[ set guicursor= ]])
vim.cmd([[ set cursorline ]])
vim.cmd([[ syntax on ]])

vim.cmd([[ set bg=dark ]])
vim.cmd([[ set termguicolors ]])
vim.cmd([[ colorscheme gruvbox ]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

