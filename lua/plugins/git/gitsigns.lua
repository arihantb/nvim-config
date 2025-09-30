return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▐" },
			change = { text = "▐" },
			delete = { text = "▐" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "▐" },
			change = { text = "▐" },
			delete = { text = "▐" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			map("n", "<leader>gs", gs.stage_hunk, "Stage Hunk")
			map("n", "<leader>gr", gs.reset_hunk, "Reset Hunk")
			map("v", "<leader>gs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage Hunk")
			map("v", "<leader>gr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset Hunk")
			map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
			map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
			map("n", "<leader>gu", gs.stage_hunk, "Undo Stage Hunk")
			map("n", "<leader>gp", gs.reset_hunk, "Preview Hunk")
		end,
	},
}
