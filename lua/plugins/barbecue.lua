return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    event = "LspAttach",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        attach_navic = false
    },
}
