return {
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
        { "te", "<cmd>Translate EN<CR>", mode = { "x" }, desc = "Translate to English" },
    },
}
