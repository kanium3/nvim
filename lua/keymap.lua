local set = vim.keymap.set
local op = { silent = true }

set("n","<leader>ss","<Cmd>NvimTreeToggle<CR>",op)
set("n","<C-l>","<Cmd>bnext<CR>",op)
set("n","<C-h>","<Cmd>bprev<CR>",op)
