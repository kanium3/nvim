return {
    'stevearc/overseer.nvim',
    opts = {
        strategy = "toggleterm"
    },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "stevearc/dressing.nvim" }
}
