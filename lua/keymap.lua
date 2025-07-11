local set = vim.keymap.set
local op = { silent = true }

set("n", "<C-l>", "<Cmd>bnext<CR>", op)
set("n", "<C-h>", "<Cmd>bprev<CR>", op)
set("n", "<leader>db", "<Cmd>bd<CR>", op)
set("n", "<esc><esc>", "<Cmd>noh<CR>", op)


                vim.api.nvim_create_autocmd("LspAttach", {
                    callback = function(_)
                        vim.keymap.set("n", "K", function()
                            vim.lsp.buf.hover()
                        end)
                        vim.keymap.set("n", "ff", function()
                            vim.lsp.buf.format()
                        end)
                        vim.keymap.set("n", "gr", "<cmd>Glance references<CR>")
                        vim.keymap.set("n", "gd", "<cmd>Glance definitions<CR>")
                        vim.keymap.set("n", "gD", function()
                            vim.lsp.buf.declaration()
                        end)
                        vim.keymap.set("n", "gi", "<cmd>Glance implementations<CR>")
                        vim.keymap.set("n", "gt", "<cmd>Glance type_definitions<CR>")
                        vim.keymap.set("n", "ge", function()
                            vim.diagnostic.open_float()
                        end)
                        vim.keymap.set("n", "g]", function()
                            vim.diagnostic.goto_next()
                        end)
                        vim.keymap.set("n", "g[", function()
                            vim.diagnostic.goto_prev()
                        end)
                        vim.lsp.inlay_hint.enable(true)
                    end,
                })
