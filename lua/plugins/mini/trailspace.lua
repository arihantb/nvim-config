return {
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
}
