return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewFileHistory' },
  keys = {
    {
      '<leader>gv',
      function()
        local lib = require 'diffview.lib'
        if lib.get_current_view() then
          vim.cmd 'DiffviewClose'
        else
          vim.cmd 'DiffviewOpen'
        end
      end,
      desc = 'Git diff[v]iew toggle',
    },
    { '<leader>gf', '<cmd>DiffviewFileHistory %<cr>', desc = 'Git [f]ile history' },
    { '<leader>gF', '<cmd>DiffviewFileHistory<cr>', desc = 'Git repo history ([F]ull)' },
  },
  opts = {},
}
-- vim: ts=2 sts=2 sw=2 et
