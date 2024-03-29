local overrides = require("custom.overrides")
local plugins = {
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
		lazy = false,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{
				"windwp/nvim-ts-autotag",
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
		},
		opts = {
			autotag = { enable = true },
			ensure_installed = {
				"lua",
				"python",
				"comment",
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
			ts_context_commentstring = {
				enable = true,
				enable_autocmd = false,
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
				"prettierd",
				"shellcheck",
				"pyright",
				"mypy",
				"ruff",
				"black",
				"rust-analyzer",
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
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = {
			"Trouble",
			"TroubleToggle",
		},
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		cmd = "LazyGit",
	},
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
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = {
				enable = true,
				timeout = 400,
			},
			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
					},
				},
			},
		},
	},
}
return plugins
