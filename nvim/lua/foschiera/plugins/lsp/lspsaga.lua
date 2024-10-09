return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},

	config = function()
		local saga = require("lspsaga")
		saga.setup({
			ui = {
				kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
				border = "rounded",
			},
			symbol_in_winbar = {
				enable = false,
			},
			lightbulb = {
				enable = false,
			},
			outline = {
				layout = "float",
			},
		})

		local diagnostic = require("lspsaga.diagnostic")
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }
		-- keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
		-- keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
		-- keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
		-- keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
		keymap("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
		keymap("n", "gd", "<Cmd>Lspsaga finder<CR>", opts)
		keymap("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
		keymap("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
		keymap("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)

		-- code action
		keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
	end,
}
