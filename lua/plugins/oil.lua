return {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>ss", "<Cmd>Oil<CR>", desc = "Open parent directory" },
    },
}
