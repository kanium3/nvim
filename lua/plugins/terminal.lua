return {
    "akinsho/toggleterm.nvim",
    event = { "VeryLazy" },
    config = function()
        require("toggleterm").setup({
            float_opts = {
                border = "single"
            },
            direction = "float",
            hide_numbers = true,
            shade_terminals = true,
            close_on_exit = true
        })
        require("config.tui")

        vim.keymap.set("n", "<leader>tr", "<CMD>ToggleTerm<CR>", { silent = true })
    end,
}
