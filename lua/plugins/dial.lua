return {
    "monaqa/dial.nvim",
    keys = {
        {
            "<C-a>",
            function()
                require("dial.map").inc_normal()
            end,
            desc = "increase"
        },
        {
            "g<C-a>",
            function()
                require("dial.map").inc_gnormal()
            end,
            desc = "global increase"
        },
        {
            "<C-x>",
            function()
                require("dial.map").dec_normal()
            end,
            desc = "decrease"
        },
        {
            "g<C-x>",
            function()
                require("dial.map").dec_gnormal()
            end,
            desc = "global decrease"
        },
        {
            "<C-a>",
            function()
                require("dial.map").inc_visual()
            end,
            mode = "v",
            desc = "visual increase"
        },
        {
            "<C-x>",
            function()
                require("dial.map").dec_visual()
            end,
            mode = "v",
            desc = "visual decrease"
        },
        {
            "g<C-a>",
            function()
                require("dial.map").inc_gvisual()
            end,
            mode = "v",
            desc = "visual global increase"
        },
        {
            "g<C-x>",
            function()
                require("dial.map").dec_gvisual()
            end,
            mode = "v",
            desc = "visual global decrease"
        },
    }
}
