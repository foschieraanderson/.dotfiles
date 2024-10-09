return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local neotree = require("neo-tree")
		neotree.setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = true,
					hide_gitignored = true,
				},
			},
			window = {
				position = "float",
				-- width = 30,
			},
		})

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<C-n>", ":Neotree reveal=true toggle=true<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
	end,
}
