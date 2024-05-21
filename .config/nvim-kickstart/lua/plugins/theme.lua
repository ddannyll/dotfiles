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
return nightfox
