return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		local ufo = require("ufo")

		ufo.setup({
			provider_selector = function(_, _, _)
				return { "treesitter", "indent" }
			end,
			open_fold_hl_timeout = 0,
		})

		vim.o.foldenable = true
		vim.o.foldcolumn = "0"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99

		vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open All Folds" })
		vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close All Folds" })
	end,
}
