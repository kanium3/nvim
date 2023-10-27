return {
    "rebelot/terminal.nvim",
    cmd = { "Mail" },
    config = function()
        require("terminal").setup()
        require("config.tui")
    end,
}
