return {
	"nvim-mini/mini.splitjoin",
	version = false,
	config = function()
		local MiniSplitJoin = require("mini.splitjoin")

		MiniSplitJoin.setup({
			mappings = { toggle = "" },
		})

		vim.keymap.set({ "n", "x" }, "ss", function()
			MiniSplitJoin.join()
		end, { desc = "Join Arguments" })
		vim.keymap.set({ "n", "x" }, "sj", function()
			MiniSplitJoin.split()
		end, { desc = "Split Arguments" })
	end,
}
