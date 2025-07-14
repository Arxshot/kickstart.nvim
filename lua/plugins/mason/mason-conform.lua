return {
  'zapling/mason-conform.nvim',
  opts = {},
  config = function(_, opts)
    require('mason-conform').setup(opts)
  end,
}
