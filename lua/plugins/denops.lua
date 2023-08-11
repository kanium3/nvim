-- WARNING: plugins that depend on denops.vim should not be lazy loaded with lazy.nvim configuration
return {
    {
        'vim-denops/denops.vim',
        --lazy = false,
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
                useSkkServer = false
            }
        end
    }
}
