local devicons = require("nvim-web-devicons")

devicons.setup({})

devicons.set_icon({
	["ts"] = {
		icon = "ﯤ",
		color = "#3178C6",
		cterm_color = "67",
		name = "Ts",
	},
	["js"] = {
		icon = "",
		color = "#cbcb41",
		cterm_color = "185",
		name = "Js",
	},
})
