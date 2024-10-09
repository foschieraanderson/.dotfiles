local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
	print("Installing lazy...")
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, "lazy")
if not status then
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
keymap("n", "<A-l>", "<cmd>Lazy<cr>", { desc = "Open lazy dashboard" })
