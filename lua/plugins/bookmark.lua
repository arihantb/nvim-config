return {
	"MattesGroeger/vim-bookmarks",
	opts = {},
	keys = {
		{ "<leader>bb", "<CMD>BookmarkToggle<CR>", desc = "Toggle Bookmark" },
		{
			"<leader>ba",
			function()
				vim.ui.input({ prompt = "Annotate Bookmark: " }, function(input)
					vim.cmd("BookmarkAnnotate " .. input)
				end)
			end,
			desc = "Annotate Bookmark",
		},
		{ "<leader>bn", "<CMD>BookmarkNext<CR>", desc = "Next Bookmark" },
		{ "<leader>bp", "<CMD>BookmarkPrev<CR>", desc = "Previous Bookmark" },
		{ "<leader>bs", "<CMD>BookmarkShowAll<CR>", desc = "Show All Bookmarks" },
		{ "<leader>bc", "<CMD>BookmarkClear<CR>", desc = "Clear Bookmark" },
		{ "<leader>bC", "<CMD>BookmarkClearAll<CR>", desc = "Clear All Bookmarks" },
		{
			"<leader>bm",
			function()
				vim.ui.input({ prompt = "Line Number: " }, function(input)
					vim.cmd("BookmarkMoveToLine " .. input)
				end)
			end,
		},
	},
}
