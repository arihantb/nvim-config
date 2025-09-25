return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- NOTE: docs @ https://github.com/folke/snacks.nvim/blob/main/docs --
			quickfile = {
				enabled = true,
				exclude = { "latex" },
			},
			picker = {
				enabled = true,
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
						reverse = true, -- set to false for search bar to be on top
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
			dashboard = {
				enabled = true,
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{
						pane = 2,
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						indent = 2,
						padding = 1,
					},
					{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{
						pane = 2,
						icon = " ",
						title = "Git Status",
						section = "terminal",
						enabled = function()
							return Snacks.git.get_root() ~= nil
						end,
						cmd = "git status --short --branch --renames",
						height = 5,
						padding = 1,
						ttl = 5 * 60,
						indent = 3,
					},
					{ section = "startup" },
				},
			},
		},
		keys = {
			-- lazygit --
			{
				"<leader>lg",
				function()
					require("snacks").lazygit()
				end,
			},
			-- lazygit logs --
			{
				"<leader>gl",
				function()
					require("snacks").lazygit.log()
				end,
			},
			-- fast rename current file --
			{
				"<leader>rN",
				function()
					require("snacks").rename.rename_file()
				end,
			},
			-- delete or close buffer (confirm) --
			{
				"<leader>dB",
				function()
					require("snacks").bufdelete()
				end,
			},

			-- snacks picker --
			-- find files (snacks picker) --
			{
				"<leader>pf",
				function()
					require("snacks").picker.files()
				end,
			},
			-- find config file --
			{
				"<leader>pc",
				function()
					require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
				end,
			},
			-- grep word --
			{
				"<leader>ps",
				function()
					require("snacks").picker.grep()
				end,
			},
			-- search visual selection or word --
			{
				"<leader>pws",
				function()
					require("snacks").picke.rgrep_word()
				end,
			},
			-- search keymaps (snacks picker) --
			{
				"<leader>pk",
				function()
					require("snacks").picker.keymaps({ layout = "ivy" })
				end,
			},
			-- pick and switch git branches --
			{
				"<leader>gbr",
				function()
					require("snacks").picker.git_branches({ layout = "select" })
				end,
			},
			-- pick color schemes (non-persistent) --
			{
				"<leader>cs",
				function()
					require("snacks").picker.colorschemes({ layout = "ivy" })
				end,
			},
			-- man pages --
			{
				"<leader>vh",
				function()
					require("snacks").picker.help()
				end,
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>pt",
				function()
					require("snacks").picker.todo_comments()
				end,
			},
			{
				"<leader>pT",
				function()
					require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
				end,
			},
		},
	},
}
