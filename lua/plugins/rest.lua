return {
    "rest-nvim/rest.nvim",
    cmd = { "Rest" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    init = function()
        ---@type Rest.Opts
        vim.g.rest_nvim = {}
    end,
}
