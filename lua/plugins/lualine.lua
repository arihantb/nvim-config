return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		local mode = {
			"mode",
			fmt = function(str)
				return "  " .. str
			end,
		}

		local filename = {
			"filename",
			file_status = true,
			path = 0,
			symbols = {
				modified = " ",
				readonly = " ",
			},
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " },
		}

		lualine.setup({
			icons_enabled = true,
			sections = {
				lualine_a = { mode },
				lualine_b = { "branch" },
				lualine_c = { diff, filename },
				lualine_x = { { "filetype" } },
			},
		})
	end,
}
