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

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

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

  -- Dap UI setup
  -- For more information, see |:help nvim-dap-ui|
  dapui.setup {
    -- Set icons to characters that are more likely to work in every terminal.
    --    Feel free to remove or use ones that you like more! :)
    --    Don't feel like these are good choices.
    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    controls = {
      icons = {
        pause = '⏸',
        play = '▶',
        step_into = '',
        step_over = '',
        step_out = '',
        step_back = '',
        run_last = '',
        terminate = '⏹',
        disconnect = '⏏',
      },
    },
  }

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
        'a',
        function()
          require('dap').attach()
        end,
        { desc = 'Attach' },
      },
      {
        'p',
        function()
          require('dap').pause()
          require('dap').attach()
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
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        { desc = 'Set Breakpoint' },
      },
      { '<esc>', nil, { exit = true, desc = 'Exit Hydra' } },
      { 'q', nil, { exit = true, desc = 'Exit Hydra' } },
    },
    hint = [[
 Debugging:
 [F5] Start/Continue
 [F1] Step Into
 [F2] Step Over
 [F3] Step Out
 [leader]b Toggle Breakpoint
 [leader]B Set Breakpoint
 [esc] Exit
  ]],
  }
end

return M
