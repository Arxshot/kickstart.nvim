-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    keys = {
      { '\\', '<cmd>Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
      },
      source_selector = {
        winbar = true,
        statusline = false,
        separator = { left = '/', right = '\\', override = 'active' }, -- |/  a  / b:active \  c  \...
        sources = {
          { source = 'filesystem' },
          { source = 'buffers' },
          { source = 'document_symbols' },
        },
      },
      sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols', 'jj' },
    },
    config = function(_, opts)
      -- Conditionally modify source selector to replace git with jj
      local jj_utils = require 'neo-tree.sources.jj.utils'
      if jj_utils.get_repository_root() then
        table.insert(opts.source_selector.sources, {
          display_name = '󰊢 JJ',
          source = 'jj',
        })
      elseif vim.fn.isdirectory '.git' ~= 0 then
        table.insert(opts.source_selector.sources, {
          display_name = '󰊢 Git',
          source = 'git_status',
        })
      end

      require('neo-tree').setup(opts)
    end,
  },

  {
    'Cretezy/neo-tree-jj.nvim',
    dependencies = {
      'nvim-neo-tree/neo-tree.nvim',
    },
  },
}
