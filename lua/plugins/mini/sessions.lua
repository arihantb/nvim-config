return {
	"nvim-mini/mini.sessions",
	version = false,
	config = function()
		local MiniSessions = require("mini.sessions")

		MiniSessions.setup({
			autoread = false,
			autowrite = false,
			file = "",
		})

		vim.keymap.set(
			"n",
			"<leader>wr",
			"<CMD>lua MiniSessions.read('session')<CR>",
			{ desc = "Restore Session for CWD" }
		)
		vim.keymap.set(
			"n",
			"<leader>ws",
			"<CMD>lua MiniSessions.write('session')<CR>",
			{ desc = "Save Session for CWD" }
		)
	end,
}
