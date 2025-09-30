vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Lines Up", silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Lines Down", silent = true })

vim.keymap.set("n", "n", "nzzzv", { desc = "Center Cursor Next Find" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center Cursor Prev Find" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent Backward", noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Forward", noremap = true, silent = true })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste Without Replacing Clipboard (x)" })
vim.keymap.set("v", "p", '"_dp', { desc = "Paste Without Replacing Clipboard (v)" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete Line Without Copy" })

vim.keymap.set("n", "x", '"_x', { desc = "Delete Characters Without Copy", noremap = true, silent = true })

vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear Search Highlight", silent = true })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Auto Format" })

vim.keymap.set(
	"n",
	"<leader>sr",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace Cursor Word (Global)" }
)

vim.keymap.set("n", "<M-n>", "<cmd>tabnew<CR>", { desc = "Open New Tab" })
vim.keymap.set("n", "<M-w>", "<cmd>tabclose<CR>", { desc = "Close Current Tab" })
vim.keymap.set("n", "<M-l>", "<cmd>tabn<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<M-h>", "<cmd>tabp<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<M-o>", "<cmd>tabnew %<CR>", { desc = "Open Current Tab in New Tab" })

vim.keymap.set("n", "<M-v>", "<C-w>v", { desc = "Split Window Vertically" })
vim.keymap.set("n", "<M-d>", "<C-w>s", { desc = "Split Window Horizontally" })
vim.keymap.set("n", "<M-e>", "<C-w>=", { desc = "Make Splits of Equal Size" })
vim.keymap.set("n", "<M-x>", "<cmd>close<CR>", { desc = "Close Current Split" })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil" })
vim.keymap.set("n", "<leader>-", "<CMD>Oil --float<CR>", { desc = "Open Oil Floating" })

vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
end)
