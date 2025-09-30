return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local statuscol = require("statuscol")
		local builtin = require("statuscol.builtin")

		statuscol.setup({
			setopt = true,
			relculright = true,
			segments = {
				{
					sign = {
						name = { "GitSigns*" },
						namespace = { "gitsigns" },
						colwidth = 1,
					},
					click = "v:lua.ScSa",
				},
				{ text = { " " } },
				{
					sign = {
						name = { ".*" },
						namespace = { ".*" },
						colwidth = 2,
						auto = false,
						wrap = true,
					},
				},
				{ text = { " " } },
				{
					text = {
						function(args)
							args.fold.close = ""
							args.fold.open = ""
							args.fold.sep = " "
							return builtin.foldfunc(args)
						end,
					},
					wrap = true,
					colwidth = 1,
					click = "v:lua.ScFa",
				},
				{
					text = { builtin.lnumfunc, " " },
					colwidth = 1,
					click = "v:lua.ScLa",
				},
			},
		})
	end,
}
