return {
    "Wansmer/treesj",
    keys = {
        { "<space>mm" },
        { "<space>jj" },
        { "<space>sp" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("treesj").setup({})
    end,
}
