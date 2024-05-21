return {
  'windwp/nvim-ts-autotag',
  ft = { 'typescriptreact', 'javascriptreact', 'html' },
  config = function()
    require('nvim-ts-autotag').setup()
  end,
}
