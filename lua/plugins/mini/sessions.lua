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

		vim.keymap.set("n", "<leader>wl", "<CMD>lua MiniSessions.select()<CR>", { desc = "List Sessions" })
		vim.keymap.set("n", "<leader>wd", function()
			local input = vim.fn.input("Delete Session: ")

			if input and input ~= "" then
				MiniSessions.delete(input)
			end
		end, { desc = "Delete Session" })
		vim.keymap.set("n", "<leader>wR", function()
			local input = vim.fn.input("Restore Session: ")

			if input and input ~= "" then
				MiniSessions.read(input)
			end
		end, { desc = "Restore Specific Session" })
		vim.keymap.set(
			"n",
			"<leader>wr",
			"<CMD>lua MiniSessions.read('default')<CR>",
			{ desc = "Restore Default Session" }
		)
		vim.keymap.set("n", "<leader>wS", function()
			local input = vim.fn.input("Save Session: ")

			if input and input ~= "" then
				MiniSessions.write(input)
			end
		end, { desc = "Save Specific Session" })
		vim.keymap.set(
			"n",
			"<leader>ws",
			"<CMD>lua MiniSessions.write('default')<CR>",
			{ desc = "Save Default Session" }
		)
	end,
}
