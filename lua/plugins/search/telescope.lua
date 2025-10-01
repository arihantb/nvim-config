local getVisualSelection = function()
	vim.cmd('noav normal! "vy"')
	local text = vim.fn.getreg("v")
	vim.fn.setreg("v", {})
	return string.gsub(text, "\n", "")
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"andrew-george/telescope-themes",
		"keyvchan/telescope-find-pickers.nvim",
		{ "adoyle-h/telescope-live-grep-args.nvim", branch = "a" },
	},
	config = function()
		local telescope = require("plugins.search.telescope")
		local telescope_actions = require("telescope.actions")

		telescope.load_extension("fzf")
		telescope.load_extension("themes")
		telescope.load_extension("find_pickers")
		telescope.load_extension("live_grep_args")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = telescope_actions.move_selection_previous,
						["<C-j>"] = telescope_actions.move_selection_next,
					},
				},
				extensions = {
					themes = {
						enable_previewer = true,
						enable_live_preview = true,
						persist = {
							enabled = true,
							path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
						},
					},
				},
			},
		})
	end,
	keys = {
		{
			"<leader>tG",
			function()
				local telescope_builtin = require("telescope.builtin")
				local word = vim.fn.expand("<cWORD>")
				telescope_builtin.grep_string({ search = word })
			end,
			desc = "Find Connected Words Under Cursor",
		},
		{ "<leader>tt", "<CMD>Telescope themes<CR>", desc = "Theme Switcher", noremap = true, silent = true },
		{
			"<leader>tp",
			function()
				local telescope = require("plugins.search.telescope")
				telescope.extensions.find_pickers.find_pickers()
			end,
			desc = "Find Pickers",
		},
		{
			"<leader>tc",
			function()
				local telescope_builtin = require("telescope.builtin")
				local config_path = vim.fn.stdpath("config")
				telescope_builtin.find_files({ cwd = config_path })
			end,
			desc = "Find Config Files",
			silent = true,
		},
		{ "<leader>tf", "<CMD>Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>tm", "<CMD>Telescope message<CR>", desc = "List Messages" },
		{
			"<leader>tv",
			function()
				local telescope_builtin = require("telescope.builtin")
				local text = getVisualSelection()
				telescope_builtin.find_files({ default_text = text })
			end,
			desc = "Find Files With Selection",
			silent = true,
		},
		{
			"<leader>tg",
			"<CMD>Telescope current_buffer_fuzzy_find<CR>",
			desc = "Find Content In Current Buffer",
			silent = true,
		},
		{
			"<leader>tb",
			function()
				local telescope_builtin = require("telescope.builtin")
				local text = getVisualSelection()
				telescope_builtin.current_buffer_fuzzy_find({ default_text = text })
			end,
			mode = { "v" },
			desc = "Find Content In Current Buffer With Selection",
			silent = true,
		},
		{ "<leader>tw", "<CMD>Telescope live_grep_args<CR>", desc = "Find Content In Workspace" },
		{
			"<leader>tw",
			function()
				local telescope_live_grep_args = require("telescope-live-grep-args.shortcuts")
				telescope_live_grep_args.grep_visual_selection()
			end,
			desc = "Find Content In Workspace With Selection",
			mode = { "v" },
			silent = true,
		},
		{ "<leader>tc", "<CMD>Telescope commands<CR>", desc = "List Commands", silent = true },
		{ "<leader>tv", "<CMD>Telescope vim_options<CR>", desc = "List Vim Options", silent = true },
		{
			"<leader>tc",
			function()
				local telescope = require("plugins.search.telescope")
				local text = getVisualSelection()
				telescope.extensions.cmdline.cmdline({ default_text = text })
			end,
			desc = "List Commands With Selection",
			mode = { "v" },
			silent = true,
		},
		{ "<leader>tC", "<CMD>Telescope command_history<CR>", desc = "List Commands History", silent = true },
		{
			"<leader>tC",
			function()
				local telescope_builtin = require("telescope.builtin")
				telescope_builtin.command_history()
			end,
			desc = "List Commands History With Selection",
			mode = { "v" },
			silent = true,
		},
		{ "<leader>th", "<CMD>Telescope help_tags<CR>", desc = "Find Help Tags", silent = true },
		{
			"<leader>th",
			function()
				local telescope_builtin = require("telescope.builtin")
				local text = getVisualSelection()
				telescope_builtin.help_tags({ default_text = text })
			end,
			desc = "Find Help Tags With Selection",
			mode = { "v" },
			silent = true,
		},
		{ "<leader>tH", "<CMD>Telescope highlights<CR>", desc = "List Highlights" },
		{
			"<leader>tH",
			function()
				local telescope_builtin = require("telescope.builtin")
				local text = getVisualSelection()
				telescope_builtin.highlights({ default_text = text })
			end,
			desc = "List Highlights With Selection",
			mode = { "v" },
			silent = true,
		},
		{ "<leader>tk", "<CMD>Telescope keymaps<CR>", desc = "List Keymaps", silent = true },
		{
			"<leader>tk",
			function()
				local telescope_builtin = require("telescope.builtin")
				local text = getVisualSelection()
				telescope_builtin.keymaps({ default_text = text })
			end,
			desc = "List Keymaps With Selection",
			mode = { "v" },
			silent = true,
		},
		{ "<leader>ts", "<CMD>Telescope search_history<CR>", desc = "List Search History", silent = true },
		{ "<leader>tS", "<CMD>Telescope spell_suggest<CR>", desc = "List Spell Suggestions", silent = true },
		{ "<leader>tj", "<CMD>Telescope jumplist<CR>", desc = "List Jumplist", silent = true },
		{ "<leader>tV", "<CMD>Telescope vim_options<CR>", desc = "List Vim Options", silent = true },
		{ "<leader>tR", "<CMD>Telescope registers<CR>", desc = "List Registers", silent = true },
		{ "<leader>tls", "<CMD>Telescope lsp_document_symbols<CR>", desc = "List LSP Document Symbols", silent = true },
		{
			"<leader>tlf",
			"<CMD>Telescope lsp_workspace_symbols<CR>",
			desc = "LSP Document Symbols Filter",
			silent = true,
		},
		{
			"<leader>tlF",
			"<CMD>Telescope lsp_workspace_symbols_filter<CR>",
			desc = "LSP Document Symbols Filter",
			silent = true,
		},
		{ "<leader>to", "<CMD>Telescope oldfiles<CR>", desc = "Find Recent Files" },
		{ "<leader>tb", "<CMD>Telescope buffers<CR>", desc = "List Buffers", silent = true },
		{ "<leader>td", "<CMD>Telescope diagnostics<CR>", desc = "List Diagnostics", silent = true },
	},
}
