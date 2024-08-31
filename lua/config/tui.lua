local mail = require("toggleterm.terminal").Terminal:new({
    direction = "float",
    cmd = "neomutt",
    close_on_exit = true,
})

vim.api.nvim_create_user_command("Mail", function()
    mail:toggle()
end, {})

local spotify = require("toggleterm.terminal").Terminal:new({
    direction = "float",
    cmd = "spt",
    close_on_exit = true,
})

vim.api.nvim_create_user_command("Music", function()
    spotify:toggle()
end, {})

local podman = require("toggleterm.terminal").Terminal:new({
    direction = "float",
    cmd = "podman-tui",
    close_on_exit = true,
})

vim.api.nvim_create_user_command("Podman", function()
    podman:toggle()
end, {})

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
    callback = function(args)
        if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
            vim.cmd("startinsert")
        end
    end,
})
