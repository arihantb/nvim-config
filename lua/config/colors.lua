local M = {}

M.colors = {}

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

function M.load()
	M.colors = {
		cursor = "#689AFD",
		bg = get_hl("Normal", false),
		fg = get_hl("Normal", true),
		bg_float = get_hl("NormalFloat", false) or get_hl("Normal", false),
		fg_float = get_hl("NormalFloat", true) or get_hl("Normal", true),
		tag = get_hl("@tag", true),
		none = get_hl("@none", true),
		type_ = get_hl("@type", true),
		label = get_hl("@label", true),
		function_ = get_hl("@function", true),
		markup = get_hl("@markup", true),
		module = get_hl("@module", true),
		number = get_hl("@number", true),
		string = get_hl("@string", true),
		boolean = get_hl("@boolean", true),
		comment = get_hl("@comment", true),
		keyword = get_hl("@keyword", true),
		markup_list = get_hl("@markup.list", true),
		constant = get_hl("@constant", true),
		operator = get_hl("@operator", true),
		property = get_hl("@property", true),
		variable = get_hl("@variable", true),
		attribute = get_hl("@attribute", true),
		character = get_hl("@character", true),
		constructor = get_hl("@constructor", true),
		punctuation = get_hl("@punctuation", true),
	}
end

return M
