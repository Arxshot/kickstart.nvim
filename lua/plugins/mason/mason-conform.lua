return {
  'zapling/mason-conform.nvim',
  dependencies = { 'mason-org/mason.nvim', 'stevearc/conform.nvim' },
  opts = {},
  config = function(_, opts)
    require('mason-conform').setup(opts)
  end,
}
