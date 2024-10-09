return {
	"OXY2DEV/markview.nvim",
	lazy = false, -- Recommended
	-- ft = "markdown" -- If you decide to lazy-load anyway

	dependencies = {
		-- You will not need this if you installed the
		-- parsers manually
		-- Or if the parsers are in your $RUNTIMEPATH
		"nvim-treesitter/nvim-treesitter",

		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local markview = require("markview")
		markview.setup({

			{
				-- Configuration table for the split window
				split_conf = {
					split = "right",
				},

				-- Filetypes where the plugin will be enabled
				filetypes = { "markdown", "quarto", "rmd", "md" },

				-- Buftypes to ignore
				buf_ignore = { "nofile" },

				-- Modes where preview is enabled
				modes = { "n", "no" },

				-- Modes where hybrid mode is enabled
				hybrid_modes = {},

				-- Functions to run on specific events
				callbacks = {
					on_enable = function(buf, win)
						-- Stuff to do when plugin is enabled
					end,
					on_disable = function(buf, win)
						-- Stuff to do when plugin is disabled
					end,

					on_mode_change = function(buf, win, mode)
						-- Stuff to do when mode changes(while
						-- the plugin is enabled)
					end,
				},

				-- Highlight groups for the plugin
				highlight_groups = {},

				-- Render configs
				-- They are explained in their own
				-- pages
				block_quotes = {},
				checkboxes = {},
				code_blocks = {},
				headings = {},
				horizontal_rules = {},
				html = {},
				inline_codes = {},
				links = {},
				list_items = {},
				tables = {},
			},
		})
	end,
}
