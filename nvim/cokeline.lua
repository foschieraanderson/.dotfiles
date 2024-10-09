return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- If you want devicons
	},

	config = function()
		local cokeline = require("cokeline")

		local get_hex = require("cokeline.hlgroups").get_hl_attr
		local mappings = require("cokeline/mappings")

		local errors_fg = get_hex("DiagnosticError", "fg")
		local warnings_fg = get_hex("DiagnosticWarn", "fg")
		local system_bg = get_hex("Normal", "bg")
		local system_fg = get_hex("Comment", "fg")

		local theme = {
			-- Catppuccin (Mocha)
			bg = "#1e1e2e",
			fg = "#cdd6f4",
			cyan = "#89dceb",
			dark = "#181825",
			gray = "#313244",
			magenta = "#cba6f7",
			pink = "#f5c2e7",
			red = "#f38ba8",
			green = "#a6e3a1",
			yellow = "#f9e2af",
			blue = "#89b4fa",
			orange = "#fab387",
			inactive_bg = "#585b70",
		}

		local components = {
			space = {
				text = " ",
				truncation = { priority = 1 },
			},
			two_spaces = {
				text = "  ",
				truncation = { priority = 1 },
			},
			sepbefore = {
				text = function(buffer)
					return buffer.index ~= 1 and "" or ""
				end,
				bg = function(buffer)
					return buffer.is_focused and theme.bg or theme.gray
				end,
				fg = system_bg,
				truncation = { priority = 1 },
			},
			sepafter = {
				text = "",
				bg = system_bg,
				fg = function(buffer)
					return buffer.is_focused and theme.bg or theme.gray
				end,
				truncation = { priority = 1 },
			},
			devicon = {
				text = function(buffer)
					return (mappings.is_picking_focus() or mappings.is_picking_close()) and buffer.pick_letter .. " "
						or buffer.devicon.icon
				end,
				fg = function(buffer)
					return (mappings.is_picking_focus() and theme.yellow)
						or (mappings.is_picking_close() and theme.red)
						or buffer.devicon.color
				end,
				style = function(_)
					return (mappings.is_picking_focus() or mappings.is_picking_close()) and "italic,bold" or nil
				end,
				truncation = { priority = 1 },
			},
			index = {
				text = function(buffer)
					return buffer.index .. ": "
				end,
				truncation = { priority = 1 },
			},
			unique_prefix = {
				text = function(buffer)
					return buffer.unique_prefix
				end,
				fg = system_fg,
				style = "italic",
				truncation = {
					priority = 3,
					direction = "left",
				},
			},
			filename = {
				text = function(buffer)
					return buffer.filename
				end,
				style = function(buffer)
					return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and "bold,underline")
						or (buffer.is_focused and "bold")
						or (buffer.diagnostics.errors ~= 0 and "underline")
						or nil
				end,
				truncation = {
					priority = 2,
					direction = "left",
				},
			},
			diagnostics = {
				text = function(buffer)
					return (buffer.diagnostics.errors ~= 0 and " 󰅚 " .. buffer.diagnostics.errors)
						or (buffer.diagnostics.warnings ~= 0 and "  " .. buffer.diagnostics.warnings)
						or ""
				end,
				fg = function(buffer)
					return (buffer.diagnostics.errors ~= 0 and errors_fg)
						or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
						or nil
				end,
				truncation = { priority = 1 },
			},
			close_or_unsaved_or_readonly = {
				text = function(buffer)
					return (buffer.is_modified and "●") or (buffer.is_readonly and "") or "󰅖"
				end,
				fg = function(buffer)
					return (buffer.is_modified and theme.yellow) or (buffer.is_readonly and theme.red) or nil
				end,
				delete_buffer_on_left_click = true,
				truncation = { priority = 1 },
			},
		}
		cokeline.setup({
			show_if_buffers_are_at_least = 1,
			buffers = {
				new_buffers_position = "next",
			},
			rendering = {
				max_buffer_width = 30,
			},
			default_hl = {
				fg = function(buffer)
					if buffer.is_focused then
						return theme.fg
					end
					return system_fg
				end,
				bg = function(buffer)
					if buffer.is_focused then
						return theme.bg
					end
					return theme.gray
				end,
			},

			sidebar = {
				filetype = { "NvimTree", "neo-tree" },
				components = {
					{
						text = function(buf)
							return buf.filetype
						end,
						fg = theme.yellow,
						bg = function()
							return get_hex("NvimTreeNormal", "bg")
						end,
						bold = true,
					},
				},
			},
			components = {
				components.sepbefore,
				components.space,
				components.devicon,
				components.space,
				-- components.index,
				components.unique_prefix,
				components.filename,
				components.diagnostics,
				components.space,
				components.close_or_unsaved_or_readonly,
				components.space,
				components.sepafter,
				-- components.two_spaces,
			},
		})

		-- set keymaps
		local keymap = vim.keymap.set

		keymap("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true })
		keymap("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true })
		keymap("n", "<Leader>p", "<Plug>(cokeline-switch-prev)", { silent = true })
		keymap("n", "<Leader>n", "<Plug>(cokeline-switch-next)", { silent = true })

		for i = 1, 9 do
			keymap("n", ("<F%s>"):format(i), ("<Plug>(cokeline-focus-%s)"):format(i), { silent = true })
			keymap("n", ("<Leader>%s"):format(i), ("<Plug>(cokeline-switch-%s)"):format(i), { silent = true })
		end
	end,
}
