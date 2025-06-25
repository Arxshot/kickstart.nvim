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
 ^Split^         ^Move^        ^Resize^       ^Tabs^         ^Misc^
 ^─────^         ^────^        ^──────^       ^────^         ^────^
 _v_: split      _h_: ←        _H_: ←         _tn_: new      _x_: close win
 _s_: vsplit     _j_: ↓        _J_: ↓         _tl_: →        _o_: close all other win
               _k_: ↑        _K_: ↑         _th_: ←        _q_: exit
               _l_: →        _L_: →         _tc_: close
    ]],
    config = {
      color = 'amaranth',
      invoke_on_body = true,
      hint = { position = 'bottom' },
    },
    heads = {
      { 'v', '<cmd>split<CR>', { desc = 'Horizontal Split' } },
      { 's', '<cmd>vsplit<CR>', { desc = 'Vertical Split' } },

      { 'h', '<C-w>h', { desc = 'Move left' } },
      { 'j', '<C-w>j', { desc = 'Move down' } },
      { 'k', '<C-w>k', { desc = 'Move up' } },
      { 'l', '<C-w>l', { desc = 'Move right' } },

      { 'H', '<C-w><', { desc = 'Resize left' } },
      { 'L', '<C-w>>', { desc = 'Resize right' } },
      { 'K', '<C-w>+', { desc = 'Resize up' } },
      { 'J', '<C-w>-', { desc = 'Resize down' } },

      { 'tn', '<cmd>tabnew<CR>', { desc = 'New tab' } },
      { 'th', '<cmd>tabprevious<CR>', { desc = 'Previous tab' } },
      { 'tl', '<cmd>tabnext<CR>', { desc = 'Next tab' } },
      { 'tc', '<cmd>tabclose<CR>', { desc = 'Close tab' } },

      { 'o', '<C-w>o', { exit = true, nowait = true, desc = 'Close all other windows' } },
      { 'x', '<C-w>q', { desc = 'Close window' } },

      { 'q', function() end, { exit = true, nowait = true, desc = 'Exit' } },
    },
  }
end

return M
