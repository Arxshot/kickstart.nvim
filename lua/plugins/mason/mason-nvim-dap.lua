return {
  'jay-babu/mason-nvim-dap.nvim',
  dependencies = {
    'mason-org/mason.nvim',
    'mfussenegger/nvim-dap',
  },
  opts = {
    -- Makes a best effort to setup the various debuggers with
    -- reasonable debug configurations
    automatic_installation = true,

    -- You can provide additional configuration to the handlers,
    -- see mason-nvim-dap README for more information
    handlers = {},

    -- You'll need to check that you have the required things installed
    -- online, please don't ask me how to install them :)
    ensure_installed = {
      -- Update this to ensure that you have the debuggers for the langs you want
      -- 'delve',
      -- 'rust',
    },
  },
  config = function(_, opts)
    require('mason-nvim-dap').setup(opts)
  end,
}
