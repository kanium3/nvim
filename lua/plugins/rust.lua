return {
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        ft = { "rust" },
        event = { "LspAttach" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local on_attach = function(client, bufnr)
                if client.server_capabilities["documentSymbolProvider"] then
                    require("nvim-navic").attach(client, bufnr)
                end
            end
            -- Update this path
            local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb"

            -- The path is different on Windows
            if jit.os == "Windows" then
                codelldb_path = extension_path .. "adapter\\codelldb.exe"
                liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
            else
                -- The liblldb extension is .so for Linux and .dylib for MacOS
                liblldb_path = liblldb_path .. (vim.uv.os_uname().sysname == "Linux" and ".so" or ".dylib")
            end

            local cfg = require("rustaceanvim.config")
            vim.g.rustaceanvim = {
                inlay_hints = {
                    highlight = "NonText",
                },
                tools = {
                    hover_actions = {
                        auto_focus = true,
                    },
                },
                server = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        ["rust-analyzer"] = {
                            -- enable clippy when saving
                            checkOnSave = {
                                command = "clippy",
                            },
                        },
                    },
                },
                daps = {
                    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
                },
            }

            -- https://github.com/neovim/neovim/issues/30985
            for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
                local default_diagnostic_handler = vim.lsp.handlers[method]
                vim.lsp.handlers[method] = function(err, result, context, config)
                    if err ~= nil and err.code == -32802 then
                        return
                    end
                    return default_diagnostic_handler(err, result, context, config)
                end
            end
        end,
    },
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        tag = "stable",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("crates").setup({
                lsp = {
                    enabled = true,
                    on_attach = function(_, _) end,
                    actions = true,
                    completion = true,
                    hover = true,
                },
            })
            vim.api.nvim_create_autocmd("BufRead", {
                group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
                pattern = "Cargo.toml",
                callback = function()
                    require("cmp").setup.buffer({ sources = { { name = "crates" } } })
                end,
            })
        end,
    },
    {
        "nvim-neotest/neotest",
        ft = { "rust" },
        event = { "LspAttach" },
        opts = function(_, opts)
            opts.adapters = opts.adapters or {}
            vim.list_extend(opts.adapters, {
                require("rustaceanvim.neotest"),
            })
        end,
    },
}
