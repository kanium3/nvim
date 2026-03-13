return {
    {
        "monaqa/dial.nvim",
        keys = {
            {
                "<C-a>",
                "<Plug>(dial-increment)",
                { noremap = true },
                desc = "increase",
            },
            {
                "g<C-a>",
                "g<Plug>(dial-increment)",
                { noremap = true },
                desc = "global increase",
            },
            {
                "<C-x>",
                "<Plug>(dial-decrement)",
                { noremap = true },
                desc = "decrease",
            },
            {
                "g<C-x>",
                "g<Plug>(dial-decrement)",
                { noremap = true },
                desc = "global decrease",
            },
            {
                "<C-a>",
                "<Plug>(dial-increment)",
                mode = "v",
                { noremap = true },
                desc = "visual increase",
            },
            {
                "<C-x>",
                "<Plug>(dial-decrement)",
                mode = "v",
                { noremap = true },
                desc = "visual decrease",
            },
            {
                "g<C-a>",
                "g<Plug>(dial-increment)",
                mode = "v",
                { noremap = true },
                desc = "visual global increase",
            },
            {
                "g<C-x>",
                "g<Plug>(dial-decrement)",
                mode = "v",
                { noremap = true },
                desc = "visual global decrease",
            },
        },
        config = function()
            -- default setting: https://github.com/monaqa/dial.nvim
            local augend = require("dial.augend")
            require("dial.config").augends:register_group({
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias["%Y/%m/%d"],
                    augend.constant.alias.bool,
                },
                typescript = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.constant.new({ elements = { "let", "const" } }),
                },
                visual = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias["%Y/%m/%d"],
                    augend.constant.alias.alpha,
                    augend.constant.alias.Alpha,
                    augend.constant.alias.bool,
                },
            })
        end,
    },
    {
        "kevinhwang91/nvim-hlslens",
        event = { "BufNewFile", "BufRead" },
        config = function()
            require("hlslens").setup({})
            local kopts = { noremap = true, silent = true }

            vim.api.nvim_set_keymap(
                "n",
                "n",
                [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
                kopts
            )
            vim.api.nvim_set_keymap(
                "n",
                "N",
                [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
                kopts
            )
            vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
        end,
    },
    {
        "hrsh7th/nvim-insx",
        event = "InsertEnter",
        config = function()
            require("insx.preset.standard").setup({})
            local insx = require("insx")
            local pair = require("insx.recipe.auto_pair")
            local delete_pair = require("insx.recipe.delete_pair")
            insx.add(
                "<",
                insx.with(
                    pair({
                        open = "<",
                        close = ">",
                    }),
                    {
                        insx.with.filetype({ "typescript", "typescriptreact", "rust" }),
                        insx.with.in_string(false),
                        insx.with.in_comment(false),
                    }
                )
            )

            insx.add(
                "<BS>",
                insx.with(
                    delete_pair({
                        open_pat = insx.helper.regex.esc("<"),
                        close_pat = insx.helper.regex.esc(">"),
                    }),
                    {
                        insx.with.filetype({ "typescript", "typescriptreact", "rust" }),
                        insx.with.in_string(false),
                        insx.with.in_comment(false),
                    }
                )
            )
        end,
    },
    {
        "https://codeberg.org/andyg/leap.nvim",
        config = function()
            require("leap").opts.preview = function(ch0, ch1, ch2)
                return not (ch1:match("%s") or (ch0:match("%a") and ch1:match("%a") and ch2:match("%a")))
            end
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
}
