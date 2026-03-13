return {
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",     -- OPTIONAL: for git status
            "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
            animation = true,
        },
        version = "^1.0.0", -- optional: only update when a new 1.x version is released
        event = { "UIEnter" },
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-plenary",
        },
        ft = { "lua" },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-plenary"),
                },
            })
        end,
    },
    {
        "mfussenegger/nvim-dap",
        module = true,
        ft = { "rust", "c", "cpp" },
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        ft = { "rust", "c", "cpp" },
        opts = {},
    },
    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        keys = {
            { "<leader>sb", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {
            symbol_folding = {
                autofold_depth = false,
            },
        },
    },
    {
        "mrjones2014/op.nvim",
        event = { "VeryLazy" },
        build = "make install",
        enabled = false,
        config = function()
            local op_opts = require("config.wsl").is_wsl()
                and {
                    op_cli_path = "/mnt/c/Users/annko/AppData/Local/Microsoft/WinGet/Links/op.exe",
                    global_args = {
                        "--no-color",
                    },
                }
                or {}
            require("op").setup(op_opts)
        end,
    },
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
    {
        "stevearc/overseer.nvim",
        opts = {
            strategy = "toggleterm",
        },
        dependencies = { "stevearc/dressing.nvim" },
        keys = {
            { "<space>or", "<CMD>OverseerRun<CR>" },
            { "<space>oR", "<CMD>OverseerToggle<CR>" },
        },
    },
    {
        "nvim-pack/nvim-spectre",
        opts = {},
        keys = {
            {
                "<leader>S",
                "<cmd>lua require('spectre').toggle()<CR>",
                mode = { "n" },
                desc = "Toggle Spectre",
            },
            {
                "<leader>sw",
                "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
                mode = { "n" },
                desc = "Search current word",
            },
            {
                "<leader>sw",
                "<esc><cmd>lua require('spectre').open_visual()<CR>",
                mode = { "v" },
                desc = "Search current word",
            },
            {
                "<leader>sp",
                "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
                mode = { "n" },
                desc = "Search on current file",
            },
        },
    },
}
