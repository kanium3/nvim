-- WARNING: plugins that depend on denops.vim should not be lazy loaded with lazy.nvim configuration
return {
    {
        --please see: https://github.com/vim-denops/denops.vim/issues/272
        'vim-denops/denops.vim',
        event = "VeryLazy"
    },
    {
        "vim-skk/skkeleton",
        dependencies = {
            "vim-denops/denops.vim"
        },
        keys = {
            { "<C-j>", "<Plug>(skkeleton-toggle)", mode = { "i", "c", "l" } },
        },
        config = function()
            -- Lazy loaded by using this function
            vim.fn["denops#plugin#register"]("skkeleton")

            vim.fn["skkeleton#config"] {
                useSkkServer = true
            }
        end
    },
    {
        "lambdalisue/kensaku.vim",
        dependencies = {
            "vim-denops/denops.vim"
        },
        lazy = true,
        config = function()
            vim.fn["denops#plugin#register"]("kensaku")
        end
    },
    {
        "yuki-yano/fuzzy-motion.vim",
        dependencies = {
            "vim-denops/denops.vim",
            "lambdalisue/kensaku.vim"
        },
        keys = {
            { "<leader>fz", "<Cmd>FuzzyMotion<CR>", desc = "fuzzy finder" }
        },
        config = function()
            vim.fn["denops#plugin#register"]("fuzzy-motion")
            vim.g.fuzzy_motion_matchers = { "fzf", "kensaku" }
        end
    },
    {
        "lambdalisue/gin.vim",
        cmd = "Gin",
        dependencies = {
            "vim-denops/denops.vim",
        },
        config = function()
            vim.fn["denops#plugin#register"]("gin")
        end
    }
}
