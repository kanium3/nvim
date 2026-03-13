return {
    {
        "vuki656/package-info.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("package-info").setup({
                package_manager = "npm",
            })
            -- Show dependency versions
            vim.keymap.set({ "n" }, "<LEADER>ns", require("package-info").show, { silent = true, noremap = true })

            -- Hide dependency versions
            vim.keymap.set({ "n" }, "<LEADER>nc", require("package-info").hide, { silent = true, noremap = true })

            -- Toggle dependency versions
            vim.keymap.set({ "n" }, "<LEADER>nt", require("package-info").toggle, { silent = true, noremap = true })

            -- Update dependency on the line
            vim.keymap.set({ "n" }, "<LEADER>nu", require("package-info").update, { silent = true, noremap = true })

            -- Delete dependency on the line
            vim.keymap.set({ "n" }, "<LEADER>nd", require("package-info").delete, { silent = true, noremap = true })

            -- Install a new dependency
            vim.keymap.set({ "n" }, "<LEADER>ni", require("package-info").install, { silent = true, noremap = true })

            -- Install a different dependency version
            vim.keymap.set(
                { "n" },
                "<LEADER>np",
                require("package-info").change_version,
                { silent = true, noremap = true }
            )

            local err, telescope = pcall(require, "telescope")
            if not err and telescope ~= nil then
                telescope.load_extension("package_info")
            end
        end,
        ft = { "json" },
    },
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()',
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^6",
        lazy = false,
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
                            checkOnSave = true,
                            check = {
                                command = "clippy",
                            },
                        },
                    },
                },
                daps = {
                    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
                },
            }
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
    {
        "toppair/peek.nvim",
        ft = { "markdown" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup()
            -- refer to `configuration to change defaults`
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },
    {
        "rest-nvim/rest.nvim",
        cmd = { "Rest" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        init = function()
            ---@type Rest.Opts
            vim.g.rest_nvim = {}
        end,
    },
}
