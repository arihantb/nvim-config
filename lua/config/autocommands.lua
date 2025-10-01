vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local function get_hl(group, fg)
			local ok, highlight = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })

			if not ok or not highlight then
				return nil
			end

			local color_val = fg and highlight.fg or highlight.bg

			if color_val then
				local color = string.format("#%06x", color_val)
				return color
			end

			return nil
		end

		local highlights = {
			AerialArray = "@markup.list",
			AerialArrayIcon = "@markup.list",
			AerialBoolean = "@boolean",
			AerialBooleanIcon = "@boolean",
			AerialClass = "@lsp.type.class",
			AerialClassIcon = "@lsp.type.class",
			AerialConstant = "@constant",
			AerialConstantIcon = "@constant",
			AerialConstructor = "@constructor",
			AerialConstructorIcon = "@constructor",
			AerialEnum = "@lsp.type.enum",
			AerialEnumIcon = "@lsp.type.enum",
			AerialEnumMember = "@lsp.type.enumMember",
			AerialEnumMemberIcon = "@lsp.type.enumMember",
			AerialEvent = "@lsp.type.event",
			AerialEventIcon = "@lsp.type.event",
			AerialField = "@variable",
			AerialFieldIcon = "@variable",
			AerialFile = "@variable",
			AerialFileIcon = "@variable",
			AerialFunction = "@function",
			AerialFunctionIcon = "@function",
			AerialInterface = "@lsp.type.interface",
			AerialInterfaceIcon = "@lsp.type.interface",
			AerialKey = "@keyword",
			AerialKeyIcon = "@keyword",
			AerialMethod = "@function.method",
			AerialMethodIcon = "@function.method",
			AerialModule = "@module",
			AerialModuleIcon = "@module",
			AerialNamespace = "@lsp.type.namespace",
			AerialNamespaceIcon = "@lsp.type.namespace",
			AerialNull = "@none",
			AerialNullIcon = "@none",
			AerialNumber = "@number",
			AerialNumberIcon = "@number",
			AerialObject = "@type",
			AerialObjectIcon = "@type",
			AerialOperator = "@operator",
			AerialOperatorIcon = "@operator",
			AerialPackage = "@lsp.type.generic",
			AerialPackageIcon = "@lsp.type.generic",
			AerialProperty = "@property",
			AerialPropertyIcon = "@property",
			AerialString = "@string",
			AerialStringIcon = "@string",
			AerialStruct = "@lsp.type.struct",
			AerialStructIcon = "@lsp.type.struct",
			AerialTypeParameter = "@lsp.type.typeParameter",
			AerialTypeParameterIcon = "@lsp.type.typeParameter",
			AerialVariable = "@variable",
			AerialVariableIcon = "@variable",
			Beacon = "Cursor",
			MatchParen = { fg = get_hl("Normal"), bg = get_hl("@keyword", true) },
			MatchWord = { fg = get_hl("Normal"), bg = get_hl("@keyword", true) },
			MatchWordCur = { fg = get_hl("Normal"), bg = get_hl("@keyword", true) },
			Scope = "@function",
			TreesitterContext = {
				italic = true,
			},
			TreesitterContextLineNumber = {
				italic = true,
				bold = true,
			},
			TreesitterContextBottom = {},
			TreesitterContextSeparator = {
				bg = get_hl("NormalFloat"),
			},
		}

		for group1, group2 in pairs(highlights) do
			if type(group2) == "table" then
				vim.api.nvim_set_hl(0, group1, group2)
			else
				vim.api.nvim_set_hl(0, group1, { link = group2, default = true })
			end
		end

		vim.api.nvim_set_hl(0, "AlphaHeader0_0", { fg = "#a6c9ab" })
		vim.api.nvim_set_hl(0, "AlphaHeader1_0", { fg = "#bb7744" })
		vim.api.nvim_set_hl(0, "AlphaHeader1_1", { fg = "#386c3f" })
		vim.api.nvim_set_hl(0, "AlphaHeader1_2", { fg = "#a6c9ab" })
		vim.api.nvim_set_hl(0, "AlphaHeader2_0", { fg = "#be7d46" })
		vim.api.nvim_set_hl(0, "AlphaHeader2_1", { fg = "#3d7344" })
		vim.api.nvim_set_hl(0, "AlphaHeader3_0", { fg = "#c18250" })
		vim.api.nvim_set_hl(0, "AlphaHeader3_1", { fg = "#5c441e" })
		vim.api.nvim_set_hl(0, "AlphaHeader3_2", { fg = "#d6c383" })
		vim.api.nvim_set_hl(0, "AlphaHeader3_3", { fg = "#407b48" })
		vim.api.nvim_set_hl(0, "AlphaHeader3_4", { fg = "#98c09c" })
		vim.api.nvim_set_hl(0, "AlphaHeader4_0", { fg = "#c38950" })
		vim.api.nvim_set_hl(0, "AlphaHeader4_1", { fg = "#e0c785" })
		vim.api.nvim_set_hl(0, "AlphaHeader4_2", { fg = "#44844b" })
		vim.api.nvim_set_hl(0, "AlphaHeader4_3", { fg = "#a0c4a3" })
		vim.api.nvim_set_hl(0, "AlphaHeader5_0", { fg = "#c58f56" })
		vim.api.nvim_set_hl(0, "AlphaHeader5_1", { fg = "#e2cb85" })
		vim.api.nvim_set_hl(0, "AlphaHeader5_2", { fg = "#5c441e" })
		vim.api.nvim_set_hl(0, "AlphaHeader5_3", { fg = "#e2cb85" })
		vim.api.nvim_set_hl(0, "AlphaHeader5_4", { fg = "#488c51" })
		vim.api.nvim_set_hl(0, "AlphaHeader5_5", { fg = "#a6c9ab" })
		vim.api.nvim_set_hl(0, "AlphaHeader6_0", { fg = "#c7955b" })
		vim.api.nvim_set_hl(0, "AlphaHeader6_1", { fg = "#e3cf88" })
		vim.api.nvim_set_hl(0, "AlphaHeader6_2", { fg = "#4d9356" })
		vim.api.nvim_set_hl(0, "AlphaHeader6_3", { fg = "#aecdb3" })
		vim.api.nvim_set_hl(0, "AlphaHeader7_0", { fg = "#c89b62" })
		vim.api.nvim_set_hl(0, "AlphaHeader7_1", { fg = "#e5d38a" })
		vim.api.nvim_set_hl(0, "AlphaHeader7_2", { fg = "#509b59" })
		vim.api.nvim_set_hl(0, "AlphaHeader7_3", { fg = "#b7d1b9" })
		vim.api.nvim_set_hl(0, "AlphaHeader8_0", { fg = "#5c441e" })
		vim.api.nvim_set_hl(0, "AlphaHeader8_1", { fg = "#2e4e2a" })
		vim.api.nvim_set_hl(0, "AlphaButtonIcon", { fg = "#7dcfff" })
		vim.api.nvim_set_hl(0, "AlphaButtonKey", { fg = "#ff9e64" })
		vim.api.nvim_set_hl(0, "AlphaButtonSpecial", { fg = "#f7768e" })
		vim.api.nvim_set_hl(0, "AlphaButtonText", { fg = "#c0caf5" })
		vim.api.nvim_set_hl(0, "AlphaNvimVersion", { fg = "#ff9e64" })
		vim.api.nvim_set_hl(0, "AlphaDate", { fg = "#7aa2f7" })
		vim.api.nvim_set_hl(0, "AlphaTime", { fg = "#bb9af7" })

		vim.api.nvim_set_hl(0, "Folded", { link = "Comment" })
		vim.api.nvim_set_hl(0, "FoldColumn", { link = "NormalNC" })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		local has_ts = pcall(require, "nvim-treesitter.parsers")

		if not has_ts then
			vim.opt_local.foldmethod = "indent"
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if pcall(require, "mini.map") then
			local mini_map = require("mini.map")

			mini_map.setup({
				symbols = {
					encode = mini_map.gen_encode_symbols.dot("4x2"),
					scroll_line = "",
					scroll_view = "",
				},
				window = {
					focusable = true,
					winblend = 75,
					zindex = 50,
					show_integration_count = false,
				},
				integrations = {
					mini_map.gen_integration.diagnostic({
						error = "DiagnosticFloatingError",
						warn = "DiagnosticFloatingWarn",
						info = "DiagnosticFloatingInfo",
						hint = "DiagnosticFloatingHint",
					}),
					mini_map.gen_integration.gitsigns(),
				},
			})

			if vim.bo.filetype == "oil" then
				mini_map.close()
			else
				mini_map.open()
			end
		end
	end,
})
