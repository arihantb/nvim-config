vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- moves lines up and down in visual selection -
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Lines Up", silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Lines Down", silent = true })

-- moves up and down in buffer with cursor centered --
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move Up in Buffer with Centered Cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move Down in Buffer with Centered Cursor" })

-- center the cursor for next and previous find --
vim.keymap.set("n", "n", "nzzzv", { desc = "Center Cursor Next Find" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center Cursor Prev Find" })

-- indent the lines without selecting the line visually again --
vim.keymap.set("v", "<", "<gv", { desc = "Indent Backward", noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Forward", noremap = true, silent = true })

-- paste without replacing clipboard content --
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste Without Replacing Clipboard (x)" })
vim.keymap.set("v", "p", '"_dp', { desc = "Paste Without Replacing Clipboard (v)" })

-- delete the line without copying to clipboard --
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete Line Without Copy" })

-- delete the characters without copying to clipboard --
vim.keymap.set("n", "x", '"_x', { desc = "Delete Characters Without Copy", noremap = true, silent = true })

-- clear search highlight --
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear Search Highlight", silent = true })

-- auto format code --
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Auto Format" })

-- replace word cursor is on globally --
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace Cursor Word (Global)" }
)

-- highlight yank --
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- display dashboard
vim.keymap.set("n", "<leader>D", "<CMD>lua Snacks.dashboard()<CR>")

-- tabs navigation --
vim.keymap.set("n", "<M-n>", "<cmd>tabnew<CR>", { desc = "Open New Tab" }) -- open new tab
vim.keymap.set("n", "<M-w>", "<cmd>tabclose<CR>", { desc = "Close Current Tab" }) -- close current tab
vim.keymap.set("n", "<M-l>", "<cmd>tabn<CR>", { desc = "Next Tab" }) -- go to next tab
vim.keymap.set("n", "<M-h>", "<cmd>tabp<CR>", { desc = "Previous Tab" }) -- go to previous tab
vim.keymap.set("n", "<M-o>", "<cmd>tabnew %<CR>", { desc = "Open Current Tab in New Tab" }) -- open current tab in new tab

-- window split --
vim.keymap.set("n", "<M-v>", "<C-w>v", { desc = "Split Window Vertically" }) -- split window vertically
vim.keymap.set("n", "<M-d>", "<C-w>s", { desc = "Split Window Horizontally" }) -- split window horizontally
vim.keymap.set("n", "<M-e>", "<C-w>=", { desc = "Make Splits of Equal Size" }) -- make splits of equal size
vim.keymap.set("n", "<M-x>", "<cmd>close<CR>", { desc = "Close Current Split" }) -- close the current split

-- keymaps for oil --
-- open parent dir over current active window --
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil" })
vim.keymap.set("n", "<leader>-", "<CMD>Oil --float<CR>", { desc = "Open Oil Floating" })

-- line highlight --
vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

-- copy filepath to clipboard --
vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~") -- gets the file path relative to the home directory
	vim.fn.setreg("+", filePath) -- copy the file path to clipboard register
end)
