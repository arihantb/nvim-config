return {
	"stevearc/aerial.nvim",
	opts = {
		backends = {
			["_"] = { "lsp", "treesitter", "markdown" },
			markdown = { "markdown" },
			man = { "man" },
		},
		highlight_on_hover = true,
		layout = { default_direction = "right", min_width = 20, max_width = 50 },
		show_guides = true,
		manage_folds = false,
		link_folds_to_tree = false,
		link_tree_to_folds = false,
		guides = {
			mid_item = "├─",
			last_item = "└─",
			nested_top = "│  ",
			whitespace = "  ",
		},
		filter_kind = {
			["_"] = {
				"Array",
				"Boolean",
				"Class",
				"Constant",
				"Constructor",
				"Enum",
				"EnumMember",
				"Event",
				"Field",
				"File",
				"Function",
				"Interface",
				"Key",
				"Method",
				"Module",
				"Namespace",
				"Null",
				"Number",
				"Object",
				"Operator",
				"Package",
				"Property",
				"String",
				"Struct",
				"TypeParameter",
				"Variable",
			},
		},
		ignore = {
			buftypes = false,
		},
	},
	config = function(_, opts)
		local constants = require("config.constants")
		local aerial = require("aerial")

		local icons = {}
		local Collapsed = constants.kindSymbolMap.Collapsed

		for key, val in pairs(constants.kindSymbolMap) do
			icons[key] = val
			icons[key .. "Collapsed"] = string.format("%s %s", Collapsed, val)
		end

		opts.icons = icons
		aerial.setup(opts)
	end,
}
