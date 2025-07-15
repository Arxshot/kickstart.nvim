return {
  'mason-org/mason.nvim',
  lazy = false,
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
