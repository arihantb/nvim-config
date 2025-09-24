return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- very high number ensures it loads before other plugins
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
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000,
		opts = {},
	},
	{
		"kepano/flexoki-neovim",
		name = "flexoki",
		priority = 1000,
		opts = {},
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		priority = 1000,
		config = true,
		opts = {},
	},
	{
		"olimorris/onedarkpro.nvim",
		name = "onedarkpro",
		priority = 1000,
		opts = {},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		opts = {},
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
	},
}
