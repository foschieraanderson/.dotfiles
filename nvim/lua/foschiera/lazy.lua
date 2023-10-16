local fn = vim.fn

-- Automatically install lazy
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
	print("Installing lazy...")
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, "lazy")
if (not status) then
  print("Lazy is not installed")
  return
end

-- require("lazy").setup({ { import = "foschiera.plugins" }, { import = "foschiera.plugins.lsp" } }, {
lazy.setup({ { import = "foschiera.plugins" }, { import = "foschiera.plugins.lsp" } }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

-- Shorten function name
local keymap = vim.keymap.set
-- Open lazy dash
keymap('n', '<A-l>', '<cmd>Lazy<cr>',  { desc = "Open lazy dashboard" })
