return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "LspAttach",
    config = function()
        require("trouble").setup({})

        vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { silent = true })
    end
}
