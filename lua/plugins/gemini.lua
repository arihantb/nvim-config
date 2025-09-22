return {
	"kiddos/gemini.nvim",
	config = function()
		-- require the gemini plugin
		local gemini = require("gemini")
		-- setup the gemini plugin with custom configurations
		gemini.setup({
			completion = {
				-- disable completion feature
				enabled = false,
			},
			instruction = {
				menu_key = "<leader>gg",
			},
		})

		-- keymap for Gemini Apply
		vim.keymap.set({ "n", "v" }, "<leader>ga", "<CMD>GeminiApply<CR>", { desc = "Gemini Apply" })

		-- keymap for Gemini Chat
		vim.keymap.set({ "n", "v", "x" }, "<leader>gcc", function()
			-- prompt user for input
			local input = vim.fn.input("Gemini Chat: ")

			-- if input is provided, execute GeminiChat command
			if input and input ~= "" then
				vim.cmd("GeminiChat " .. input)
			end
		end, { desc = "Gemini Chat" })

		-- keymap for Gemini Code Explain
		vim.keymap.set({ "v", "x" }, "<leader>gce", "<CMD>GeminiCodeExplain<CR>", { desc = "Gemini Code Explain" })
		-- keymap for Gemini Code Review
		vim.keymap.set({ "v", "x" }, "<leader>gcr", "<CMD>GeminiCodeReview<CR>", { desc = "Gemini Code Review" })
		-- keymap for Gemini Function Hint
		vim.keymap.set({ "n", "v" }, "<leader>gfh", "<CMD>GeminiFunctionHint<CR>", { desc = "Gemini Function Hint" })

		-- keymap for Gemini Task
		vim.keymap.set({ "n", "v", "x" }, "<leader>gt", function()
			-- prompt user for input
			local input = vim.fn.input("Gemini Task: ")

			-- if input is provided, execute GeminiTask command
			if input and input ~= "" then
				vim.cmd("GeminiTask " .. input)
			end
		end, { desc = "Gemini Task" })

		-- keymap for Gemini Unit Test
		vim.keymap.set({ "v", "x" }, "<leader>gut", "<CMD>GeminiUnitTest<CR>", { desc = "Gemini Unit Test" })
	end,
}
