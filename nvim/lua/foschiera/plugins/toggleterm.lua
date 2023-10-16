return {
	"akinsho/toggleterm.nvim",
	version = "*",

	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			-- size can be a number or function which is passed the current terminal
			size = function(term) -- | 20
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<C-\>]],
			-- on_create = fun(t: Terminal), -- function to run when the terminal is first created
			-- on_open = fun(t: Terminal), -- function to run when the terminal opens
			-- on_close = fun(t: Terminal), -- function to run when the terminal closes
			-- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
			-- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
			-- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
			hide_numbers = true, -- hide the number column in toggleterm buffers
			shade_filetypes = {},
			autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
			-- highlights = {
			--   -- highlights which map to a highlight group name and a table of it's values
			--   -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
			--   Normal = {
			--     guibg = "<VALUE-HERE>",
			--   },
			--   NormalFloat = {
			--     link = 'Normal'
			--   },
			--   FloatBorder = {
			--     guifg = "<VALUE-HERE>",
			--     guibg = "<VALUE-HERE>",
			--   },
			-- },
			shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
			shading_factor = 2, -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			persist_size = true,
			persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
			direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float',
			close_on_exit = true, -- close the terminal window when the process exits
			-- Change the default shell. Can be a string or a function returning a string
			shell = vim.o.shell,
			auto_scroll = true, -- automatically scroll to the bottom on terminal output
			-- This field is only relevant if direction is set to 'float'
			float_opts = {
				-- The border key is *almost* the same as 'nvim_open_win'
				-- see :h nvim_open_win for details on borders however
				-- the 'curved' border is a custom border type
				-- not natively supported but implemented in this plugin.
				border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
				-- like `size`, width and height can be a number or function which is passed the current terminal
				-- width = <value>,
				-- height = <value>,
				winblend = 0,
				-- zindex = <value>,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		keymap("t", "<ESC>", "<Cmd>ToggleTerm<CR>", opts)

		-- Terminal:new {
		--   cmd = string -- command to execute when creating the terminal e.g. 'top'
		--   direction = string -- the layout for the terminal, same as the main config options
		--   dir = string -- the directory for the terminal
		--   close_on_exit = bool -- close the terminal window when the process exits
		--   highlights = table -- a table with highlights
		--   env = table -- key:value table with environmental variables passed to jobstart()
		--   clear_env = bool -- use only environmental variables from `env`, passed to jobstart()
		--   on_open = fun(t: Terminal) -- function to run when the terminal opens
		--   on_close = fun(t: Terminal) -- function to run when the terminal closes
		--   auto_scroll = boolean -- automatically scroll to the bottom on terminal output
		--   -- callbacks for processing the output
		--   on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
		--   on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
		--   on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
		-- }
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

		function _lazygit_toggle()
			lazygit:toggle()
		end

		keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", opts)
	end,
}
