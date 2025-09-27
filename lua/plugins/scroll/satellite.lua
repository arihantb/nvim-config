return {
	"lewis6991/satellite.nvim",
	event = "BufReadPre",
	opts = {
		handlers = {
			gitsigns = {
				enable = false,
			},
		},
	},
	keys = {
		{ "<leader>sd", "<CMD>SatelliteDisable<CR>", desc = "Disable Scrollbar" },
		{ "<leader>se", "<CMD>SatelliteEnable<CR>", desc = "Enable Scrollbar" },
		{ "<leader>sf", "<CMD>SatelliteRefresh<CR>", desc = "Refresh Scrollbar" },
	},
}
