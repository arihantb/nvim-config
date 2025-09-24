return {
	{ "nvim-mini/mini.nvim", version = false },

	-- file explorer
	{
		"nvim-mini/mini.files",
		version = false,
		config = function()
			local MiniFiles = require("mini.files")
			MiniFiles.setup({
				mappings = {
					-- enters the selected directory
					go_in = "L",
					-- enters the selected directory and closes all other columns
					go_in_plus = "<Enter>",
					-- exits the selected directory
					go_out = "H",
					-- exits the selected directory and closes all other columns
					go_out_plus = "-",
				},
				options = {
					-- delete permanently or move into module-specific trash
					permanent_delete = true,
				},
				windows = {
					-- maximum number of columns
					max_number = 4,
					-- shows the preview of the file under cursor
					preview = true,
					-- width of the column of the preview
					width_preview = 50,
				},
			})

			-- keymaps for mini.files
			-- open mini file explorer
			vim.keymap.set("n", "<leader>ee", "<CMD>lua MiniFiles.open()<CR>", { desc = "Open Mini File Explorer" })
			-- open the currently opened file in the explorer
			vim.keymap.set("n", "<leader>ef", function()
				MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
				MiniFiles.reveal_cwd()
			end, { desc = "Open Currently Opened File in Explorer" })
		end,
	},

	-- sessions
	{
		"nvim-mini/mini.sessions",
		version = false,
		config = function()
			local MiniSessions = require("mini.sessions")

			MiniSessions.setup({
				-- whether to read default session if neovim opened without file arguments
				autoread = false,
				-- whether to write currently read session before leaving it
				autowrite = false,
				file = "",
			})

			-- keymaps for auto-session
			-- restore last workspace session for current working directory
			vim.keymap.set(
				"n",
				"<leader>wr",
				"<CMD>lua MiniSessions.read('session')<CR>",
				{ desc = "Restore Session for CWD" }
			)
			-- save workspace session for current working directory
			vim.keymap.set(
				"n",
				"<leader>ws",
				"<CMD>lua MiniSessions.write('session')<CR>",
				{ desc = "Save Session for CWD" }
			)
		end,
	},

	-- comments
	{
		"nvim-mini/mini.comment",
		version = false,
		opts = {},
	},

	-- surround
	{
		"nvim-mini/mini.surround",
		event = { "BufReadPre", "BufNewFile" },
		version = false,
		opts = {
			custom_surroundings = nil,
			highlight_duration = 300,
			mappings = {
				add = "sa",
				delete = "ds",
				find = "sf",
				find_left = "sF",
				highlight = "sh",
				replace = "sr",
				update_n_lines = "sn",
				suffix_last = "l",
				suffix_next = "n",
			},
			n_lines = 20,
			respect_selection_type = false,
			search_method = "cover",
			silent = false,
		},
	},

	-- trailspace
	{
		"nvim-mini/mini.trailspace",
		event = { "BufReadPost", "BufNewFile" },
		version = false,
		config = function()
			local MiniTrailSpace = require("mini.trailspace")

			MiniTrailSpace.setup({
				only_in_normal_buffers = true,
			})

			vim.keymap.set("n", "<leader>cw", function()
				MiniTrailSpace.trim()
			end, { desc = "Erase Trailing Whitespace" })
		end,
	},

	-- split join lines
	{
		"nvim-mini/mini.splitjoin",
		version = false,
		config = function()
			local MiniSplitJoin = require("mini.splitjoin")

			MiniSplitJoin.setup({
				mappings = { toggle = "" },
			})

			vim.keymap.set({ "n", "x" }, "ss", function()
				MiniSplitJoin.join()
			end, { desc = "Join Arguments" })
			vim.keymap.set({ "n", "x" }, "sj", function()
				MiniSplitJoin.split()
			end, { desc = "Split Arguments" })
		end,
	},

	-- align text
	{
		"nvim-mini/mini.align",
		version = false,
		opts = {},
	},

	-- auto pairs
	{
		"nvim-mini/mini.pairs",
		version = false,
		opts = {},
	},

	-- highlight cursor word
	{
		"nvim-mini/mini.cursorword",
		version = false,
		opts = {},
	},
}
