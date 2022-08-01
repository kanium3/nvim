local null_ls = require("null-ls")

null_ls.setup {
	sources = {
		null_ls.builtins.diagnostics.tsc,
		null_ls.builtins.formatting.crystal_format,
		null_ls.builtins.diagnostics.cspell.with({
			diagnostics_postprocess = function(diagnostic)
				-- change warn
				diagnostic.severity = vim.diagnostic.severity["WARN"]
			end,
			condition = function()
				return vim.fn.executable('cspell') > 0
			end,
			extra_args = { '--config', vim.call('expand', '~/.config/cspell/cspell.json') }
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.glslc
	}
}
