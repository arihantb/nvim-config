return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"RileyGabrielson/inspire.nvim",
	},
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local inspire = require("inspire")

		local function getVersion()
			local info = vim.version()
			local version = string.format("Version: %s.%s.%s", info.major, info.minor, info.patch)

			if info.prerelease then
				version = version .. " (prerelease)"
			end

			return { type = "text", val = version, opts = { position = "center", hl = "AlphaNvimVersion" } }
		end

		local function getDateTime()
			local date = os.date(" %A, %d %B, %Y")
			local time = os.date(" %I:%M:%S %p")

			return {
				type = "group",
				val = {
					{ type = "text", val = date, opts = { hl = "AlphaDate", position = "center" } },
					{ type = "text", val = time, opts = { hl = "AlphaTime", position = "center" } },
				},
			}
		end

		local logo = [[                                              
       ███████████           █████      ██
      ███████████             █████ 
      ████████████████ ███████████ ███   ███████
     ████████████████ ████████████ █████ ██████████████
    █████████████████████████████ █████ █████ ████ █████
  ██████████████████████████████████ █████ █████ ████ █████
 ██████  ███ █████████████████ ████ █████ █████ ████ ██████
 ██████   ██  ███████████████   ██ █████████████████]]

		local timer = nil
		local header_hl = {
			{ { "AlphaHeader0_0", 46, 48 } },
			{
				{ "AlphaHeader1_0", 7, 22 },
				{ "AlphaHeader1_1", 33, 40 },
				{ "AlphaHeader1_2", 40, 50 },
			},
			{
				{ "AlphaHeader2_0", 6, 21 },
				{ "AlphaHeader2_1", 33, 45 },
			},
			{
				{ "AlphaHeader3_0", 6, 19 },
				{ "AlphaHeader3_1", 19, 20 },
				{ "AlphaHeader3_2", 20, 35 },
				{ "AlphaHeader3_3", 35, 45 },
				{ "AlphaHeader3_4", 45, 90 },
			},
			{
				{ "AlphaHeader4_0", 5, 18 },
				{ "AlphaHeader4_1", 18, 36 },
				{ "AlphaHeader4_2", 36, 45 },
				{ "AlphaHeader4_3", 45, 90 },
			},
			{
				{ "AlphaHeader5_0", 4, 17 },
				{ "AlphaHeader5_1", 17, 24 },
				{ "AlphaHeader5_2", 24, 28 },
				{ "AlphaHeader5_3", 28, 37 },
				{ "AlphaHeader5_4", 37, 46 },
				{ "AlphaHeader5_5", 46, 90 },
			},
			{
				{ "AlphaHeader6_0", 2, 17 },
				{ "AlphaHeader6_1", 17, 38 },
				{ "AlphaHeader6_2", 38, 45 },
				{ "AlphaHeader6_3", 46, 90 },
			},
			{
				{ "AlphaHeader7_0", 1, 17 },
				{ "AlphaHeader7_1", 17, 38 },
				{ "AlphaHeader7_2", 38, 45 },
				{ "AlphaHeader7_3", 46, 90 },
			},
			{
				{ "AlphaHeader8_0", 1, 37 },
				{ "AlphaHeader8_1", 37, 91 },
			},
			{ { "Red", 1, 1 } },
		}

		local utils = require("alpha.utils")
		local header_val = vim.split(logo, "\n")

		header_hl = utils.charhl_to_bytehl(header_hl, header_val, false)
		dashboard.section.header.opts.hl = header_hl
		dashboard.section.header.val = header_val

		local update_dashboard_layout = function()
			dashboard.config.layout = {
				{ type = "padding", val = 2 },
				dashboard.section.header,
				getVersion(),
				{ type = "padding", val = 1 },
				getDateTime(),
				{ type = "padding", val = 2 },
				dashboard.section.buttons,
				{ type = "padding", val = 2 },
				dashboard.section.footer,
			}

			if vim.bo.filetype == "alpha" then
				pcall(vim.cmd.AlphaRedraw)
			end
		end

		local function custom_button(sc, txt, keybind, keybind_opts)
			local button = dashboard.button(sc, txt, keybind, keybind_opts)
			local icon = txt:match("^%s*([^ ]+)")
			local text_part = txt:gsub("^%s*[^ ]+%s*", "")
			local icon_start = txt:find(icon) - 1
			local icon_end = icon_start + #icon
			local text_start = txt:find(text_part) - 1
			local text_end = #txt
			local button_hl = (sc == "q") and "AlphaButtonSpecial" or "AlphaButtonText"

			button.opts.hl = {
				{ "AlphaButtonIcon", icon_start, icon_end },
				{ button_hl, text_start, text_end },
			}

			return button
		end

		dashboard.section.buttons.val = {
			custom_button("e", "  New File", ":ene <BAR> <CR>"),
			custom_button("<leader>ef", "  File Explorer"),
			custom_button("<leader>to", "  Recently Opened Files"),
			custom_button("<leader>tf", "  Search File"),
			custom_button("<leader>tg", "󰈞  Search Contents"),
			custom_button("<leader>tk", "  List Keymaps"),
			custom_button("<leader>wl", "  List Sessions"),
			custom_button("<leader>tc", "󰘳  List Command"),
			custom_button("<leader>ps", "  List Plugin Status"),
			custom_button("<leader>tv", "  List Vim Options"),
			custom_button("<leader>tm", "󰍩  List Messages"),
			custom_button("<leader>tn", "󰍢  List Notifications"),
			custom_button("<leader>th", "󰞋  Find Help"),
			custom_button("q", "  Quit", ":qa<CR>"),
		}

		dashboard.section.buttons.opts.hl = "AlphaHeader1_0"
		dashboard.section.buttons.opts.spacing = 0

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			once = true,
			callback = function()
				local quote = inspire.get_quote()
				local centered_quote = inspire.center_text(quote.text, quote.author, 52, 8, 52)
				local footer = {}

				for _, line_text in pairs(centered_quote) do
					table.insert(footer, line_text)
				end

				dashboard.section.footer.val = footer
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		update_dashboard_layout()

		local group = vim.api.nvim_create_augroup("CleanDashboard", {})

		vim.api.nvim_create_autocmd("User", {
			group = group,
			pattern = "AlphaReady",
			callback = function()
				vim.opt.showcmd = false
				vim.opt.ruler = false

				local buf = vim.api.nvim_get_current_buf()
				local scroll_keys = {
					"<ScrollWheelUp>",
					"<ScrollWheelDown>",
					"<C-u>",
					"<C-d>",
					"<C-b>",
					"<C-f>",
					"<PageUp>",
					"<PageDown>",
					"gg",
					"G",
				}

				for _, key in ipairs(scroll_keys) do
					vim.api.nvim_buf_set_keymap(buf, "n", key, "<Nop>", { noremap = true, silent = true })
				end

				if timer then
					timer:stop()
				end

				timer = vim.uv.new_timer()
				timer:start(1000, 1000, vim.schedule_wrap(update_dashboard_layout))
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			callback = function()
				if pcall(require, "mini.map") then
					require("mini.map").close()
				end
			end,
		})

		vim.api.nvim_create_autocmd("BufUnload", {
			group = group,
			pattern = "<buffer>",
			callback = function()
				vim.opt.showcmd = true
				vim.opt.ruler = true

				if timer then
					timer:stop()
					timer = nil
				end
			end,
		})

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
