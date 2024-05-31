return {
  'andweeb/presence.nvim',
  config = function()
    require('presence').setup {
      main_image = 'file',
      neovim_image_text = 'Coding',
    }
  end,
}
