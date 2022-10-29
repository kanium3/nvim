---@diagnostic disable: need-check-nil
local cmp = require("cmp")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		---@diagnostic disable-next-line: missing-parameter
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "nvim_lsp_document_symbol" },
		{ name = "cmp-nvim-lsp-signature-help" },
	}, {
		{ name = "path" },
		{ name = "nvim_lua" },
	}, {
		{ name = "buffer" },
		{ name = "skkeleton" },
		{ name = "crates" },
		{ name = "rg" },
		{ name = "emoji" },
		{ name = "calc" },
		{ name = "omni" },
		{ name = "treesitter" },
		{ name = "fonts", option = { space_filter = "-" } },
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({
				mode = "symbol_text", -- show only symbol annotations
				maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			})(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			if strings[1] == "TypeParameter" then
				strings[1] = ""
				strings[2] = "Type Parameter"
			end
			kind.kind = " " .. strings[1] .. " "
			kind.menu = "    (" .. strings[2] .. ")"

			return kind
		end,
	},
})
-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "nvim_lsp_document_symbol" },
	}, {
		{ name = "buffer" },
	}),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
