local M = {}

---@return boolean is_wsl # if your environment is wsl
M.is_wsl = function()
    if vim.uv.fs_stat("/proc/sys/fs/binfmt_misc/WSLInterop") then
        return true
    end
    return false
end

return M
