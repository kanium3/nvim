return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        "stevearc/dressing.nvim"
    },
    event = "VeryLazy",
    enabled = false,
    config = function()
        require("nvim-tree").setup({
            filters = {
                git_ignored = false
            }
        })
    end
}
