local M = {}

-- from https://zenn.dev/uga_rosa/articles/afe384341fc2e1
---@return string[]
function M.get_plugin_paths()
    local plugins = require("lazy.core.config").plugins
    local paths = {}
    for _, plugin in pairs(plugins) do
        table.insert(paths, plugin.dir)
    end
    return paths
end

---@return string[]
function M.get_plugin_lua_paths()
    local plugins = require("lazy.core.config").plugins
    local paths = {}
    for _, plugin in pairs(plugins) do
        table.insert(paths, plugin.dir .. "lua")
    end
    return paths
end

---@return table<string,string>
function M.get_plugin_name_path()
    local plugins = require("lazy.core.config").plugins
    local paths = {}
    for name, plugin in pairs(plugins) do
        paths[name] = plugin.dir
    end
    return paths
end

return M
