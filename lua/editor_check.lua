local M = {}

--- @return nil
function M:clipboard_setting()
	if vim.fn.has("clipboard") == 0 then
		return
	end

	if vim.fn.has("win32") or vim.fn.has("win64") then
		vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
	elseif vim.fn.has("linux") then
		vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
	end
end

return M
