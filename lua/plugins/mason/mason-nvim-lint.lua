return {
  'rshkarin/mason-nvim-lint',
  opts = {},
  config = function(_, opts)
    require('mason-nvim-lint').setup(opts)
  end,
}
