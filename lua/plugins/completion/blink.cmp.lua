return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts = {
		keymap = { preset = "default" },
		completion = {
			documentation = { auto_show = true },
			menu = {
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon

								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(
										ctx.item.documentation,
										{ kind = ctx.kind }
									)

									if color_item and color_item.abbr ~= "" then
										icon = color_item.abbr
									end
								end

								return icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								local highlight = "BlinkCmpKind" .. ctx.kind

								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(
										ctx.item.documentation,
										{ kind = ctx.kind }
									)

									if color_item and color_item.abbr_hl_group then
										highlight = color_item.abbr_hl_group
									end
								end

								return highlight
							end,
						},
					},
				},
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
