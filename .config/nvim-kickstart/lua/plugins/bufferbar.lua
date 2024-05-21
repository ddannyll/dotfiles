-- local barbar = {
--   'romgrk/barbar.nvim',
--   dependencies = {
--     'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
--     'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
--   },
--   keys = {
--     { '<Tab>', '<Cmd>BufferNext<CR>' },
--     { '<S-Tab>', '<Cmd>BufferPrevious<CR>' },
--
--     { '<leader>x', '<Cmd>BufferClose<CR>', { noremap = true, silent = true } },
--     { '<leader>bp', '<Cmd>BufferPin<CR>', { noremap = true, silent = true } },
--     { '<C-S-Left>', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true } },
--     { '<C-S-Right>', '<Cmd>BufferMoveNext<CR>', { noremap = true, silent = true } },
--   },
--   event = 'BufAdd',
--   config = function()
--     require('barbar').setup()
--
--     vim.cmd.hi 'BufferOffset guibg=none'
--     vim.cmd.hi 'BufferCurrent guibg=none'
--     vim.cmd.hi 'BufferTabpage guibg=none'
--     vim.cmd.hi 'BufferVisible guibg=none'
--     vim.cmd.hi 'BufferInactive guibg=none'
--     vim.cmd.hi 'BufferTabpages guibg=none'
--     vim.cmd.hi 'BufferAlternate guibg=none'
--     vim.cmd.hi 'BufferCurrentBtn guibg=none'
--     vim.cmd.hi 'BufferCurrentMod guibg=none'
--     vim.cmd.hi 'BufferCurrentPin guibg=none'
--     vim.cmd.hi 'BufferVisibleBtn guibg=none'
--     vim.cmd.hi 'BufferVisibleMod guibg=none'
--     vim.cmd.hi 'BufferVisiblePin guibg=none'
--     vim.cmd.hi 'BufferCurrentHINT guibg=none'
--     vim.cmd.hi 'BufferCurrentINFO guibg=none'
--     vim.cmd.hi 'BufferCurrentIcon guibg=none'
--     vim.cmd.hi 'BufferCurrentSign guibg=none'
--     vim.cmd.hi 'BufferCurrentWARN guibg=none'
--     vim.cmd.hi 'BufferInactiveBtn guibg=none'
--     vim.cmd.hi 'BufferInactiveMod guibg=none'
--     vim.cmd.hi 'BufferInactivePin guibg=none'
--     vim.cmd.hi 'BufferScrollArrow guibg=none'
--     vim.cmd.hi 'BufferTabpageFill guibg=none'
--     vim.cmd.hi 'BufferTabpagesSep guibg=none'
--     vim.cmd.hi 'BufferVisibleHINT guibg=none'
--     vim.cmd.hi 'BufferVisibleINFO guibg=none'
--     vim.cmd.hi 'BufferVisibleIcon guibg=none'
--     vim.cmd.hi 'BufferVisibleSign guibg=none'
--     vim.cmd.hi 'BufferVisibleWARN guibg=none'
--     vim.cmd.hi 'BufferAlternateBtn guibg=none'
--     vim.cmd.hi 'BufferAlternateMod guibg=none'
--     vim.cmd.hi 'BufferAlternatePin guibg=none'
--     vim.cmd.hi 'BufferCurrentADDED guibg=none'
--     vim.cmd.hi 'BufferCurrentERROR guibg=none'
--     vim.cmd.hi 'BufferCurrentIndex guibg=none'
--     vim.cmd.hi 'BufferInactiveHINT guibg=none'
--     vim.cmd.hi 'BufferInactiveINFO guibg=none'
--     vim.cmd.hi 'BufferInactiveIcon guibg=none'
--     vim.cmd.hi 'BufferInactiveSign guibg=none'
--     vim.cmd.hi 'BufferInactiveWARN guibg=none'
--     vim.cmd.hi 'BufferVisibleADDED guibg=none'
--     vim.cmd.hi 'BufferVisibleERROR guibg=none'
--     vim.cmd.hi 'BufferVisibleIndex guibg=none'
--     vim.cmd.hi 'BufferAlternateHINT guibg=none'
--     vim.cmd.hi 'BufferAlternateINFO guibg=none'
--     vim.cmd.hi 'BufferAlternateIcon guibg=none'
--     vim.cmd.hi 'BufferAlternateSign guibg=none'
--     vim.cmd.hi 'BufferAlternateWARN guibg=none'
--     vim.cmd.hi 'BufferCurrentModBtn guibg=none'
--     vim.cmd.hi 'BufferCurrentNumber guibg=none'
--     vim.cmd.hi 'BufferCurrentPinBtn guibg=none'
--     vim.cmd.hi 'BufferCurrentTarget guibg=none'
--     vim.cmd.hi 'BufferDefaultOffset guibg=none'
--     vim.cmd.hi 'BufferInactiveADDED guibg=none'
--     vim.cmd.hi 'BufferInactiveERROR guibg=none'
--     vim.cmd.hi 'BufferInactiveIndex guibg=none'
--     vim.cmd.hi 'BufferVisibleModBtn guibg=none'
--     vim.cmd.hi 'BufferVisibleNumber guibg=none'
--     vim.cmd.hi 'BufferVisiblePinBtn guibg=none'
--     vim.cmd.hi 'BufferVisibleTarget guibg=none'
--     vim.cmd.hi 'BufferAlternateADDED guibg=none'
--     vim.cmd.hi 'BufferAlternateERROR guibg=none'
--     vim.cmd.hi 'BufferAlternateIndex guibg=none'
--     vim.cmd.hi 'BufferCurrentCHANGED guibg=none'
--     vim.cmd.hi 'BufferCurrentDELETED guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrent guibg=none'
--     vim.cmd.hi 'BufferDefaultVisible guibg=none'
--     vim.cmd.hi 'BufferInactiveModBtn guibg=none'
--     vim.cmd.hi 'BufferInactiveNumber guibg=none'
--     vim.cmd.hi 'BufferInactivePinBtn guibg=none'
--     vim.cmd.hi 'BufferInactiveTarget guibg=none'
--     vim.cmd.hi 'BufferVisibleCHANGED guibg=none'
--     vim.cmd.hi 'BufferVisibleDELETED guibg=none'
--     vim.cmd.hi 'BufferAlternateModBtn guibg=none'
--     vim.cmd.hi 'BufferAlternateNumber guibg=none'
--     vim.cmd.hi 'BufferAlternatePinBtn guibg=none'
--     vim.cmd.hi 'BufferAlternateTarget guibg=none'
--     vim.cmd.hi 'BufferDefaultInactive guibg=none'
--     vim.cmd.hi 'BufferDefaultTabpages guibg=none'
--     vim.cmd.hi 'BufferInactiveCHANGED guibg=none'
--     vim.cmd.hi 'BufferInactiveDELETED guibg=none'
--     vim.cmd.hi 'BufferAlternateCHANGED guibg=none'
--     vim.cmd.hi 'BufferAlternateDELETED guibg=none'
--     vim.cmd.hi 'BufferCurrentSignRight guibg=none'
--     vim.cmd.hi 'BufferVisibleSignRight guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentBtn guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentMod guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentPin guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleBtn guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleMod guibg=none'
--     vim.cmd.hi 'BufferDefaultVisiblePin guibg=none'
--     vim.cmd.hi 'BufferInactiveSignRight guibg=none'
--     vim.cmd.hi 'BufferAlternateSignRight guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentHINT guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentINFO guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentIcon guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentSign guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentWARN guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveBtn guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveMod guibg=none'
--     vim.cmd.hi 'BufferDefaultInactivePin guibg=none'
--     vim.cmd.hi 'BufferDefaultTabpageFill guibg=none'
--     vim.cmd.hi 'BufferDefaultTabpagesSep guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleHINT guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleINFO guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleIcon guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleSign guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleWARN guibg=none'
--     vim.cmd.hi 'BufferDefaultAlternateBtn guibg=none'
--     vim.cmd.hi 'BufferDefaultAlternatePin guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentADDED guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentERROR guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentIndex guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveHINT guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveINFO guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveIcon guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveSign guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveWARN guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleADDED guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleERROR guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleIndex guibg=none'
--     vim.cmd.hi 'BufferDefaultAlternateIcon guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentModBtn guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentNumber guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentPinBtn guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentTarget guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveADDED guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveERROR guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveIndex guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleModBtn guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleNumber guibg=none'
--     vim.cmd.hi 'BufferDefaultVisiblePinBtn guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleTarget guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentCHANGED guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentDELETED guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveModBtn guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveNumber guibg=none'
--     vim.cmd.hi 'BufferDefaultInactivePinBtn guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveTarget guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleCHANGED guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleDELETED guibg=none'
--     vim.cmd.hi 'BufferDefaultAlternateModBtn guibg=none'
--     vim.cmd.hi 'BufferDefaultAlternateNumber guibg=none'
--     vim.cmd.hi 'BufferDefaultAlternatePinBtn guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveCHANGED guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveDELETED guibg=none'
--     vim.cmd.hi 'BufferDefaultCurrentSignRight guibg=none'
--     vim.cmd.hi 'BufferDefaultVisibleSignRight guibg=none'
--     vim.cmd.hi 'BufferDefaultInactiveSignRight guibg=none'
--     vim.cmd.hi 'BufferDefaultAlternateSignRight guibg=none'
--   end,
-- }
-- don't use because transparency is messy

local bufferline = {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    { 'echasnovski/mini.bufremove', version = '*' },
  },
  config = function()
    require('bufferline').setup {
      options = {
        separator_style = 'none',
        indicator = { style = 'none' },
        offsets = {
          {
            filetype = 'neo-tree',
            text = '',
            text_align = 'left',
            separator = true,
          },
        },
      },
    }
    require('mini.bufremove').setup {}
  end,
  event = 'BufAdd',
  keys = {
    { '<Tab>', '<Cmd>BufferLineCycleNext<CR>' },
    { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>' },

    {
      '<leader>x',
      function()
        require('mini.bufremove').delete(0)
      end,
      { noremap = true, silent = true },
    },
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', { noremap = true, silent = true } },
    { '<C-S-Left>', '<Cmd>BufferLineMovePrev<CR>', { noremap = true, silent = true } },
    { '<C-S-Right>', '<Cmd>BufferLineMoveNext<CR>', { noremap = true, silent = true } },
  },
}
return bufferline
