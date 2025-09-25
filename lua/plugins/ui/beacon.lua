return {
	"rainbowhxch/beacon.nvim",
	event = { "BufReadPre" },
	config = function()
		local beacon = require("beacon")
		beacon.setup({
			size = 999,
			fader = "cursor_line",
			minimal_jump = 6,
			ignore_buffers = {},
		})
	end,
	keys = {
		{ "<leader>bB", "<CMD>Beacon<CR>", desc = "Highlight Cursor" },
		{ "<leader>bt", "<CMD>BeaconToggle<CR>", desc = "Toggle Beacon" },
	},
}
