require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
map("n", "<S-f>", function()
  vim.diagnostic.open_float()
end)

map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "NvimTreeToggle" })
map("n", "<leader>gg", "<cmd> LazyGit <CR>", { desc = "Launch LazyGit" })

-- trouble
map("n", "<leader>o", function()
  local qf_exists = require("utils").qf_open()
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end

  local trouble = require "trouble"
  if trouble.is_open then
    trouble.close()
    return
  end
  vim.cmd "TroubleToggle workspace_diagnostics"
end, { desc = "Trouble Workspace Diagnostics" })

-- notify
map("n", "<leader>fn", "<cmd> Telescope notify<CR>")
map("n", "<leader>n", function()
  require("notify").dismiss()
end)
