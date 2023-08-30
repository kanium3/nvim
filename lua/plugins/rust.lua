return {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    event = { "LspAttach" },
    dependencies = {
        "SmiteshP/nvim-navic"
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local on_attach = function(client, bufnr)
            if client.server_capabilities["documentSymbolProvider"] then
                require("nvim-navic").attach(client, bufnr)
            end
        end
        require("rust-tools").setup({
            server = {
                capabilities = capabilities,
                on_attach = on_attach
            }
        })
    end
}
