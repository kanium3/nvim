local set = vim.keymap.set
local op = { silent = true }

set("n", "<C-l>", "<Cmd>bnext<CR>", op)
set("n", "<C-h>", "<Cmd>bprev<CR>", op)
set("n", "<leader>db", "<Cmd>bd<CR>", op)
set("n", "<esc><esc>", "<Cmd>noh<CR>", op)
