return {
	"bbjornstad/pretty-fold.nvim",
	config = function()
		require("pretty-fold").setup({
			sections = {
				left = {
					function(_)
						return string.rep("─", (vim.v.foldlevel - 1) * vim.o.tabstop - 2)
							.. "┤ "
							.. vim.fn.getline(vim.v.foldstart):gsub("^%s*", "")
							.. " ... "
							.. vim.fn.getline(vim.v.foldend):gsub("^%s*", "")
							.. " ├"
					end,
				},
				right = {
					"┤ ",
					"number_of_folded_lines",
					": ",
					"percentage",
					" ├───",
				},
			},
			fill_char = "─",
		})
	end,
}
