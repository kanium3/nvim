local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.tsc,
		null_ls.builtins.formatting.crystal_format,
		null_ls.builtins.diagnostics.cspell.with({
			diagnostics_postprocess = function(diagnostic)
				-- change warn
				diagnostic.severity = vim.diagnostic.severity["WARN"]
			end,
			condition = function()
				return vim.fn.executable("cspell") > 0
			end,
			extra_args = { "--config", vim.call("expand", "~/.config/cspell/cspell.json") },
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.glslc,
		null_ls.builtins.formatting.rustfmt,
		-- 4 tools is installed poetry
		null_ls.builtins.diagnostics.flake8.with({
			command = "/home/kanium/.cache/pypoetry/virtualenvs/kanivim-2GwEYoO9-py3.10/bin/flake8",
		}),
		null_ls.builtins.formatting.black.with({
			command = "/home/kanium/.cache/pypoetry/virtualenvs/kanivim-2GwEYoO9-py3.10/bin/black",
		}),
		null_ls.builtins.formatting.isort.with({
			command = "/home/kanium/.cache/pypoetry/virtualenvs/kanivim-2GwEYoO9-py3.10/bin/isort",
		}),
		null_ls.builtins.diagnostics.mypy.with({
			command = "/home/kanium/.cache/pypoetry/virtualenvs/kanivim-2GwEYoO9-py3.10/bin/mypy",
		}),
		null_ls.builtins.diagnostics.eslint.with({
			extra_filetypes = { "svelte" },
		}),
		null_ls.builtins.code_actions.eslint.with({

			extra_filetypes = { "svelte" },
		}),
		null_ls.builtins.formatting.prettier.with({
			extra_filetypes = { "svelte" },
		}),
		null_ls.builtins.diagnostics.textlint.with({
			extra_filetypes = { "markdown" },
			extra_args = { "--config", vim.call("expand", "~/.config/textlint/.textlintrc.json") },
		}),
		null_ls.builtins.formatting.textlint.with({
			extra_filetypes = { "markdown" },
			extra_args = { "--config", vim.call("expand", "~/.config/textlint/.textlintrc.json") },
		}),
		null_ls.builtins.diagnostics.actionlint,
		null_ls.builtins.diagnostics.buf,
		null_ls.builtins.formatting.buf,
		null_ls.builtins.code_actions.shellcheck,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.formatting.shfmt,
	},
})
