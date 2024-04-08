local M = {}
local stylua = require("efmls-configs.formatters.stylua")
local selene = require("efmls-configs.linters.selene")
local languagetool = require("efmls-configs.linters.languagetool")
local eslint = require('efmls-configs.linters.eslint')
local biome = require('efmls-configs.formatters.biome')
local markdownlint = require('efmls-configs.linters.markdownlint')
local textlint = require('efmls-configs.linters.textlint')
local actionlint = require('efmls-configs.linters.actionlint')

M.languages = {
    javascript = { eslint,biome },
    typescript = { eslint,biome },
    json = { biome },
    lua = { stylua, selene },
    markdown = { languagetool,markdownlint,textlint },
    yaml = { actionlint }
}

return M
