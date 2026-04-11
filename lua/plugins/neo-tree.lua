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
      { '\\', '<cmd>Neotree source=last reveal<CR>', desc = 'NeoTree Reveal', silent = true },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
                          -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
                          -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        show_unloaded = true,
      },
      git_status = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
                          -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
      jj = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
                          -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
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
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      sources = { 'filesystem', 'buffers', 'git_status', 'jj', 'document_symbols' },
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
