return {
	"goolord/alpha-nvim",
	config = function()
		local function getTitle(val)
			return {
				type = "text",
				val = val,
				opts = { position = "center", cursor = 5, width = 50, hl = "Title" },
			}
		end

		local function getVersion()
			local info = vim.version()
			local val = string.format("Version: %s.%s.%s", info.major, info.minor, info.patch)

			if info.prerelease then
				val = val .. " (prerelease)"
			end

			return { type = "text", val = val, opts = { position = "center", hl = "DashboardVersion" } }
		end

		local function getHeader()
			local logo

			if vim.o.columns > 49 then
				logo = {
					[[                               __                ]],
					[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
					[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
					[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
					[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
					[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
				}
			else
				logo = {
					[[ _   _       _            ]],
					[[| \ | |     (_)           ]],
					[[|  \| |_   ___ _ __ ___   ]],
					[[| . ` \ \ / / | '_ ` _ \  ]],
					[[| |\  |\ V /| | | | | | | ]],
					[[\_| \_/ \_/ |_|_| |_| |_| ]],
				}
			end

			local header = { type = "text", val = logo, opts = { position = "center", hl = "DashboardLogo" } }

			return {
				type = "group",
				val = { header, getVersion(), { type = "padding", val = 1 } },
				opts = { spacing = 0 },
			}
		end

		local dashboard = require("alpha.themes.dashboard")
		local button = dashboard.button

		local buttons = {
			type = "group",
			val = {
				button("e", "  New File", ":ene <BAR> <CR>"),
				button("<SPACE>m", "  File Explorer"),
				button("<SPACE>r", "  Recently Opened Files"),
				button("<SPACE>f", "  Search File"),
				button("<SPACE>/", "󰈞  Search Contents"),
				button("<SPACE>k", "  List Keymaps"),
				button("<SPACE>s", "  List Sessions"),
				button("<SPACE>p", "󰘳  Run Command"),
				button("<SPACE>P", "  List Plugin Status"),
				button("<SPACE>v", "  List Vim Options"),
				button("<SPACE>n", "󰍩  List Messages"),
				button("<SPACE>N", "󰍢  List Notifications"),
				button("<SPACE>h", "󰞋  Find Help"),
				button("q", "  Quit", ":qa<CR>"),
			},
			opts = { spacing = 0 },
		}

		local fn = vim.fn
		local marginTopPercent = 0.14
		local marginTop = fn.max({ 1, fn.floor(fn.winheight(0) * marginTopPercent) })

		return {
			"alpha",
			{
				sessionLimit = 9,
				layout = {
					{ type = "padding", val = marginTop },
					getHeader(),
					getTitle("Press j, k to move cursor"),
					buttons,
				},
				opts = { noautocmd = true },
			},
		}
	end,
}
