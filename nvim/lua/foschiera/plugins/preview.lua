return {
	"henriklovhaug/Preview.nvim",
	cmd = { "Preview" },
	config = function()
		require("preview").setup({})

		local keymap = vim.keymap.set
		keymap("n", "<leader>md", ":Preview<CR>", { silent = true, desc = "Preview Markdown File" })
	end,
}
