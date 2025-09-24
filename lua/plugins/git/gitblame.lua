return {
	"f-person/git-blame.nvim",
	event = "BufReadPre",
	opts = {},
	keys = {
		{ "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Toggle Git Blame" },
	},
}
