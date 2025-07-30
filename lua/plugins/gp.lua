return {
  'robitx/gp.nvim',
  enab
  opts = {},
  config = function(_, opts)
    require('gp').setup(opts)
  end,
}
