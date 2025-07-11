return {
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
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
    {
        "dnlhc/glance.nvim",
        event = { "LspAttach" },
        opts = {},
    },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        opts = {},
    },
    {
        "VidocqH/lsp-lens.nvim",
        event = { "LspAttach" },
        opts = {},
    },
    {
        "Chaitanyabsprip/fastaction.nvim",
        event = { "LspAttach" },
        opts = {},
        config = function ()
            vim.keymap.set({ "n" }, "<leader>ca", "<Cmd>lua require('fastaction').code_action()<CR>")
            vim.keymap.set({ "v" }, "<leader>ca", "<Cmd>lua require('fastaction').range_code_action()<CR>")
        end
    },
    {
        "SmiteshP/nvim-navic",
        event = { "LspAttach" },
        config = function ()
            vim.lsp.config("*", {
                on_attach = function(client, bufnr)
                    if client.server_capabilities.documentSymbolProvider then
                        require("nvim-navic").attach(client, bufnr)
                    end
                end
            })
        end
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        event = { "LspAttach" },
        config = function ()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            vim.lsp.config("*", {
                capabilities = capabilities
            })
        end
    }
}
