-- make line numbers default
vim.o.nu = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.showmode = false

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true

vim.o.incsearch = true
vim.o.inccommand = "split"
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.isfname:append("@-@")
vim.opt.clipboard:append("unnamedplus")

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.updatetime = 50
vim.o.colorcolumn = "120"

vim.o.hlsearch = true

-- enable mouse mode
vim.o.mouse = "a"
vim.g.editorconfig = true
