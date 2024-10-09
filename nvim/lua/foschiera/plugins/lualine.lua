return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

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

		local lualine_theme = {
			normal = {
				a = { bg = theme.blue, fg = theme.bg, gui = "bold" },
				b = { bg = theme.gray, fg = theme.fg },
				c = { bg = theme.bg, fg = theme.fg },
			},
			insert = {
				a = { bg = theme.green, fg = theme.bg, gui = "bold" },
				b = { bg = theme.gray, fg = theme.fg },
				c = { bg = theme.bg, fg = theme.fg },
			},
			visual = {
				a = { bg = theme.magenta, fg = theme.bg, gui = "bold" },
				b = { bg = theme.gray, fg = theme.fg },
				c = { bg = theme.bg, fg = theme.fg },
			},
			command = {
				a = { bg = theme.yellow, fg = theme.bg, gui = "bold" },
				b = { bg = theme.gray, fg = theme.fg },
				c = { bg = theme.bg, fg = theme.fg },
			},
			replace = {
				a = { bg = theme.red, fg = theme.bg, gui = "bold" },
				b = { bg = theme.gray, fg = theme.fg },
				c = { bg = theme.bg, fg = theme.fg },
			},
			inactive = {
				a = { bg = theme.inactive_bg, fg = theme.fg, gui = "bold" },
				b = { bg = theme.inactive_bg, fg = theme.fg },
				c = { bg = theme.inactive_bg, fg = theme.fg },
			},
		}

		local empty = require("lualine.component"):extend()
		function empty:draw(default_highlight)
			self.status = ""
			self.applied_separator = ""
			self:apply_highlights(default_highlight)
			self:apply_section_separators()
			return self.status
		end

		-- Put proper separators and gaps between components in sections
		local function process_sections(sections)
			for name, section in pairs(sections) do
				local left = name:sub(9, 10) < "x"
				for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
					if name == "lualine_a" or name == "lualine_y" then
						table.insert(section, pos * 2, { empty, color = { fg = theme.fg, bg = theme.dark } })
					end
				end
				for id, comp in ipairs(section) do
					if type(comp) ~= "table" then
						comp = { comp }
						section[id] = comp
					end
					comp.separator = left and { right = "" } or { left = "" }
				end
			end
			return sections
		end

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = lualine_theme,
			},
			sections = process_sections({
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
				},
				lualine_c = {
					{
						"diagnostics",
						source = { "nvim" },
						sections = { "error" },
						diagnostics_color = { error = { bg = theme.red, fg = theme.gray } },
					},
					{
						"diagnostics",
						source = { "nvim" },
						sections = { "warn" },
						diagnostics_color = { warn = { bg = theme.orange, fg = theme.gray } },
					},
					{ "filename", file_status = false, path = 1 },
					{
						"%w",
						cond = function()
							return vim.wo.previewwindow
						end,
					},
					{
						"%r" .. " ",
						cond = function()
							return vim.bo.readonly
						end,
					},
					{
						"%q",
						cond = function()
							return vim.bo.buftype == "quickfix"
						end,
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
					{ "encoding" },
					{ "fileformat" },
				},
				lualine_y = { "filetype" },
				lualine_z = { "%l:%c", "%p%%" },
			}),
			inactive_sections = {
				lualine_c = { "%f %y %m" },
				lualine_x = {},
			},
		})
	end,
}
