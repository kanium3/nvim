return {
    "rebelot/terminal.nvim",
    cmd = { "Mail","Music","Term" },
    config = function()
        require("terminal").setup()
        require("config.tui")
    end,
}
