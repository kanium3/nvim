local terminal = require("toggleterm.terminal").Terminal
local M = {}

require("toggleterm").setup{}

function M:lazygit_toggle()
	terminal:new({ cmd = "lazygit", hidden = true, direction = "float" }):toggle()
end

return M
