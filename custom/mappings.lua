local M = {}
M.disabled = {
	n = {
		["<leader>e"] = "",
	},
}

M.nvimtree = {
	plugin = true,
	n = {
		["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "NvimTreeToggle" },
	},
}

M.general = {
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window Right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window Down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window Up" },
		["<leader>gg"] = { "<cmd> LazyGit<CR>", "Launch LazyGit" },
		["<leader>o"] = { "<cmd> TroubleToggle<CR>", "Toggle Trouble" },
	},
	i = {
		["<C-s>"] = { "<cmd> :w<CR>" },
	},
}

M.lspconfig = {
	n = {
		["<S-f>"] = {
			function()
				vim.diagnostic.open_float()
			end,
		},
	},
}

return M
