-- colorscheme

require("onedark").setup({
	style = "darker",
	term_color = true,
	code_style = {
		comments = "italic",
		keywords = "bold",
		functions = "italic",
		strings = "none",
		variables = "bold",
	},
	lualine = {
		transparent = true
	}
})

require("onedark").load()

-- highlights
vim.api.nvim_set_hl(0, "@lsp.typemod.comment.documentation", { link = "Special" })
