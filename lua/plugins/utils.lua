return {
    {
        "jghauser/mkdir.nvim",
        event = { "VeryLazy" },
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
        module = true,
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = { "VeryLazy" },
        opts = {},
    },
    {
        "MunifTanjim/nui.nvim",
        lazy = true,
        module = true,
    },
    {
        "stevearc/dressing.nvim",
        opts = {},
        lazy = true,
        module = true,
    },
    {
        "kanium3/neovide-ime.nvim",
        event = { "UIEnter" },
    },
}
