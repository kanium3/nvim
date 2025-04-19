-- WARN: plugins that depend on denops.vim that should not be lazy loaded with lazy.nvim configuration
return {
    {
        "vim-denops/denops.vim",
    },
    {
        "lambdalisue/vim-kensaku",
        dependencies = {
            "vim-denops/denops.vim",
        },
        lazy = true,
        config = function()
            local plugins = require("config.plugin").get_plugin_name_path()
            local this_path = plugins["kensaku.vim"] .. "/denops/kensaku/main.ts"
            vim.fn["denops#plugin#load"]("kensaku", this_path)
        end,
    },
    {
        "yuki-yano/fuzzy-motion.vim",
        dependencies = {
            "vim-denops/denops.vim",
            "lambdalisue/kensaku.vim",
        },
        keys = {
            { "<leader>fz", "<Cmd>FuzzyMotion<CR>", desc = "fuzzy finder" },
        },
        init = function()
            vim.g.fuzzy_motion_matchers = { "fzf", "kensaku" }
        end,
        config = function()
            local plugins = require("config.plugin").get_plugin_name_path()
            local this_path = plugins["fuzzy-motion.vim"] .. "/denops/fuzzy-motion/main.ts"
            vim.fn["denops#plugin#load"]("fuzzy-motion", this_path)
        end,
    },
}
