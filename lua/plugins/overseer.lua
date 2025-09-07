return {
    "stevearc/overseer.nvim",
    opts = {
        strategy = "toggleterm",
    },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "stevearc/dressing.nvim" },
    keys = {
        { "<space>or", "<CMD>OverseerRun<CR>" },
        { "<space>oR", "<CMD>OverseerToggle<CR>" },
    },
}
