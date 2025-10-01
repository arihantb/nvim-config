return {
	"kiddos/gemini.nvim",
	config = function()
		local gemini = require("gemini")

		gemini.setup({
			completion = {
				enabled = false,
			},
			instruction = {
				menu_key = "<leader>gg",
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>ga", "<CMD>GeminiApply<CR>", { desc = "Gemini Apply" })

		vim.keymap.set({ "n", "v", "x" }, "<leader>gcc", function()
			local input = vim.fn.input("Gemini Chat: ")

			if input and input ~= "" then
				vim.cmd("GeminiChat " .. input)
			end
		end, { desc = "Gemini Chat" })

		vim.keymap.set({ "v", "x" }, "<leader>gce", "<CMD>GeminiCodeExplain<CR>", { desc = "Gemini Code Explain" })
		vim.keymap.set({ "v", "x" }, "<leader>gcr", "<CMD>GeminiCodeReview<CR>", { desc = "Gemini Code Review" })
		vim.keymap.set({ "n", "v" }, "<leader>gfh", "<CMD>GeminiFunctionHint<CR>", { desc = "Gemini Function Hint" })

		vim.keymap.set({ "n", "v", "x" }, "<leader>gt", function()
			local input = vim.fn.input("Gemini Task: ")

			if input and input ~= "" then
				vim.cmd("GeminiTask " .. input)
			end
		end, { desc = "Gemini Task" })

		vim.keymap.set({ "v", "x" }, "<leader>gut", "<CMD>GeminiUnitTest<CR>", { desc = "Gemini Unit Test" })
	end,
}
