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
    ["<CR>"] = {"<cmd> noh<CR>"},
    ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", "window Right"},
    ["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>", "window Down"},
    ["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>", "window Up"},
  },
  i = {
    ["<C-s>"] = {"<cmd> :w<CR>"}
  }
}

M.lspconfig = {
  n = {
    ["<S-f>"] = {
      function ()
        vim.lsp.buf.hover()
      end
    }
  }
}

return M

