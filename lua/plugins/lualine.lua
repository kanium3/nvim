return {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            globalstatus = true
        }
    },
    init = function ()
        vim.opt.laststatus = 3
    end
}
