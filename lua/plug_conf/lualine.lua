local lualine = require("lualine")
local navic = require("nvim-navic")
local tabline = require("tabline")

lualine.setup {
	sections = {
		lualine_x = {
			{ 'encoding', 'fileformat', 'filetype' },
			{ 'lsp_progress' }
		},
		lualine_c = {
			{
				navic.get_location,
				cond = navic.is_available
			}
		},
	},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { tabline.tabline_buffers },
		lualine_x = { tabline.tabline_tabs },
		lualine_y = {},
		lualine_z = {},
	},
}
