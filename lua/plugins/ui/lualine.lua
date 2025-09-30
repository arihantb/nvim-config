return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	config = function()
		local lualine = require("lualine")
		local constants = require("config.constants")
		local theme = require(string.format("lualine.themes.%s", vim.g.colors_name or "auto"))

		local mixLine = function()
			local space_pat = [[\v^ +]]
			local tab_pat = [[\v^\t+]]
			local space_indent = vim.fn.search(space_pat, "nwc")
			local tab_indent = vim.fn.search(tab_pat, "nwc")
			local mixed = (space_indent > 0 and tab_indent > 0)
			local mixed_same_line

			if not mixed then
				mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], "nwc")
				mixed = mixed_same_line > 0
			end

			if not mixed then
				return ""
			end

			if mixed_same_line ~= nil and mixed_same_line > 0 then
				return "MIX:" .. mixed_same_line
			end

			local space_indent_cnt = vim.fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
			local tab_indent_cnt = vim.fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total

			if space_indent_cnt > tab_indent_cnt then
				return "MIX:" .. tab_indent
			else
				return "MIX:" .. space_indent
			end
		end

		local location = function()
			local row, col = unpack(vim.api.nvim_win_get_cursor(0))
			local total = vim.api.nvim_buf_line_count(0)

			return string.format("%s/%s:%s", row, total, col)
		end

		local custom_lualine = function(funcs, color)
			return {
				function()
					local results = {}

					for _, func in pairs(funcs) do
						local new_str = func()

						if new_str and new_str ~= "" then
							table.insert(results, new_str)
						end
					end

					return " " .. table.concat(results, " │ ") .. " "
				end,
				padding = 0,
				separator = "",
				color = color,
			}
		end

		local wordCount = {
			function()
				local wc = vim.fn.wordcount()
				local visual_chars = wc.visual_chars

				if visual_chars then
					return string.format("󰈭  %s ", visual_chars)
				else
					return ""
				end
			end,
			separator = "",
			padding = 0,
			color = { fg = theme.replace.a.bg },
		}

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn", "info", "hint" },
			diagnostics_color = {
				error = { fg = "#BF3100", bg = "" },
				warn = { fg = "#C3B11A", bg = "" },
				info = { fg = "#689AFD", bg = "" },
				hint = { fg = "#79C0FF", bg = "" },
			},
			symbols = {
				error = constants.symbolMap.ERROR .. " ",
				warn = constants.symbolMap.WARN .. " ",
				info = constants.symbolMap.INFO .. " ",
				hint = constants.symbolMap.HINT .. " ",
			},
			colored = true,
			update_in_insert = false,
			always_visible = false,
		}

		local aerial = {
			"aerial",
			depth = nil,
			dense = true,
			dense_sep = ".",
		}

		local progress = require("lualine.components.progress")

		local mode = function()
			local mode_code = vim.api.nvim_get_mode().mode
			return "  " .. constants.modeMap[mode_code] or mode_code
		end

		local filename = {
			"filename",
			file_status = true,
			newfile_status = true,
			path = 0,
			shorting_target = 40,
			symbols = {
				modified = constants.symbolMap.MODIFIED_2 .. " ",
				readonly = constants.symbolMap.DELETED_2 .. " " .. constants.symbolMap.LOCK,
				unnamed = "[No Name]",
				newfile = "[New]",
			},
		}

		local diff = {
			"diff",
			symbols = {
				added = constants.symbolMap.ADDED_2 .. " ",
				modified = constants.symbolMap.MODIFIED_2 .. " ",
				removed = constants.symbolMap.DELETED_2 .. " ",
			},
			color = { bg = theme.replace.a.fg },
		}

		local fileformat = function()
			local symbols = {
				unix = "LF",
				dos = "CRLF",
				mac = "CR",
			}

			return symbols[vim.o.fileformat]
		end

		local encoding = function()
			return vim.o.encoding
		end

		lualine.setup({
			options = {
				icons_enabled = true,
				component_separators = "",
				section_separators = "",
				disabled_filetypes = {
					statusline = { "alpha" },
					winbar = { "alpha", "aerial", "neo-tree", "nerdtree", "NvimTree" },
				},
				globalstatus = true,
				refresh = { statusline = 5000, tabline = 0, winbar = 500 },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = {
					{ "branch", icon = constants.symbolMap.BRANCH .. " ", color = { bg = theme.normal.b.bg } },
				},
				lualine_c = { diff, filename },
				lualine_x = {
					wordCount,
					custom_lualine(
						{ require("recorder").recordingStatus, progress, location },
						{ bg = theme.replace.a.fg }
					),
					{ "filesize", color = { fg = theme.normal.a.bg } },
				},
				lualine_y = { "filetype" },
				lualine_z = {
					custom_lualine({
						fileformat,
						encoding,
						mixLine,
					}, {}),
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			winbar = {
				lualine_a = { diagnostics },
				lualine_b = {},
				lualine_c = { aerial },
				lualine_x = {
					{
						function()
							return " "
						end,
						padding = 0,
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = { diagnostics },
				lualine_b = {},
				lualine_c = { aerial },
				lualine_x = {
					{
						function()
							return " "
						end,
						padding = 0,
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
