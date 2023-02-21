-- editor setting
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.helplang = { "ja", "en" }
vim.opt.clipboard:append("unnamedplus")
vim.opt.updatetime = 100
vim.opt.laststatus = 3
--vim.g.loaded = 1
--vim.g.loaded_netrwPlugin = 1
-- font
vim.cmd([[
set guifont=JetBrains\ Mono:h14.5
]])

vim.cmd("syntax on")
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_confirm_quit = true
vim.g.neovide_underline_automatic_scaling = true

-- auto plugin action
vim.cmd([[autocmd BufWritePost plug_config/main.lua PackerCompile]])
-- notify
vim.notify = require("notify")
-- ui
vim.cmd([[let g:popui_border_style = "double"]])
vim.ui.select = require("popui.ui-overrider")
vim.ui.input = require("popui.input-overrider")

-- lightbulb
vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]])
-- yank highlight
vim.cmd([[augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END]])
vim.o.background = "dark"
vim.o.termguicolors = true
-- lsp
vim.lsp.set_log_level("debug")
-- fold
vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
]])
