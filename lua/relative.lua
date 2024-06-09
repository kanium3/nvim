vim.api.nvim_create_augroup("RelativeNumber", {
    clear = true
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinEnter" }, {
    group = "RelativeNumber",
    command = "setlocal relativenumber",
})

vim.api.nvim_create_autocmd({ "InsertLeave", "WinLeave" }, {
    group = "RelativeNumber",
    command = "setlocal norelativenumber",
})
