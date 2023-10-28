return {
    "rebelot/terminal.nvim",
    cmd = { "Mail","Music" },
    config = function()
        require("terminal").setup()
        require("config.tui")
    end,
}
