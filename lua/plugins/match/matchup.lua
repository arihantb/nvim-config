return {
	"andymass/vim-matchup",
	event = "CursorMoved",
	config = function()
		vim.g.matchup_matchparen_enabled = 1
		vim.g.matchup_matchparen_stopline = 400
		vim.g.matchup_matchparen_timeout = 300
		vim.g.matchup_matchparen_insert_timeout = 60
		vim.g.matchup_matchparen_deferred = 0
		vim.g.matchup_matchparen_deferred_show_delay = 50
		vim.g.matchup_matchparen_deferred_hide_delay = 700
		vim.g.matchup_matchparen_hi_surround_always = 0
		vim.g.matchup_motion_enabled = 1
		vim.g.matchup_text_obj_enabled = 1
		vim.g.matchup_surround_enabled = 1
		vim.g.matchup_transmute_enabled = 0
	end,
}
