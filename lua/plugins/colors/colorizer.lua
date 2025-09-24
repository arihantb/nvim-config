return {
	"norcalli/nvim-colorizer.lua",
	opts = {},
	keymaps = {
		{ "<leader>cab", "<CMD>ColorizerAttachToBuffer<CR>", desc = "Colorizer Attach to Buffer" },
		{ "<leader>cdb", "<CMD>ColorizerDetachFromBuffer<CR>", desc = "Colorizer Detach from Buffer" },
		{ "<leader>crb", "<CMD>ColorizerReloadAllBuffers<CR>", desc = "Colorizer Reload All Buffers" },
		{ "<leader>ct", "<CMD>ColorizerToggle<CR>", desc = "Colorizer Toggle" },
	},
}
