return {
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local todo_comments = require("todo-comments")

			todo_comments.setup({
				keywords = {
					FIX = {
						icon = "", -- icon used for the sign, and in search results
						color = "error", -- can be a hex color, or a named color
						alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- set of keywords that all map to FIX
					},
					TODO = { icon = "", color = "info" },
					HACK = { icon = "", color = "warning", alt = { "DON'T SKIP" } },
					WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = "󰅒", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = "󰈙", color = "hint", alt = { "INFO", "READ", "COLORS" } },
					TEST = { icon = "", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				},
			})

			-- keymaps to jump between todos --
			vim.keymap.set("n", "]t", function()
				todo_comments.jump_next()
			end)
			vim.keymap.set("n", "[t", function()
				todo_comments.hump_prev()
			end)
		end,
	},
}
