return {
	"hrsh7th/nvim-cmp",
	-- nvim-cmp is a completion plugin for Neovim.
	dependencies = {
		-- cmp-buffer provides completion suggestions from the current buffer.
		"hrsh7th/cmp-buffer",
		-- cmp-path provides completion suggestions for file paths.
		"hrsh7th/cmp-path",
		-- LuaSnip is a snippet engine for Neovim.
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		-- cmp_luasnip integrates nvim-cmp with LuaSnip.
		"saadparwaiz1/cmp_luasnip",
		-- friendly-snippets provides a collection of pre-made snippets.
		"rafamadriz/friendly-snippets",
		-- nvim-treesitter provides code parsing and analysis, which can be used for completion.
		"nvim-treesitter/nvim-treesitter",
		-- lspkind.nvim provides fancy icons for completion items based on LSP kind.
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local has_luasnip, luasnip = pcall(require, "luasnip")
		local lspkind = require("lspkind")

		-- helper function to convert keybindings to be processed by nvim-cmp.
		local rhs = function(keys)
			return vim.api.nvim_replace_termcodes(keys, true, true, true)
		end

		-- mapping of LSP completion item kinds to custom icons.
		local lsp_kinds = {
			Class = " ",
			Color = " ",
			Constant = " ",
			Constructor = " ",
			Enum = " ",
			EnumMember = " ",
			Event = " ",
			Field = " ",
			File = " ",
			Folder = " ",
			Function = " ",
			Interface = " ",
			Keyword = " ",
			Method = " ",
			Module = " ",
			Operator = " ",
			Property = " ",
			Reference = " ",
			Snippet = " ",
			Struct = " ",
			Text = " ",
			TypeParameter = " ",
			Unit = " ",
			Value = " ",
			Variable = " ",
		}

		-- get the current column of the cursor.
		local column = function()
			local _, col = table.unpack(vim.api.nvim_win_get_cursor(0))
			return col
		end

		-- check if the cursor is currently within a LuaSnip snippet.
		local in_snippet = function()
			local session = require("luasnip.session")
			local node = session.current_nodes[vim.api.nvim_get_current_buf()]

			if not node then
				return false
			end

			local snippet = node.parent.snippet
			local snip_begin_pos, snip_end_pos = snippet.mark:pos_begin_end()
			local pos = vim.api.nvim_win_get_cursor(0)

			if pos[1] - 1 >= snip_begin_pos[1] and pos[1] - 1 <= snip_end_pos[1] then
				return true
			end
		end

		-- check if the cursor is in a whitespace character.
		local in_whitespace = function()
			local col = column()
			return col == 0 or vim.api.nvim_get_current_line():sub(col, col):match("%s")
		end

		-- check if the cursor is in the leading indentation of a line.
		local in_leading_indent = function()
			local col = column()
			local line = vim.api.nvim_get_current_line()
			local prefix = line:sub(1, col)
			return prefix:find("^%s*$")
		end

		-- determine the shift width, prioritizing softtabstop.
		local shift_width = function()
			if vim.o.softtabstop <= 0 then
				return vim.fn.shiftwidth()
			else
				return vim.o.softtabstop
			end
		end

		-- smart backspace functionality.
		local smart_bs = function(dedent)
			local keys = nil

			if vim.o.expandtab then
				if dedent then
					-- dedent if expandtab is set.
					keys = "<C-D>"
				else
					-- normal backspace if expandtab is set.
					keys = "<BS>"
				end
			else
				local col = column()
				local line = vim.api.nvim_get_current_line()
				local prefix = line:sub(1, col)

				if in_leading_indent() then
					-- backspace in leading indent.
					keys = "<BS>"
				else
					local previous_char = prefix:sub(#prefix, #prefix)

					if previous_char ~= " " then
						-- backspace if previous char is not a space.
						keys = "<BS>"
					else
						-- if previous char is a space and not in leading indent,
						-- temporarily set expandtab, backspace, then unset it.
						keys = "<C-\\><C-o>:set expandtab<CR><BS><C-\\><C-o>:set noexpandtab<CR>"
					end
				end
			end

			vim.api.nvim_feedkeys(rhs(keys), "nt", true)
		end

		-- smart tab functionality.
		local smart_tab = function(_)
			local keys = nil

			if vim.o.expandtab then
				-- normal tab if expandtab is set.
				keys = "<Tab>"
			else
				local col = column()
				local line = vim.api.nvim_get_current_line()
				local prefix = line:sub(1, col)
				local in_leading_indent_ = prefix:find("^%s*$")

				if in_leading_indent_ then
					-- tab in leading indent.
					keys = "<Tab>"
				else
					local sw = shift_width()
					local previous_char = prefix:sub(#prefix, #prefix)
					local previous_column = #prefix - #previous_char + 1
					local current_column = vim.fn.virtcol({ vim.fn.line("."), previous_column }) + 1
					local remainder = (current_column - 1) % sw
					local move = remainder == 0 and sw or sw - remainder
					-- insert spaces to align to shiftwidth.
					keys = (" "):rep(move)
				end
			end

			vim.api.nvim_feedkeys(rhs(keys), "nt", true)
		end

		-- select the next item in the completion menu.
		local select_next_item = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end

		-- select the previous item in the completion menu.
		local select_prev_item = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end

		-- confirm the selected completion item.
		local confirm = function(entry)
			local behavior = cmp.ConfirmBehavior.Replace

			if entry then
				local completion_item = entry.completion_item
				local new_text = ""

				if completion_item.textEdit then
					new_text = completion_item.textEdit.new_text
				elseif type(completion_item.insertText) == "string" and completion_item.insertText ~= "" then
					new_text = completion_item.insertText
				else
					new_text = completion_item.word or completion_item.label or ""
				end

				-- calculate the difference in characters after the cursor.
				local diff_after = math.max(0, entry.replace_range["end"].character + 1) - entry.context.cursor.col

				-- determine if the completion should insert or replace based on the text after the cursor.
				if entry.context.cursor_after_line:sub(1, diff_after) ~= new_text:sub(-diff_after) then
					behavior = cmp.ConfirmBehavior.Insert
				end
			end

			cmp.confirm({ select = true, behavior = behavior })
		end

		-- lazily load snippets from VSCode format.
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			experimental = {
				-- disable ghost text for now.
				ghost_text = false,
			},
			completion = {
				-- options for completion menu.
				completeopt = "menu,menuone,noinsert",
			},
			window = {
				-- borders for the documentation and completion windows.
				documentation = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				},
				completion = {
					border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
				},
			},
			snippet = {
				-- function to expand snippets using LuaSnip.
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = cmp.config.sources({
				-- configure completion sources.
				-- snippet completion.
				{ name = "luasnip" },
				-- completion for lazy.nvim development.
				{ name = "lazydev" },
				-- LSP completion.
				{ name = "nvim_lsp" },
				-- buffer completion.
				{ name = "buffer" },
				-- path completion.
				{ name = "path" },
				-- spell checking completion.
				{
					name = "spell",
					option = {
						enable_in_context = function()
							local ft = vim.bo.filetype
							-- enable spell check for markdown and text files.
							return ft == "markdown" or ft == "text"
						end,
					},
				},
			}),

			-- key mappings for nvim-cmp.
			mapping = cmp.mapping.preset.insert({
				-- backspace mapping.
				["<BS>"] = cmp.mapping(function(_)
					smart_bs()
				end, { "i", "s" }),

				-- abort completion.
				["<C-w>"] = cmp.mapping.abort(),

				-- toggle documentation window.
				["<C-d>"] = cmp.mapping(function()
					if cmp.visible_docs() then
						cmp.close_docs()
					else
						cmp.open_docs()
					end
				end, { "i", "s" }),

				-- scroll documentation.
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-k>"] = cmp.mapping.scroll_docs(-4),

				-- navigate completion menu.
				["<C-n>"] = cmp.mapping(select_next_item),
				["<C-p>"] = cmp.mapping(select_prev_item),
				["<Down>"] = cmp.mapping(select_next_item),
				["<Up>"] = cmp.mapping(select_prev_item),

				-- confirm completion.
				["<C-y>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						confirm(entry)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						confirm(entry)
					else
						fallback()
					end
				end, { "i", "s" }),

				-- shift Tab for previous item or snippet jump.
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif has_luasnip and in_snippet() and luasnip.jumpable(-1) then
						-- jump to previous snippet placeholder.
						luasnip.jump(-1)
					elseif in_leading_indent() then
						-- dedent if in leading indent.
						smart_bs(true)
					elseif in_whitespace() then
						-- smart backspace if in whitespace.
						smart_bs()
					else
						fallback()
					end
				end, { "i", "s" }),

				-- tab for next item, snippet expansion, or smart tab.
				["<Tab>"] = cmp.mapping(function(_)
					if cmp.visible() then
						local entries = cmp.get_entries()

						if #entries == 1 then
							-- confirm if only one entry.
							confirm(entries[1])
						else
							-- select next item.
							cmp.select_next_item()
						end
					elseif has_luasnip and luasnip.expand_or_locally_jumpable() then
						-- expand or jump snippet.
						luasnip.expand_or_jump()
					elseif in_whitespace() then
						-- smart tab for indentation.
						smart_tab()
					else
						-- trigger completion.
						cmp.complete()
					end
				end, { "i", "s" }),
			}),
			-- formatting for completion items.
			formatting = {
				format = function(entry, vim_item)
					-- add LSP kind icon and menu.
					vim_item.kind = string.format("%s %s", lsp_kinds[vim_item.kind] or "", vim_item.kind)
					vim_item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[LaTeX]",
					})[entry.source.name]
					-- apply lspkind formatting.
					vim_item = lspkind.cmp_format({
						maxwidth = 25,
						ellipsis_char = "...",
					})(entry, vim_item)

					return vim_item
				end,
			},
		})

		-- function to toggle ghost text based on cursor position and character after.
		local config = require("cmp.config")
		local toggle_ghost_text = function()
			if vim.api.nvim_get_mode().mode ~= "i" then
				return
			end

			local cursor_column = vim.fn.col(".")
			local current_line_contents = vim.fn.getline(".")
			local character_after_cursor = current_line_contents:sub(cursor_column, cursor_column)
			-- enable ghost text if cursor is at end of line or character after is not a word character.
			local should_enable_ghost_text = character_after_cursor == ""
				or vim.fn.match(character_after_cursor, [[\k]]) == -1
			local current = config.get().experimental.ghost_text

			if current ~= should_enable_ghost_text then
				config.set_global({
					experimental = {
						ghost_text = should_enable_ghost_text,
					},
				})
			end
		end

		-- create autocommands to toggle ghost text on InsertEnter and CursorMovedI.
		vim.api.nvim_create_autocmd({ "InsertEnter", "CursorMovedI" }, {
			callback = toggle_ghost_text,
		})
	end,
}
