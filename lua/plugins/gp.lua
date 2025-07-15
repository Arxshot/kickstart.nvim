return {
  'robitx/gp.nvim',
  opts = {},
  config = function(_, opts)
    require('gp').setup(opts)
  end,
}
