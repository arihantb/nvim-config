local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.ai" },
		{ import = "plugins.colors" },
		{ import = "plugins.completion" },
		{ import = "plugins.git" },
		{ import = "plugins.lsp" },
		{ import = "plugins.match" },
		{ import = "plugins.move" },
		{ import = "plugins.scroll" },
		{ import = "plugins.search" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.ui" },
		{ import = "plugins.utility" },
	},
	install = {
		colorscheme = { "catppuccin" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_direction = {
		notify = false,
	},
})
