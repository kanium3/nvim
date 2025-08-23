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
vim.o.foldenable = true
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
-- neovide setting
if vim.g.neovide and jit.os == "Linux" then
    vim.g.neovide_scale_factor = 1.3
    vim.o.guifont = "JetBrainsMono NF,IBM Plex Sans JP:h10"
    vim.g.neovide_cursor_vfx_mode = "torpedo"
elseif vim.g.neovide and jit.os == "Windows" then
    vim.opt.guifont = "JetBrainsMono_Nerd_Font_Mono,UD_デジタル_教科書体_NP-B,IBM_Plex_Sans_JP:h13.5"
    vim.g.neovide_cursor_vfx_mode = "torpedo"
else
    vim.o.guifont = "JetBrainsMono NF,UD デジタル 教科書体 NP-B,IBM Plex Sans JP:h13.5"
    vim.g.neovide_cursor_vfx_mode = "torpedo"
end

-- yanked
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#008080" })
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
    end,
})

vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("SetupTreeSitter", {}),
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
