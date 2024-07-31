local set = vim.keymap.set
local op = { silent = true }

--set("n","<leader>sl","<Cmd>NvimTreeToggle<CR>",op)
set("n", "<C-l>", "<Cmd>bnext<CR>", op)
set("n", "<C-h>", "<Cmd>bprev<CR>", op)
set("n", "<leader>db", "<Cmd>bd<CR>", op)

-- codemap plugin binding
set("n", "<leader>mn", "<Cmd>MinimapToggle<CR>", op)
