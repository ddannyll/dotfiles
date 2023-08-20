local overrides = require 'custom.overrides'
local plugins = {
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
