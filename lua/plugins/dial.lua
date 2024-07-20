return {
    "monaqa/dial.nvim",
    keys = {
        {
            "<C-a>",
            "<Plug>(dial-increment)",
            { noremap = true },
            desc = "increase",
        },
        {
            "g<C-a>",
            "g<Plug>(dial-increment)",
            { noremap = true },
            desc = "global increase",
        },
        {
            "<C-x>",
            "<Plug>(dial-decrement)",
            { noremap = true },
            desc = "decrease",
        },
        {
            "g<C-x>",
            "g<Plug>(dial-decrement)",
            { noremap = true },
            desc = "global decrease",
        },
        {
            "<C-a>",
            "<Plug>(dial-increment)",
            mode = "v",
            { noremap = true },
            desc = "visual increase",
        },
        {
            "<C-x>",
            "<Plug>(dial-decrement)",
            mode = "v",
            { noremap = true },
            desc = "visual decrease",
        },
        {
            "g<C-a>",
            "g<Plug>(dial-increment)",
            mode = "v",
            { noremap = true },
            desc = "visual global increase",
        },
        {
            "g<C-x>",
            "g<Plug>(dial-decrement)",
            mode = "v",
            { noremap = true },
            desc = "visual global decrease",
        },
    },
    config = function()
        -- default setting: https://github.com/monaqa/dial.nvim
        local augend = require("dial.augend")
        require("dial.config").augends:register_group({
            default = {
                augend.integer.alias.decimal,
                augend.integer.alias.hex,
                augend.date.alias["%Y/%m/%d"],
                augend.constant.alias.bool
            },
            typescript = {
                augend.integer.alias.decimal,
                augend.integer.alias.hex,
                augend.constant.new({ elements = { "let", "const" } }),
            },
            visual = {
                augend.integer.alias.decimal,
                augend.integer.alias.hex,
                augend.date.alias["%Y/%m/%d"],
                augend.constant.alias.alpha,
                augend.constant.alias.Alpha,
                augend.constant.alias.bool
            },
        })
    end,
}
