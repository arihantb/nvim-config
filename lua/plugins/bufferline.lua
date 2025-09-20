return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	after = "catppuccin",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			buffer_close_icon = "✕",
			hover = {
				enabled = true,
				delay = 200,
				reveal = { "close" },
			},
		},
	},
}
