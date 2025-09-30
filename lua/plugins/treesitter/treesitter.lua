return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"python",
				"javascript",
				"typescript",
				"json",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"dockerfile",
				"gitignore",
				"java",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>",
					node_incremental = "<Enter>",
					scope_incremental = "<leader><Enter>",
					node_decremental = "<Backspace>",
				},
			},
			additional_vim_regex_highlighting = false,
		})
	end,
}
