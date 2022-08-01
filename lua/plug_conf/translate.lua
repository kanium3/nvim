local translate = require("translate")

translate.setup({
	default = {
		command = "translate_shell",
	},
	preset = {
		output = {
			split = {
				append = true,
			},
		},
	},
})
