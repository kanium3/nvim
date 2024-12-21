return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                "williamboman/mason.nvim",
                {
                    "Chaitanyabsprip/fastaction.nvim",
                    opts = {},
                },
                "SmiteshP/nvim-navic",
                "p00f/clangd_extensions.nvim",
            },
            config = function()
                require("mason").setup()
                local capabilities = require("cmp_nvim_lsp").default_capabilities()
                local mason_lspconfig = require("mason-lspconfig")
                local on_attach = function(client, bufnr)
                    if client.server_capabilities["documentSymbolProvider"] then
                        require("nvim-navic").attach(client, bufnr)
                    end
                end

                mason_lspconfig.setup_handlers({
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                        })
                    end,
                    ["rust_analyzer"] = function() end,
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            settings = {
                                Lua = {
                                    completion = {
                                        callSnippet = "Replace",
                                    },
                                    format = {
                                        enable = false,
                                    },
                                },
                            },
                        })
                    end,
                    ["vtsls"] = function()
                        require("lspconfig").vtsls.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            root_dir = require("lspconfig").util.root_pattern("package.json"),
                            single_file_support = false,
                            settings = {
                                typescript = {
                                    inlayHints = {
                                        parameterNames = { enabled = "literals" },
                                        parameterTypes = { enabled = true },
                                        variableTypes = { enabled = false },
                                        propertyDeclarationTypes = { enabled = true },
                                        functionLikeReturnTypes = { enabled = true },
                                        enumMemberValues = { enabled = true },
                                    },
                                },
                            },
                        })
                    end,
                    ["omnisharp"] = function()
                        local local_path = vim.fn.expand("~") .. "/.local/share/nvim/mason/bin/omnisharp"
                        require("lspconfig").omnisharp.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            cmd = { local_path },
                            settings = {
                                dotnet = {
                                    inlayHints = {
                                        enableForParameters = true,
                                        forLiteralParameters = true,
                                        forIndexerParameters = true,
                                        forObjectCreationParameters = true,
                                        forOtherParameters = true,
                                        suppressForParametersThatDifferOnlyBySuffix = false,
                                        suppressForParametersThatMatchMethodIntent = false,
                                        suppressForParametersThatMatchArgumentName = false,
                                        enableForTypes = true,
                                        forImplicitVariableTypes = true,
                                        forLambdaParameterTypes = true,
                                        forImplicitObjectCreation = true,
                                    },
                                },
                            },
                        })
                    end,
                    ["clangd"] = function()
                        require("lspconfig").clangd.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                        })
                        require("clangd_extensions").setup({})
                    end,
                })
                require("lspconfig").denols.setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
                })
                require("lspconfig").biome.setup({
                    cmd = { "pnpm", "exec", "biome", "lsp-proxy" },
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
                require("lspconfig").zls.setup({
                    cmd = { "zls" },
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
                require("lspconfig").pyright.setup({
                    root_dir = require("lspconfig").util.root_pattern(".venv"),
                    cmd = { "bash", "-c", "source .venv/bin/activate && .venv/bin/pyright-python-langserver --stdio" },
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
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
                        vim.keymap.set({ "n" }, "<leader>ca", "<Cmd>lua require('fastaction').code_action()<CR>")
                        vim.keymap.set({ "v" }, "<leader>ca", "<Cmd>lua require('fastaction').range_code_action()<CR>")
                        vim.keymap.set("n", "g]", function()
                            vim.diagnostic.goto_next()
                        end)
                        vim.keymap.set("n", "g[", function()
                            vim.diagnostic.goto_prev()
                        end)
                        vim.lsp.inlay_hint.enable(true)
                    end,
                })
            end,
        },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        event = { "LspAttach" },
        dependencies = {
            { "Bilal2453/luvit-meta", lazy = true },
        },
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "smjonas/inc-rename.nvim",
        event = { "LspAttach" },
        dependencies = {
            "stevearc/dressing.nvim",
        },
        config = function()
            require("inc_rename").setup({
                input_buffer_type = "dressing",
            })
            require("dressing").setup({
                input = {
                    override = function(conf)
                        conf.col = -1
                        conf.row = 0
                        return conf
                    end,
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(_)
                    vim.keymap.set("n", "<leader>rn", function()
                        return ":IncRename " .. vim.fn.expand("<cword>")
                    end, { expr = true, silent = true })
                end,
            })
        end,
    },
}
