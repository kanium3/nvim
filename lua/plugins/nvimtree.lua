return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    event = "VeryLazy",
    config = function()
        require("nvim-tree").setup({
            filters = {
                git_ignored = false
            }
        })
    end
}
