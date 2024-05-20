require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "NvimTreeToggle" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>gg", "<cmd> LazyGit <CR>", { desc = "Launch LazyGit" })

-- trouble
map("n", "<leader>o", "<cmd> TroubleToggle workspace_diagnostics<CR>", { desc = "Trouble Workspace Diagnostics" })

map("n", "<leader>fn", "<cmd> Telescope notify<CR>")
map("n", "<leader>n", function()
  require("notify").dismiss()
end)

map("n", "<S-f>", function()
  vim.diagnostic.open_float()
end)