-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)
local M = {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  lazy = false,
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Installs the debug adapters for you
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Hydra
    'nvimtools/hydra.nvim',
  },
}

M.keys = {
  {
    '<leader>d',
    function()
      M.debugger_hydra:activate()
    end,
    mode = { 'n' },
    desc = '[D]ebugger',
  },
}

M.config = function()
  local dap = require 'dap'
  local dapui = require 'dapui'

  -- Change breakpoint icons
  vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
  vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
  local breakpoint_icons = vim.g.have_nerd_font
      and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
    or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
  for type, icon in pairs(breakpoint_icons) do
    local tp = 'Dap' .. type
    local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
    vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
  end

  dap.listeners.before.attach.dapui_config = dapui.open
  dap.listeners.before.launch.dapui_config = dapui.open
  dap.listeners.after.event_initialized.dapui_config = dapui.open
  dap.listeners.before.event_terminated.dapui_config = dapui.close
  dap.listeners.before.event_exited.dapui_config = dapui.close

  local Hydra = require 'hydra'
  M.debugger_hydra = Hydra {
    name = 'Debugging',
    -- mode = 'n',
    -- body = '<leader>d', -- You can set a different key to activate the hydra if you want
    config = {
      color = 'amaranth',
      invoke_on_body = true,
      hint = { position = 'bottom' },
    },
    heads = {
      -- Stepping
      {
        'H',
        function()
          require('dap').reverse_continue()
        end,
        { desc = 'Reverse Continue' },
      },
      {
        'h',
        function()
          require('dap').step_back()
        end,
        { desc = 'Step Back' },
      },
      {
        'j',
        function()
          require('dap').step_into()
        end,
        { desc = 'Step Into' },
      },
      {
        'k',
        function()
          require('dap').step_out()
        end,
        { desc = 'Step Out' },
      },
      {
        'l',
        function()
          require('dap').step_over()
        end,
        { desc = 'Step Over' },
      },
      {
        'L',
        function()
          require('dap').continue()
        end,
        { desc = 'Start/Continue' },
      },
      -- other
      {
        'p',
        function()
          require('dap').pause()
        end,
        { desc = 'Pause' },
      },
      {
        'b',
        function()
          require('dap').toggle_breakpoint()
        end,
        { desc = 'Toggle Breakpoint' },
      },
      {
        'B',
        function()
          local condition = vim.fn.input 'Breakpoint condition: '
          local hitCount = vim.fn.input 'Breakpoint hit count: '
          local log = vim.fn.input 'Breakpoint log: '
          require('dap').set_breakpoint(condition, hitCount, log)
        end,
        { desc = 'Set Breakpoint' },
      },
      {
        't',
        function()
          require('dapui').toggle()
        end,
        { desc = 'Toggle UI' },
      },
      { '<esc>', nil, { exit = true, desc = 'Exit Hydra' } },
      -- { 'q', nil, { exit = true, desc = 'Exit Hydra' } },
    },
  }
end

return M
