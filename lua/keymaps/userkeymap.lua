vim.api.nvim_set_keymap('n', '<leader>t', '<C-w>w', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>w', '<Cmd>write<CR>', { noremap = true })
-- NvimTree
vim.api.nvim_set_keymap('n', '<leader>ss', '<Cmd>NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rf', '<Cmd>NvimTreeRefresh<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<Cmd>NvimTreeFindFile<CR>', { noremap = true })
-- Tabline
vim.api.nvim_set_keymap('n', '<leader>n', '<Cmd>TablineBufferNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pp', '<Cmd>TablineBufferPrevious<CR>', { noremap = true })
-- SKK
vim.keymap.set({ 'i', 'c' }, '<C-j>', '<Plug>(skkeleton-toggle)')
-- minimap
vim.api.nvim_set_keymap('n', '<leader>m', '<Cmd>MinimapToggle<CR>', { noremap = true })

-- Trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>gR", "<cmd>TroubleToggle lsp_references<cr>",
	{ silent = true, noremap = true }
)
-- ZenMode
vim.api.nvim_set_keymap("n", "<leader>z", "<Cmd>ZenMode<CR>", { silent = true, noremap = true })
-- goto-preview
vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
	{ noremap = true })
-- translate
vim.api.nvim_set_keymap("x", "mjf", ":Translate JA -source=EN -parse_after=window -output=floating<CR>",
	{ silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "mjs", ":<C-u>Translate JA -source=EN -output=split<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("x", "mjs", ":Translate JA -source=EN -output=split<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "mji", ":<C-u>Translate JA -source=EN -output=insert<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("x", "mji", ":Translate JA -source=EN -output=insert<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "mjr", ":<C-u>Translate JA -source=EN -output=replace<CR>",
	{ silent = true, noremap = true })
vim.api.nvim_set_keymap("x", "mjr", ":Translate JA -source=EN -output=replace<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "mef", ":<C-u>Translate EN -source=JA -parse_after=window -output=floating<CR>",
	{ silent = true, noremap = true })
vim.api.nvim_set_keymap("x", "mef", ":Translate EN -source=JA -parse_after=window -output=floating<CR>",
	{ silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "mes", ":<C-u>Translate EN -source=JA -output=split<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("x", "mes", ":Translate EN -source=JA -output=split<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "mei", ":<C-u>Translate EN -source=JA -output=insert<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("x", "mei", ":Translate EN -source=JA -output=insert<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "mer", ":<C-u>Translate EN -source=JA -output=replace<CR>",
	{ silent = true, noremap = true })
vim.api.nvim_set_keymap("x", "mer", ":Translate EN -source=JA -output=replace<CR>", { silent = true, noremap = true })
-- popui
vim.api.nvim_set_keymap("n", "<leader>d", "<Cmd>lua require'popui.diagnostics-navigator'()<CR>",
	{ silent = true, noremap = true })
-- fuzzymotion
vim.api.nvim_set_keymap("n", "<leader>fm", "<Cmd>FuzzyMotion<CR>", { silent = true, noremap = true })
-- lsp_lines
vim.keymap.set(
	"",
	"<Leader>l",
	require("lsp_lines").toggle,
	{ desc = "Toggle lsp_lines" }
)
-- SymbolsOutline
vim.api.nvim_set_keymap("n", "<leader>sb", ":SymbolsOutline<CR>", { silent = true, noremap = true })
-- icon-picker
vim.keymap.set("n", "<Leader>pi", "<cmd>PickEverything<cr>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-i>", "<cmd>PickEverythingInsert<cr>", { silent = true, noremap = true })
-- renamer
vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
-- spectre
vim.api.nvim_set_keymap("n", '<leader>S', '<cmd>lua require("spectre").open()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>s", '<esc>:lua require("spectre").open_visual()<CR>', { noremap = true, silent = true })
-- iswap
vim.api.nvim_set_keymap("n", "<leader>is", '<cmd>ISwap<CR>', { noremap = true })
-- quickhl
vim.api.nvim_set_keymap("n", "<leader>qm", '<Plug>(quickhl-manual-this)', { noremap = false, silent = true })
vim.api.nvim_set_keymap("x", "<leader>qm", '<Plug>(quickhl-manual-this)', { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>qM", '<Plug>(quickhl-manual-reset)', { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>qM", '<Plug>(quickhl-manual-reset)', { noremap = false, silent = true })
-- nvim-dap
vim.api.nvim_set_keymap('n', '<leader>dd', ':lua require("dapui").toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F5>', ':DapContinue<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<F10>', ':DapStepOver<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<F11>', ':DapStepInto<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<F12>', ':DapStepOut<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':DapToggleBreakpoint<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>B', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lp', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dl', ':lua require("dap").run_last()<CR>', { noremap = true, silent = true })
-- ToggleTerm
vim.api.nvim_set_keymap('n', '<leader>st', ':ToggleTerm<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gg', ':lua require("plug_conf.toggleterm").lazygit_toggle()<CR>', { silent = true, noremap = true })

vim.api.nvim_set_keymap('n', '<leader>sm', ':NumbersToggle<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('v', 'sr', '<Plug>SnipRun', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>so', '<Plug>SnipRunOperator', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>sr', '<Plug>SnipRun', {silent = true})
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
