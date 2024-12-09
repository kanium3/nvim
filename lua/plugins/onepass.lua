return {
    "mrjones2014/op.nvim",
    event = { "VeryLazy" },
    build = "make install",
    opts = {
        -- In WSL
        op_cli_path = "/mnt/c/Users/annko/AppData/Local/Microsoft/WinGet/Links/op.exe",
        global_args = {
            "--no-color",
        },
    },
}
