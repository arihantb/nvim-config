return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			integrations = {
				hop = true,
				lsp_trouble = true,
				bufferline = true,
				mason = true,
				neogit = true,
				noice = true,
				notify = true,
				symbols_outline = true,
				treesitter_context = true,
				native_lsp = {
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
					inlay_hints = {
						background = false,
					},
				},
			},
		},
	},
}
