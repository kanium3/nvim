return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = function()
            -- On Windows you have to do it manually
            if not jit.os == "Windows" then
                vim.cmd("TSUpdate")
            end
        end,
        branch = "main",
        opts = {},
    },
    {
        "haringsrob/nvim_context_vt",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        event = {
            "BufNewFile",
            "BufRead",
        },
        opts = {},
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        event = {
            "BufNewFile",
            "BufRead",
        },
        branch = "main",
        config = function()
            -- keymaps
            vim.keymap.set("n", "<leader>a", function()
                require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
            end)
            vim.keymap.set("n", "<leader>A", function()
                require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
            end)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        event = {
            "BufNewFile",
            "BufRead",
        },
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {},
        event = {
            "BufNewFile",
            "BufRead",
        },
    },
    {
        "bennypowers/nvim-regexplainer",
        opts = {},
        event = { "BufNewFile", "BufRead" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufNewFile", "BufRead" },
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        opts = {},
    },
    {
        "Wansmer/treesj",
        keys = {
            { "<space>mm" },
            { "<space>jj" },
            { "<space>sp" },
        },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesj").setup({})
        end,
    },
}
