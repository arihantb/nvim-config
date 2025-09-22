return {
	"akinsho/bufferline.nvim",
	-- load this plugin when the editor is very lazy, meaning after startup is complete.
	event = "VeryLazy",
	-- ensure this plugin loads after the 'catppuccin' colorscheme is loaded.
	after = "catppuccin",
	-- use the latest stable version of the plugin.
	version = "*",
	-- this plugin depends on 'nvim-web-devicons' for file type icons.
	dependencies = "nvim-tree/nvim-web-devicons",
	-- configuration options for bufferline.nvim.
	opts = {
		options = {
			-- set the icon for closing a buffer.
			buffer_close_icon = "✕",
			-- enable hover information for buffers.
			hover = {
				enabled = true,
				-- delay in milliseconds before showing hover information.
				delay = 200,
				-- specify which actions to reveal in the hover window (e.g., "close").
				reveal = { "close" },
			},
		},
	},
}
