return { -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  config = function()
    local highlight = {
      'RainbowRed',
      'RainbowGreen',
      'RainbowYellow',
      'RainbowBlue',
      'RainbowMagenta',
      'RainbowCyan',
    }

    local palette = require('palette').palette

    local hooks = require 'ibl.hooks'
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'RainbowRed', { fg = palette.red })
      vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = palette.green })
      vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = palette.yellow })
      vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = palette.blue })
      vim.api.nvim_set_hl(0, 'RainbowMagenta', { fg = palette.magenta })
      vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = palette.cyan })
    end)

    require('ibl').setup { indent = { highlight = highlight } }
  end,
  opts = {},
}
