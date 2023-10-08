local M = {}
local stylua = require('efmls-configs.formatters.stylua')
M.languages = {
    lua = { stylua },
}

return M
