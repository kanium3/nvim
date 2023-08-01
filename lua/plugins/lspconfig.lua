return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            'williamboman/mason.nvim',
            "simrat39/rust-tools.nvim"
        },
        config = function()
            require("mason").setup()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup_handlers {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["rust_analyzer"] = function()
                    require("rust-tools").setup({
                        server = {
                            capabilities = capabilities
                        }
                    })
                end

            }
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(_)
                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
                    vim.keymap.set('n', 'ff', '<cmd>lua vim.lsp.buf.format()<CR>')
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
                    vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
                    vim.keymap.set('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
                    vim.keymap.set('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
                    vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
                    vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
                    vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
                end
            })
        end
    }
}
