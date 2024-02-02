return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        require("onedarkpro").setup({
            highlights = {
                ["@keyword"] = { fg = "#00ffaa", italic = true },
                ["@string"] = { bold = true, extend = true },
                ["@function"] = { extend = true, italic = true, underline = true  },
                ["@function.builtin"] = { fg = "#0059ff" },
            },
        })
    end,
}
