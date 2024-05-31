local onedark = {
  'olimorris/onedarkpro.nvim',
  priority = 1000, -- Ensure it loads first
  config = function()
    require('onedarkpro').setup { options = { transparency = true } }
    vim.cmd.colorscheme 'onedark'
  end,
  lazy = false,
}
local nightfox = {
  'EdenEast/nightfox.nvim',
  priority = 1000,
  config = function()
    require('nightfox').setup { options = { transparent = true } }
    vim.cmd.colorscheme 'nordfox'
    vim.cmd.hi 'StatusLine guibg=none'
    vim.cmd.hi 'StatusLineNC guibg=none'
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'white' })
    vim.opt.cursorline = true
    vim.opt.cursorlineopt = 'number'
  end,
  lazy = false,
}
local github = {
  'projekt0n/github-nvim-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup {
      options = { transparent = true },
    }

    vim.cmd 'colorscheme github_dark'
  end,
}
local onenord = {
  'rmehri01/onenord.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onenord').setup {
      disable = {
        background = true,
        float_background = true,
      },
    }

    vim.cmd.colorscheme 'onenord'

    vim.cmd.hi 'StatusLine guibg=none'
    vim.cmd.hi 'StatusLineNC guibg=none'
  end,
}
return onenord
