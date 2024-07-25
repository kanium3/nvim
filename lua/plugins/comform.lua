-- from: https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#lazy-loading-with-lazynvim
return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>ff",
            function()
                require("conform").format({ async = true })
            end,
            desc = "Format buffer",
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}
