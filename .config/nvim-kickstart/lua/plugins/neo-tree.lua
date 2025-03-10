return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    'antosha417/nvim-lsp-file-operations',
  },
  cmd = 'Neotree',
  init = function()
    if vim.fn.argc(-1) == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == 'directory' then
        require('neo-tree').setup {
          filesystem = {
            hijack_netrw_behavior = 'open_current',
          },
        }
      end
    end
  end,
  -- opts = {
  --   close_if_last_window = true,
  -- },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
    }
    require('lsp-file-operations').setup()
  end,
  keys = {
    { '<leader>e', ':Neotree toggle reveal<CR>', { desc = 'NeoTree toggle' } },
  },
}
