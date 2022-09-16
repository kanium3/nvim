-- colorscheme

require("onedark").setup({
	style = "darker",
	code_style = {
		comments = "italic",
		keywords = "bold",
		functions = "italic",
		strings = "none",
		variables = "bold",
	},
})
require("onedark").load()
--require('onedarkpro').load()
--vim.cmd("colorscheme oxocarbon")
--[[require("tokyonight").setup({
	style = "night",
	transparent = true,
	hide_inactive_statusline = true,
	styles = {
		functions = { italic = true },
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
})
]]

--require('onenord').setup()
--vim.cmd([[colorscheme tokyonight]])
