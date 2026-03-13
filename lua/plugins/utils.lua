return {
    {
        "jghauser/mkdir.nvim",
        event = { "VeryLazy" },
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
        module = true,
    },
    {
        "MunifTanjim/nui.nvim",
        lazy = true,
        module = true,
    },
    {
        "stevearc/dressing.nvim",
        opts = {},
        lazy = true,
        module = true,
    },
    {
        "kanium3/neovide-ime.nvim",
        event = { "UIEnter" },
    },
    {
        "simeji/winresizer",
        keys = {
            { "<C-e>", "<Cmd>WinResizerStartResize<CR>", desc = "resize mode" },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "uga-rosa/translate.nvim",
        opts = {
            default = {
                command = "translate_shell",
                output = "replace",
            },
            preset = {
                output = {
                    replace = {
                        head = 0,
                        rate = 100,
                    },
                },
            },
        },
        keys = {
            { "<leader>te", "<cmd>Translate EN<CR>", mode = { "n" }, desc = "Translate to English" },
            { "te",         "<cmd>Translate EN<CR>", mode = { "x" }, desc = "Translate to English" },
        },
    },
    {
        "mvllow/modes.nvim",
        tag = "v0.3.0",
        event = "ModeChanged",
        opts = {},
    },
    {
        "chrisbra/Recover.vim",
        event = "SwapExists",
    },
    {
        "wfxr/minimap.vim",
        build = "cargo install --locked code-minimap",
        keys = {
            { "<leader>mn", "<Cmd>MinimapToggle<CR>", desc = "Toggle minimap.vim" },
        },
        init = function()
            vim.g.minimap_width = 10
        end,
    },
    {
        {
            "kevinhwang91/nvim-ufo",
            dependencies = "kevinhwang91/promise-async",
            event = { "BufNewFile", "BufRead" },
            config = function()
                require("ufo").setup({
                    ---@diagnostic disable-next-line: unused-local
                    provider_selector = function(bufnr, filetype, buftype)
                        return { "treesitter", "indent" }
                    end,
                })
                vim.keymap.set("n", "zR", require("ufo").openAllFolds)
                vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
            end,
            enabled = false,
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }

            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            require("ibl").setup({ indent = { highlight = highlight } })
        end,
    },
    {
        "m-demare/hlargs.nvim",
        event = { "BufNewFile", "BufRead" },
        opts = {},
    },
    {
        "uga-rosa/ccc.nvim",
        event = { "BufNewFile", "BufRead" },
        opts = {
            highlighter = {
                auto_enable = true,
                lsp = true
            }
        }
    }
}
