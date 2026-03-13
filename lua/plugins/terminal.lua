return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            float_opts = {
                border = "single",
            },
            direction = "float",
            hide_numbers = true,
            shade_terminals = true,
            close_on_exit = true,
        })
        require("config.tui")
    end,
    keys = {
        { "<leader>tr", "<CMD>ToggleTerm<CR>", mode = { "n" } },
    },
}
