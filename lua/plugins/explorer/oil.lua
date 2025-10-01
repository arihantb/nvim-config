return {
	"stevearc/oil.nvim",
	event = "VimEnter",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	opts = {
		default_file_explorer = true,
		columns = {
			"icon",
		},
		keymaps = {
			["q"] = "actions.close",
		},
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
		},
		skip_confirm_for_simple_edits = true,
	},
}
