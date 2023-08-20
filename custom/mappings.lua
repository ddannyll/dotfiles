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

M.general = {
  n = {
    ["<CR>"] = {"<cmd> noh<CR>"}
  },
  i = {
    ["<C-s>"] = {"<cmd> :w<CR>"}
  }
}

return M

