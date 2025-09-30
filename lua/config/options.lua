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
vim.o.scrolloff = 0
vim.o.signcolumn = "yes"
vim.o.showbreak = "↪ "

vim.opt.fillchars = { eob = " " }
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.isfname:append("@-@")
vim.opt.clipboard:append("unnamedplus")

vim.o.foldcolumn = "1"
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.updatetime = 50
vim.o.colorcolumn = "120"

vim.o.hlsearch = true

vim.o.mouse = "a"
vim.g.editorconfig = true
