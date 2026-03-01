return {
  'mason-org/mason.nvim',
  lazy = true,
  event = { 'VeryLazy' },
  opts = {
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
    log_level = vim.log.levels.DEBUG,
  },
}
