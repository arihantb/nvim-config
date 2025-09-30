return {
	"nvim-mini/mini.map",
	version = false,
	keys = {
		{ "<leader>mt", "<CMD>lua require('mini.map').toggle()<CR>", desc = "Toggle Mini Map" },
		{ "<leader>mo", "<CMD>lua require('mini.map').open()<CR>", desc = "Open Mini Map" },
		{ "<leader>mc", "<CMD>lua require('mini.map').close()<CR>", desc = "Close Mini Map" },
	},
}
