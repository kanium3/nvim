require("bootstrap")
require("editor")
require("relative")

require("lazy").setup("plugins", {
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

require("keymap")

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("SetupTreeSitter", {}),
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

vim.cmd("colorscheme onedark")
