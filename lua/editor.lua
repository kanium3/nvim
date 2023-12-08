vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.g.markdown_fenced_languages = {
    "ts=typescript",
}

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.opt.ff = "unix"

-- fold setting
vim.cmd([[
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set nofoldenable
]])

if vim.g.neovide and jit.os == 'Linux' then
    vim.o.guifont = "JetBrainsMono NF,IBM Plex Sans JP:h10"
elseif vim.g.neovide and jit.os == "Windows" then
    vim.opt.guifont = "JetBrainsMono_Nerd_Font_Mono,UD_デジタル_教科書体_NP-B,IBM_Plex_Sans_JP:h13.5"
end
