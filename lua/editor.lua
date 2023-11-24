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
else
    vim.o.guifont = "JetBrainsMono NF,UD デジタル 教科書体 NP-B,IBM Plex Sans JP:h13.5"
end
