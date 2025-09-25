return {
	"bbjornstad/pretty-fold.nvim",
	opts = {
		sections = {
			left = { "content" },
			right = {
				" ",
				"number_of_folded_lines",
				": ",
				"percentage",
				" ──",
			},
		},
		fill_char = "─", -- ''
		remove_fold_markers = true,
		keep_indentation = true,
		process_comment_signs = "spaces",
		comment_signs = {},
		stop_words = {
			"@brief%s*",
		},
		add_close_pattern = true,
		matchup_patterns = {
			{ "{", "}" },
			{ "%(", ")" },
			{ "%[", "]" },
		},
		ft_ignore = { "neorg" },
	},
	keys = {
		{ "<leader>fc", "<CMD>foldclose<CR>", desc = "Fold Code" },
		{ "<leader>fo", "<CMD>foldopen<CR>", desc = "Unfold Code" },
	},
}
