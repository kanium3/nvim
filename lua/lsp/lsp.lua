local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")
local on_attach = require("lsp.handler")
local codelldb_path = '/home/kanium/.local/share/nvim/mason/bin/codelldb'
local liblldb_path = '/home/kanium/.local/share/nvim/mason/packages/codelldb/extension/lldb/lib/liblldb.so'

lspconfig.sumneko_lua.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "/home/kanium/.local/share/nvim/mason/bin/lua-language-server" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim', 'use' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

lspconfig.prismals.setup {}

lspconfig.crystalline.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "/home/kanium/.local/share/nvim/mason/bin/crystalline" }
}

lspconfig.pyright.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "/home/kanium/.local/share/nvim/mason/bin/pyright-langserver", "--stdio" },
	single_file_support = true
}

---@diagnostic disable-next-line: undefined-field
require("typescript").setup({
	server = { -- pass options to lspconfig's setup method
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "/home/kanium/.local/share/nvim/mason/bin/typescript-language-server",
			"--stdio" }
	},
})

require("flutter-tools").setup {
	lsp = {
		on_attach = on_attach,
		capabilities = capabilities
	}
}

local rust_opts = {
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "/home/kanium/.local/share/nvim/mason/bin/rust-analyzer" }
	},
	dap = {
		adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
	}
}

require("rust-tools").setup(rust_opts)


