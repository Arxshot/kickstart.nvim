return {
  'nickkadutskyi/jb.nvim',
  lazy = true,
  opts = {},
  config = function()
    require('jb').setup { transparent = true }
    -- vim.cmd 'colorscheme jb'
  end,
}
