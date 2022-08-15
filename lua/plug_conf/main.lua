require("packer").startup(function(use)
	-- vim help in japanese
	use("vim-jp/vimdoc-ja")
	-- color scheme
	use("olimorris/onedarkpro.nvim")
	use("rmehri01/onenord.nvim")
	use({ "shaunsingh/oxocarbon.nvim", run = "./install.sh" })
	use("folke/tokyonight.nvim")
	-- denops
	use("vim-denops/denops.vim")
	use({
		"vim-skk/skkeleton",
		requires = { "vim-denops/denops.vim" },
		config = function()
			vim.cmd([[call skkeleton#config({'globalJisyo': '/usr/share/skk/SKK-JISYO.L'})]])
		end,
	})
	use({
		"yuki-yano/fuzzy-motion.vim",
		requires = { "vim-denops/denops.vim" },
	})
	-- develop
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	-- Rust
	use("rust-lang/rust.vim")
	use({
		"simrat39/rust-tools.nvim",
	})
	-- Snippet
	use({
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	})
	-- nvim-cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-nvim-lsp-document-symbol")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-omni")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-calc")
	use("hrsh7th/cmp-cmdline")
	use("ray-x/cmp-treesitter")
	use("rinx/cmp-skkeleton")
	use("lukas-reineke/cmp-rg")
	use({
		"windwp/nvim-autopairs",
		event = "VimEnter",
		config = function()
			require("plug_conf.autopairs")
		end,
	})
	-- file active
	use("kyazdani42/nvim-web-devicons")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("plug_conf.nvim_tree")
		end,
	})
	-- UI
	use("arkav/lualine-lsp-progress")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plug_conf.lualine")
		end,
	})
	use({
		"kdheepak/tabline.nvim",
		requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
		config = function()
			require("tabline").setup({ enable = false })
		end,
	})
	--LSP
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})
	use({
		"neovim/nvim-lspconfig",
	})
	use("folke/lsp-colors.nvim")
	use({
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({})
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plug_conf.trouble")
		end,
	})
	use({
		{
			"yioneko/nvim-yati",
			require = "nvim-treesitter/nvim-treesitter",
		},
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			require = "nvim-treesitter/nvim-treesitter",
		},
		{
			"nvim-treesitter/nvim-treesitter-context",
			require = "nvim-treesitter/nvim-treesitter",
		},
		{
			"RRethy/nvim-treesitter-textsubjects",
			require = "nvim-treesitter/nvim-treesitter",
		},
		{
			"p00f/nvim-ts-rainbow",
			require = "nvim-treesitter/nvim-treesitter",
		},
		{
			"windwp/nvim-ts-autotag",
			require = "nvim-treesitter/nvim-treesitter",
		},
		{
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("plug_conf.treesitter")
			end,
		},
	})

	use({
		"haringsrob/nvim_context_vt",
		require = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim_context_vt").setup({})
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plug_conf.ident_blankline")
		end,
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plug_conf.null_ls.mod")
		end,
	})

	use("jose-elias-alvarez/typescript.nvim")
	use({
		"saecki/crates.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	})
	use({
		"wfxr/minimap.vim",
		run = ":!cargo install --locked code-minimap",
	})
	use({
		"folke/twilight.nvim",
		{
			"folke/zen-mode.nvim",
			config = function()
				require("plug_conf.zen_mode")
			end,
		},
	})
	use("ray-x/lsp_signature.nvim")
	use("onsails/lspkind.nvim")
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plug_conf.neogit")
		end,
	})
	use({
		"sindrets/diffview.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plug_conf.diff_view")
		end,
	})
	use("airblade/vim-gitgutter")
	use("rcarriga/nvim-notify")
	use({
		"uga-rosa/translate.nvim",
		config = function()
			require("plug_conf.translate")
		end,
	})
	use("vim-crystal/vim-crystal")
	use({
		"akinsho/flutter-tools.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use("RishabhRD/popfix")
	use({
		"hood/popui.nvim",
		requires = "RishabhRD/popfix",
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("plug_conf.lsp_lines")
		end,
	})
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})
	use("nanotee/sqls.nvim")
	use({
		"kosayoda/nvim-lightbulb",
		requires = "antoinemadec/FixCursorHold.nvim",
	})
	use("simrat39/symbols-outline.nvim")
	use("stevearc/dressing.nvim")
	use({
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker")
		end,
	})
	use({
		"filipdutescu/renamer.nvim",
		branch = "master",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("renamer").setup({})
		end,
	})
	use({
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	})
	use({
		"bennypowers/nvim-regexplainer",
		config = function()
			require("plug_conf.regexplainer")
		end,
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"MunifTanjim/nui.nvim",
		},
	})
	use({
		"ggandor/lightspeed.nvim",
		require = "tpope/vim-repeat",
		config = function()
			require("lightspeed").setup({})
		end,
	})
	use({
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup({})
		end,
	})
	use("andweeb/presence.nvim")
	use({
		"mizlan/iswap.nvim",
		config = function()
			require("iswap").setup({})
		end,
	})
	use({
		"windwp/nvim-spectre",
		require = "nvim-lua/plenary.nvim",
		config = function()
			require("spectre").setup()
		end,
	})
	use("jghauser/mkdir.nvim")
	use("gpanders/editorconfig.nvim")
	use("unblevable/quick-scope")
	use("t9md/vim-quickhl")
	use("mfussenegger/nvim-dap")
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap_conf.nvim_dap_ui")
			require("dap_conf.nvim_dap")
		end,
	})
	use({
		"mfussenegger/nvim-dap-python",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap_conf.nvim_dap_python")
		end,
	})
	use("rktjmp/lush.nvim")
	use("projectfluent/fluent.vim")
	use({
		"m-demare/hlargs.nvim",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("plug_conf.hlargs")
		end,
	})
	use({
		"chentoast/marks.nvim",
		config = function()
			require("plug_conf.marks")
		end,
	})
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = function()
			require("plug_conf.toggleterm")
		end,
	})
	use("theHamsta/nvim-dap-virtual-text")
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use({
		"brendalf/mix.nvim",
		config = function()
			require("mix").setup({})
		end,
	})
	use({
		"mortepau/codicons.nvim",
		config = function()
			require("codicons").setup({})
		end,
	})
	-- end
	if require("packer_bootstrap").packer_bootstrap then
		require("packer").sync()
	end
end)

-- plugin settings
require("plug_conf.cmp")
require("plug_conf.mason")
