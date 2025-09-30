return {
	"nvim-mini/mini.files",
	version = false,
	config = function()
		local MiniFiles = require("mini.files")
		MiniFiles.setup({
			mappings = {
				go_in = "L",
				go_in_plus = "<Enter>",
				go_out = "H",
				go_out_plus = "-",
			},
			options = {
				permanent_delete = true,
			},
			windows = {
				max_number = 4,
				preview = true,
			},
		})

		vim.keymap.set("n", "<leader>ee", "<CMD>lua MiniFiles.open()<CR>", { desc = "Open Mini File Explorer" })
		vim.keymap.set("n", "<leader>ef", function()
			MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
			MiniFiles.reveal_cwd()
		end, { desc = "Open Currently Opened File in Explorer" })
	end,
}
