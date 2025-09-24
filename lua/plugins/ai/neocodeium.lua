return {
	"monkoose/neocodeium",
	event = "VeryLazy",
	config = function()
		local neocodeium = require("neocodeium")
		local neocodeiumCommands = require("neocodeium.commands")

		neocodeium.setup()

		vim.keymap.set("n", "<leader>nC", function()
			neocodeiumCommands.toggle()
		end, { desc = "Toggle Neocodeium" })
		vim.keymap.set("n", "<leader>nc", function()
			neocodeiumCommands.toggle_buffer()
		end, { desc = "Toggle Neocodeium Current Buffer" })

		vim.keymap.set("i", "<A-f>", function()
			neocodeium.accept()
		end, { desc = "Accept Suggestion" })
		vim.keymap.set("i", "<A-w>", function()
			neocodeium.accept_word()
		end, { desc = "Accept Word" })
		vim.keymap.set("i", "<A-a>", function()
			neocodeium.accept_line()
		end, { desc = "Accept Line" })
		vim.keymap.set("i", "<A-e>", function()
			neocodeium.cycle_or_complete()
		end, { desc = "Cycle or Complete" })
		vim.keymap.set("i", "<A-r>", function()
			neocodeium.cycle_or_complete(-1)
		end, { desc = "Cycle or Complete Previous" })
		vim.keymap.set("i", "<A-c>", function()
			neocodeium.clear()
		end, { desc = "Clear Suggestion" })
	end,
}
