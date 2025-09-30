return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = {},
		dim = {},
		indent = {},
		scope = {},
		quickfile = {},
		scroll = {},
		picker = {
			matchers = {
				frecency = true,
				cwd_bonus = true,
			},
			formatters = {
				file = {
					filename_first = false,
					filename_only = false,
					icon_width = 2,
				},
			},
			layout = {
				preset = "telescope",
				cycle = false,
			},
			layouts = {
				select = {
					preview = false,
					layout = {
						backdrop = false,
						width = 0.6,
						min_width = 80,
						height = 0.4,
						min_height = 10,
						box = "vertical",
						border = "rounded",
						title = "{title}",
						title_pos = "center",
						{ win = "input", height = 1, border = "bottom" },
						{ win = "list", border = "none" },
						{ win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
					},
				},
				telescope = {
					reverse = true,
					layout = {
						box = "horizontal",
						backdrop = false,
						width = 0.8,
						height = 0.9,
						border = "none",
						{
							box = "vertical",
							{ win = "list", title = " Results ", title_pos = "center", border = "rounded" },
							{
								win = "input",
								height = 1,
								border = "rounded",
								title = "{title} {live} {flags}",
								title_pos = "center",
							},
						},
						{
							win = "preview",
							title = "{preview:Preview}",
							width = 0.50,
							border = "rounded",
							title_pos = "center",
						},
					},
				},
				ivy = {
					layout = {
						box = "vertical",
						backdrop = false,
						width = 0,
						height = 0.4,
						position = "bottom",
						border = "top",
						title = "{title} {live} {flags}",
						title_pos = "left",
						{
							box = "horizontal",
							{ win = "list", border = "none" },
							{ win = "preview", title = "{preview}", width = 0.5, border = "left" },
						},
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>lg",
			function()
				require("snacks").lazygit()
			end,
		},
		{
			"<leader>gl",
			function()
				require("snacks").lazygit.log()
			end,
		},
		{
			"<leader>rN",
			function()
				require("snacks").rename.rename_file()
			end,
		},
		{
			"<leader>dB",
			function()
				require("snacks").bufdelete()
			end,
		},
		{
			"<leader>pf",
			function()
				require("snacks").picker.files()
			end,
		},
		{
			"<leader>pc",
			function()
				require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
			end,
		},
		{
			"<leader>ps",
			function()
				require("snacks").picker.grep()
			end,
		},
		{
			"<leader>pws",
			function()
				require("snacks").picke.rgrep_word()
			end,
		},
		{
			"<leader>pk",
			function()
				require("snacks").picker.keymaps({ layout = "ivy" })
			end,
		},
		{
			"<leader>gbr",
			function()
				require("snacks").picker.git_branches({ layout = "select" })
			end,
		},
		{
			"<leader>cs",
			function()
				require("snacks").picker.colorschemes({ layout = "ivy" })
			end,
		},
		{
			"<leader>vh",
			function()
				require("snacks").picker.help()
			end,
		},
	},
}
