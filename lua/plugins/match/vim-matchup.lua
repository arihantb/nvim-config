return {
	"andymass/vim-matchup",
	event = "CursorMoved",
	config = function()
		vim.g.matchup_matchparen_enabled = 1
		vim.g.matchup_matchparen_stopline = 400
		vim.g.matchup_motion_enabled = 1
		vim.g.matchup_motion_cursor_end = 1
		vim.g.matchup_text_obj_enabled = 1
		vim.g.matchup_surround_enabled = 1
		vim.g.matchup_transmute_enabled = 0
	end,
}
