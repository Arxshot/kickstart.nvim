return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = { 'mason-org/mason.nvim' },
  opts = { ensure_installed = ensure_installed },
  config = function(_, opts)
    require('mason-tool-installer').setup(opts)
  end,
}
