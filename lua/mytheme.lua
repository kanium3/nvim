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

