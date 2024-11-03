return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("lint").linters_by_ft = {
            lua = { "selene" },
            python = { "ruff" },
            yaml = { "actionlint" }
        }
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
