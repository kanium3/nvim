return {
    {
        "anuvyklack/fold-preview.nvim",
        dependencies = { "anuvyklack/keymap-amend.nvim" },
        opts = {},
        event = { "BufNewFile", "BufRead" },
    },
    {
        "anuvyklack/pretty-fold.nvim",
        opts = {},
        event = { "BufNewFile", "BufRead" },
    },
}
