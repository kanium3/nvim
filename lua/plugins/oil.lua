return {
    {
        "stevearc/oil.nvim",
        opts = {
            win_options = {
                signcolumn = "yes:2",
            },
        },
        -- Optional dependencies
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
        keys = {
            { "<leader>ss", "<Cmd>Oil<CR>", desc = "Open parent directory" },
        },
    },
    {
        "refractalize/oil-git-status.nvim",
        dependencies = {
            "stevearc/oil.nvim",
        },
        config = true,
        keys = {
            { "<leader>ss", "<Cmd>Oil<CR>", desc = "Open parent directory" },
        },
    },
}
