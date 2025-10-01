return {
	"jiaoshijie/undotree",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{ "<leader>uu", "<CMD>lua require('undotree').toggle()<CR>", desc = "Toggle UndoTree" },
	},
}
