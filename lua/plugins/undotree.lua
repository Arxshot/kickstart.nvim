local jiaoshijie = {
  'jiaoshijie/undotree',
  lazy = true,
  dependencies = 'nvim-lua/plenary.nvim',
  cmd = { 'UndotreeToggle' },
  opts = {
    float_diff = true, -- using float window previews diff, set this `true` will disable layout option
    layout = 'left_bottom', -- "left_bottom", "left_left_bottom"
    position = 'left', -- "right", "bottom"
    ignore_filetype = { 'undotree', 'undotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
    window = {
      winblend = 30,
    },
    keymaps = {
      ['j'] = 'move_next',
      ['k'] = 'move_prev',
      ['gj'] = 'move2parent',
      ['J'] = 'move_change_next',
      ['K'] = 'move_change_prev',
      ['<cr>'] = 'action_enter',
      ['p'] = 'enter_diffbuf',
      ['q'] = 'quit',
      ['<esc>'] = 'quit',
    },
  },
  config = function(_, opts)
    local undotree = require 'undotree'

    undotree.setup(opts)
  end,
  keys = { -- load the plugin only when using it's keybinding:
    {
      '<leader>u',
      "<cmd>lua require('undotree').toggle()<cr>",
      mode = 'n',
      desc = 'Toggle [U]ndoTree',
    },
  },
}

local mbbill = {
  'mbbill/undotree',
  lazy = true,

  cmd = { 'UndotreeToggle' },
  config = function()
    -- Set focus to undotree window on toggle (optional)
    vim.g.undotree_SetFocusWhenToggle = 1

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'undotree',
      callback = function()
        vim.keymap.set('n', '<esc>', '<cmd>UndotreeToggle<CR>', {
          desc = 'Close undotree panel',
          buffer = true,
        })
      end,
    })
  end,

  keys = { -- load the plugin only when using it's keybinding:
    {
      '<leader>u',
      '<cmd>UndotreeToggle<cr>',
      mode = 'n',
      desc = 'toggle [u]ndotree',
    },
  },
}

return mbbill
