local M = {}
local stylua = require("efmls-configs.formatters.stylua")
--local selene = require("efmls-configs.linters.selene")
local languagetool = require("efmls-configs.linters.languagetool")
local eslint = require('efmls-configs.linters.eslint')
local prettier = require('efmls-configs.formatters.prettier')
local markdownlint = require('efmls-configs.linters.markdownlint')
local textlint = require('efmls-configs.linters.textlint')

M.languages = {
    javascript = { eslint,prettier },
    typescript = { eslint,prettier },
    lua = { stylua },
    markdown = { languagetool,markdownlint,textlint },
}

return M
