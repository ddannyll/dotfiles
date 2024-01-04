local overrides = require("custom.overrides")
local plugins = {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{
				"windwp/nvim-ts-autotag",
				"JoosepAlviste/nvim-ts-context-commentstring",
				{ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" },
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
				"prettier",
				"shellcheck",
				"pyright",
				"mypy",
				"ruff",
				"black",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvimtools/none-ls.nvim",
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
	{
		url = "ssh://diffusion@phabricator.tools.flnltd.com/source/freelancer-nvim-plugin.git",
		dependencies = {
			"f-person/git-blame.nvim",
			"stevearc/dressing.nvim",
		},
		lazy = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	},
	{
		"eandrju/cellular-automaton.nvim",
		lazy = false,
	},
}

return plugins
