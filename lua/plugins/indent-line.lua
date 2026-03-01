return { -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  event = { 'BufEnter' },
  config = function()
    local highlight = {
      'RainbowRed',
      'RainbowGreen',
      'RainbowYellow',
      'RainbowBlue',
      'RainbowMagenta',
      'RainbowCyan',
    }

    local hooks = require 'ibl.hooks'
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      -- vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#a26a6a' })
      -- vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#6a8a6a' })
      -- vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#9c9c6a' })
      -- vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#6a7a8a' })
      -- vim.api.nvim_set_hl(0, 'RainbowMagenta', { fg = '#8a6a8a' })
      -- vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#6a8a8a' })

      vim.api.nvim_set_hl(0, 'RainbowRed', { link = 'DiagnosticError' })
      vim.api.nvim_set_hl(0, 'RainbowGreen', { link = 'DiagnosticOk' })
      vim.api.nvim_set_hl(0, 'RainbowYellow', { link = 'DiagnosticWarn' })
      vim.api.nvim_set_hl(0, 'RainbowBlue', { link = 'Function' })
      vim.api.nvim_set_hl(0, 'RainbowMagenta', { link = 'Statement' })
      vim.api.nvim_set_hl(0, 'RainbowCyan', { link = 'Type' })

      vim.api.nvim_set_hl(0, 'RainbowRed', { link = 'Error' })
      vim.api.nvim_set_hl(0, 'RainbowGreen', { link = 'String' })
      vim.api.nvim_set_hl(0, 'RainbowYellow', { link = 'Identifier' })
      vim.api.nvim_set_hl(0, 'RainbowBlue', { link = 'Function' })
      vim.api.nvim_set_hl(0, 'RainbowMagenta', { link = 'Statement' })
      vim.api.nvim_set_hl(0, 'RainbowCyan', { link = 'Type' })
    end)

    require('ibl').setup {
      indent = {
        highlight = highlight,
        char = '',
      },
      whitespace = {
        highlight = {
          'CursorColumn',
          'Whitespace',
        },
        remove_blankline_trail = false,
      },
      scope = { enabled = false },
    }
  end,
  opts = {},
}
