return {
	"jiaoshijie/undotree",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{ "<leader>u", "<CMD>lua require('undotree').toggle()<CR>" },
	},
}
