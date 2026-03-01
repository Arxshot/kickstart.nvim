return {
  'rshkarin/mason-nvim-lint',
  event = { 'VeryLazy' },
  dependencies = {
    'mason-org/mason.nvim',
    'mfussenegger/nvim-lint',
  },
  opts = {},
  config = function(_, opts)
    require('mason-nvim-lint').setup(opts)
  end,
}
