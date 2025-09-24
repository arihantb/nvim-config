return {
	"rainbowhxch/beacon.nvim",
	opts = {
		size = 999,
		fader = "cursor_line",
		minimal_jump = 6,
		timeout = 3000,
		ignore_buffers = {},
	},
	keys = {
		{ "<leader>bb", "<CMD>Beacon<CR>", desc = "Highlight Cursor" },
		{ "<leader>bt", "<CMD>BeaconToggle<CR>", desc = "Toggle Beacon" },
	},
}
