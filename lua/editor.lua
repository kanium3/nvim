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

if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font Mono,UD デジタル 教科書体 NP-B,IBM Plex Sans JP:h13.5"
end
