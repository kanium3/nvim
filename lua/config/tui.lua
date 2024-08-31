if not jit.os == "Windows" then
    local mail = require("toggleterm").Terminal:new({
        direction = "float",
        cmd = { "neomutt" },
        close_on_exit = true
    })

    vim.api.nvim_create_user_command("Mail", function()
        mail:toggle(nil, true)
    end, {})

    local spotify = require("toggleterm").Terminal:new({
        direction = "float",
        cmd = { "spt" },
        close_on_exit = true
    })

    vim.api.nvim_create_user_command("Music", function()
        spotify:toggle(nil, true)
    end, {})
end

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
    callback = function(args)
        if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
            vim.cmd("startinsert")
        end
    end,
})
