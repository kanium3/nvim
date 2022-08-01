local regex_filetypes = {
	'html',
	'js',
	'cjs',
	'mjs',
	'ts',
	'jsx',
	'tsx',
	'cjsx',
	'mjsx',
	'rust'
}

require('regexplainer').setup {
	filetypes = regex_filetypes
}
