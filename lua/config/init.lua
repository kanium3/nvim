local M = {}
local eslint = require('efmls-configs.linters.eslint')
local prettier = require('efmls-configs.formatters.prettier')
local stylua = require('efmls-configs.formatters.stylua')
M.languages = {
    typescript = { eslint, prettier },
    lua = { stylua },
}

return M
