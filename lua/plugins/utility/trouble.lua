return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		focus = true,
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>xw", "<CMD>Trouble diagnostics toggle<CR>", desc = "Open Trouble Workspace Diagnostics" },
		{
			"<leader>xd",
			"<CMD>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Open Trouble Document Diagnostics",
		},
		{ "<leader>xq", "<CMD>Trouble quickfix toggle<CR>", desc = "Open Trouble Quickfix List" },
		{ "<leader>xl", "<CMD>Trouble loclist toggle<CR>", desc = "Open Trouble Location List" },
		{ "<leader>xt", "<CMD>Trouble todo toggle<CR>", desc = "Open Todods in Trouble" },
	},
}
