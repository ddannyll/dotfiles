local overrides = require 'custom.overrides'
local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
   'abecodes/tabout.nvim',
    lazy=false,
    config = function()
      require "custom.configs.taboutconfig"
    end
  },
  {
    'karb94/neoscroll.nvim',
    lazy=false,
    config = function()
      require("neoscroll").setup()
    end
  },
  {
    "max397574/better-escape.nvim",
    lazy=false,
    config = function()
      require('better_escape').setup({
        mapping = { "jj" }
      })
    end
  },
  {
    'hrsh7th/nvim-cmp',
    opts = overrides.cmp
  }
}
return plugins
