return {
  'Bekaboo/deadcolumn.nvim',
  lazy = true,
  event = { 'BufEnter' },
  opts = {
    scope = 'line', ---@type string|fun(): integer
    ---@type string[]|boolean|fun(mode: string): boolean
    modes = function(mode)
      return mode:find '^[iRss\x13]' ~= nil
    end,
    blending = {
      threshold = 0.5,
      colorcode = '#000000',
      hlgroup = { 'Normal', 'bg' },
    },
    warning = {
      alpha = 0.15,
      offset = 0,
      colorcode = '#FF0000',
      hlgroup = { 'Error', 'bg' },
    },
    extra = {
      ---@type string?
      follow_tw = nil,
    },
  },
  config = function(_, opts)
    require('deadcolumn').setup(opts) -- Call the setup function
  end,
}
