local M = {
  'nvimtools/hydra.nvim',
}

function M.config()
  local hydra = require 'hydra'

  M.window_hydra = hydra {
    name = '[W]indow Management',
    mode = 'n',
    body = '<leader>w',
    hint = [[
 ^Split^         ^Move^        ^Resize^        ^Misc^
 ^─────^         ^────^        ^──────^        ^────^
 _v_: split      _h_: ←        _H_: ←        _x_: close win
 _s_: vsplit     _j_: ↓        _J_: ↓        _o_: close all other win
               _k_: ↑        _K_: ↑
	       _l_: →        _L_: →
]],
    config = {
      color = 'amaranth',
      invoke_on_body = true,
      hint = { position = 'bottom' },
    },
    heads = {
      { 's', '<cmd>split<CR>', { desc = 'Horizontal Split' } },
      { 'v', '<cmd>vsplit<CR>', { desc = 'Vertical Split' } },

      { 'h', '<C-w>h', { desc = 'Move left' } },
      { 'j', '<C-w>j', { desc = 'Move down' } },
      { 'k', '<C-w>k', { desc = 'Move up' } },
      { 'l', '<C-w>l', { desc = 'Move right' } },

      { 'H', '<C-w><', { desc = 'Resize left' } },
      { 'L', '<C-w>>', { desc = 'Resize right' } },
      { 'K', '<C-w>+', { desc = 'Resize up' } },
      { 'J', '<C-w>-', { desc = 'Resize down' } },

      {
        't',
        function()
          M.tab_hydra:activate()
        end,
        { exit = true, nowait = true, desc = 'Tab Management' },
      },

      { 'o', '<C-w>o', { exit = true, nowait = true, desc = 'Close all other windows' } },
      { 'x', '<C-w>q', { desc = 'Close window' } },

      { '<esc>', function() end, { exit = true, nowait = true, desc = 'Exit' } },
      { 'q', function() end, { exit = true, nowait = true, desc = 'Exit' } },
    },
  }
  M.tab_hydra = hydra {
    name = '[T]ab Management',
    mode = 'n',
    --body = '<leader>w',
    hint = [[
 ^Tabs^            ^Navigation^
 ^────^            ^──────────^
 _n_: new tab      _h_: prev tab
 _x_: close tab    _l_: next tab
]],
    config = {
      color = 'amaranth',
      invoke_on_body = true,
      hint = { position = 'bottom' },
    },
    heads = {
      { 'n', '<cmd>tabnew<CR>', { desc = 'New tab' } },
      { 'h', '<cmd>tabprevious<CR>', { desc = 'Previous tab' } },
      { 'l', '<cmd>tabnext<CR>', { desc = 'Next tab' } },
      { 'x', '<cmd>tabclose<CR>', { desc = 'Close tab' } },

      {
        'w',
        function()
          M.window_hydra:activate()
        end,
        { exit = true, nowait = true, desc = 'Window Management' },
      },

      { '<esc>', function() end, { exit = true, nowait = true, desc = 'Exit' } },
      { 'q', function() end, { exit = true, nowait = true, desc = 'Exit' } },
    },
  }
end

return M
