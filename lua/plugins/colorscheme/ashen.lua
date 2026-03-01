return {
  'ficcdaf/ashen.nvim',
  -- optional but recommended,
  -- pin to the latest stable release:
  tag = '*',
  lazy = true,
  priority = 1000,
  -- configuration is optional!
  opts = {
    style_presets = {
      bold_functions = true,
      italic_comments = true,
    },
  },
}
