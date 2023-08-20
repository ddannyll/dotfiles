local M = {}
M.disabled = {
  n = {
  ["<leader>e"] = "",
  }
}

M.nvimtree = {
  plugin = true,
  n = {
     ["<leader>e"] = {"<cmd> NvimTreeToggle <CR>", "NvimTreeToggle"}
  }
}

return M
