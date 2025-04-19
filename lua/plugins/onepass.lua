local op_opts = require("config.wsl").is_wsl()
        and {
            op_cli_path = "/mnt/c/Users/annko/AppData/Local/Microsoft/WinGet/Links/op.exe",
            global_args = {
                "--no-color",
            },
        }
    or {}

return {
    "mrjones2014/op.nvim",
    event = { "VeryLazy" },
    build = "make install",
    opts = op_opts,
}
