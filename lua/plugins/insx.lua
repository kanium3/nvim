return {
    "hrsh7th/nvim-insx",
    event = "InsertEnter",
    config = function()
        require("insx.preset.standard").setup({})
        local insx = require("insx")
        local pair = require("insx.recipe.auto_pair")
        local delete_pair = require("insx.recipe.delete_pair")
        insx.add(
            "<",
            insx.with(
                pair({
                    open = "<",
                    close = ">",
                }),
                {
                    insx.with.filetype({ "typescript", "typescriptreact", "rust" }),
                    insx.with.in_string(false),
                    insx.with.in_comment(false),
                }
            )
        )

        insx.add(
            "<BS>",
            insx.with(
                delete_pair({
                    open_pat = insx.helper.regex.esc("<"),
                    close_pat = insx.helper.regex.esc(">"),
                }),
                {
                    insx.with.filetype({ "typescript", "typescriptreact", "rust" }),
                    insx.with.in_string(false),
                    insx.with.in_comment(false),
                }
            )
        )
    end,
}
