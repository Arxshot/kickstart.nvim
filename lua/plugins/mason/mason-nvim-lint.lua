return {
  'rshkarin/mason-nvim-lint',
  dependencies = {
    'mason-org/mason.nvim',
    'mfussenegger/nvim-lint',
  },
  opts = {},
  config = function(_, opts)
    require('mason-nvim-lint').setup(opts)
  end,
}
