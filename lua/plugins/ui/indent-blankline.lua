return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "BufReadPre",
	opts = {
		scope = { char = "▏", highlight = "Scope", show_start = false, show_end = false },
	},
}
