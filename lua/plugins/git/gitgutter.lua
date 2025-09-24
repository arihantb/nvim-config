return {
	"airblade/vim-gitgutter",
	event = "BufRead",
	keys = {
		{ "<leader>g", "<CMD>GitGutterToggle<CR>", desc = "Toggle Git Gutter" },
	},
}
