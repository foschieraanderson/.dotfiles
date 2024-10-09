-- Shorten function name
local opt = vim.opt

-- encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.showtabline = 4 -- always show tabs
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true

-- line wrapping
opt.wrap = true -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true -- highlight all matches on previous search pattern

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- mouse
opt.mouse = "a" -- allow the mouse to be used in neovim

-- timeout updates
opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 300 -- faster completion (4000ms default)

-- Appearance ----------------------------------------

-- turn on termguicolors
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

opt.showmode = false -- we don't need to see things like -- INSERT -- anymore

-- backspace
opt.backspace = { "start", "eol", "indent" } -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- scroll off
opt.scrolloff = 5 -- minimal number of screen lines to keep above and below the cursor

-- turn off swapfile
opt.swapfile = false -- disable creates a swapfile

-- cmd
opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
