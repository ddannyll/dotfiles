local overrides = require("custom.overrides")
local plugins = {
	{
		"lukas-reineke/virt-column.nvim",
		init = function()
			require("virt-column").setup()
		end,
	},
	{
		"andweeb/presence.nvim",
		lazy = false,
		opts = {
			buttons = false,
			main_image = "file",
		},
	},
	{
		"ggandor/leap.nvim",
		init = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"nmac427/guess-indent.nvim",
		lazy = false,
		config = function()
			require("guess-indent").setup({})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"wfxr/minimap.vim",
		lazy = true,
		init = function()
			vim.cmd("let g:minimap_auto_start = 1")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{ "windwp/nvim-ts-autotag" },
		},
		opts = {
			autotag = { enable = true },
			ensure_installed = {
				"lua",
				-- web dev
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"go",
				"prisma",
			},
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"gopls",
				"typescript-language-server",
				"eslint-lsp",
				"stylua",
				"css-lsp",
				"tailwindcss-language-server",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"abecodes/tabout.nvim",
		lazy = false,
		config = function()
			require("custom.configs.taboutconfig")
		end,
	},
	{
		"karb94/neoscroll.nvim",
		lazy = false,
		config = function()
			require("neoscroll").setup()
		end,
	},
	{
		"max397574/better-escape.nvim",
		lazy = false,
		config = function()
			require("better_escape").setup({
				mapping = { "jj" },
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
	},
}
return plugins
