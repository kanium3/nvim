local lualine = require("lualine")
local navic = require("nvim-navic")
local tabline = require("tabline")

lualine.setup({
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "M" }, right_padding = 2 },
		},
		lualine_x = {
			{ "encoding" },
			{ "fileformat" },
			{ "filetype" },
		},
		lualine_c = {
			{"lsp_progress"}
		},
		lualine_z = {
			{ "location", separator = { right = "L" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { tabline.tabline_buffers },
		lualine_x = { tabline.tabline_tabs },
		lualine_y = {},
		lualine_z = {
		},
	},

	winbar = {
		lualine_a = {
			{
			navic.get_location,
			cond = navic.is_available,
			}
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	options = {
		theme = "onedark",
		section_separators = { left = "|", right = "|" },
		component_separators = "|",
		globalstatus = true
	},
})
