local M = {
  'nvimtools/hydra.nvim',
  lazy = true,
}

M.keys = {
  {
    '<leader>b',
    function()
      M.buffer_hydra:activate()
    end,
    desc = '[B]uffer Manager',
    mode = 'n',
  },
  {
    '<leader>w',
    function()
      M.window_hydra:activate()
    end,
    desc = '[W]indow Manager',
    mode = 'n',
  },
  {
    '<leader>t',
    function()
      M.tab_hydra:activate()
    end,
    desc = '[T]ab Manager',
    mode = 'n',
  },
}

function M.config()
  local hydra = require 'hydra'

  -- https://stackoverflow.com/questions/26708822/why-do-vim-experts-prefer-buffers-over-tabs/26710166#26710166
  M.buffer_hydra = hydra {
    name = 'Buffer Manager',
    config = {
      color = 'amaranth',
      invoke_on_body = true,
      hint = { position = 'bottom' },
    },
    hint = [[
 ^Buffers^            ^Navigate^      ^Actions^                ^Modes^
 ^───────^            ^────────^      ^───────^                ^─────^
 _e_: edit buffer     _j_: next       _d_: delete buffer       _w_: window mgr
 _a_: add buffer      _k_: previous   _h_: hide buffer         _t_: tab mgr
 _s_: switch buffer   _J_: last       _q_: quit buffer
 _b_: list buffers    _K_: first      _Q_: quit all buffers
 _l_: buffer lines                  _f_: flush buffer
 _T_: terminal                      _F_: flush all buffers
                                  _x_: flsuh & quit
                                  _X_: flush & quit all

_<esc>_: exit
]],
    heads = {
      {
        'e',
        function()
          local file = vim.fn.input ':edit '
          if file ~= '' then
            vim.cmd('edit ' .. file)
          end
        end,
        { desc = 'edit' },
      },
      {
        'a',
        function()
          local file = vim.fn.input ':badd '
          if file ~= '' then
            vim.cmd('badd ' .. file)
          end
        end,
        { desc = 'badd' },
      },
      {
        'T',
        function()
          local text = vim.fn.input ':terminal '
          vim.cmd('terminal ' .. text)
        end,
        { desc = 'terminal' },
      },

      {
        's',
        function()
          local file = vim.fn.input ':buffer '
          local num = tonumber(file)

          if num then
            vim.cmd('buffer ' .. num)
          elseif file ~= '' then
            vim.cmd('buffer ' .. vim.fn.fnameescape(file))
          end
        end,
        { desc = 'Switch buffer' },
      },
      {
        'd',
        function()
          local file = vim.fn.input ':bdelete '
          if file ~= '' then
            vim.cmd('bdelete ' .. file)
          end
        end,
        { desc = 'bdelete' },
      },
      {
        'h',
        function()
          vim.cmd 'set hidden'
        end,
        { desc = 'hide' },
      },

      {
        'j',
        function()
          vim.cmd 'bnext'
        end,
        { desc = 'bnext' },
      },
      {
        'J',
        function()
          vim.cmd 'blast'
        end,
        { desc = 'blast' },
      },
      {
        'k',
        function()
          vim.cmd 'bprevious'
        end,
        { desc = 'bprevious' },
      },
      {
        'K',
        function()
          vim.cmd 'bfirst'
        end,
        { desc = 'bfirst' },
      },

      {
        'l',
        function()
          vim.cmd 'FzfLua lines'
        end,
        { exit = true, nowait = true, desc = 'buffers' },
      },
      {
        'b',
        function()
          vim.cmd 'FzfLua buffers'
        end,
        { exit = true, nowait = true, desc = 'buffers' },
      },

      {
        'f',
        function()
          vim.cmd 'w'
        end,
        { desc = 'Write Buffer' },
      },
      {
        'F',
        function()
          vim.cmd 'wa'
        end,
        { desc = 'Write All buffers' },
      },

      {
        'q',
        function()
          vim.cmd 'q'
        end,
        { desc = 'Quit buffer' },
      },
      {
        'Q',
        function()
          vim.cmd 'qa'
        end,
        { desc = 'Quit All Buffers' },
      },

      {
        'x',
        function()
          vim.cmd 'x'
        end,
        { desc = 'Write & Quit Buffer' },
      },
      {
        'X',
        function()
          vim.cmd 'bfirst'
        end,
        { desc = 'Write & Quit All Buffers' },
      },

      {
        'w',
        function()
          M.window_hydra:activate()
        end,
        { exit = true, nowait = true, desc = 'Window Manager' },
      },
      {
        't',
        function()
          M.tab_hydra:activate()
        end,
        { exit = true, nowait = true, desc = 'Tab Manager' },
      },

      { '<esc>', function() end, { exit = true, nowait = true, desc = 'Exit' } },
    },
  }

  M.window_hydra = hydra {
    name = 'Window Manager',
    hint = [[
 ^Split^          ^Move^   ^Resize^        ^Misc^              ^Mode^
 ^─────^          ^────^   ^──────^        ^────^              ^────^
 _v_: split       _h_: ←   _H_: resize ←   _x_: close win      _b_: buf mgr
 _s_: vsplit      _j_: ↓   _J_: resize ↓   _o_: close others   _t_: tab mgr
 _m_: MiniMap     _k_: ↑   _K_: resize ↑
                _l_: →   _L_: resize →

_<esc>_: exit
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
        'm',
        function()
          vim.cmd 'MinimapRefresh'
          vim.cmd 'MinimapToggle'
        end,
        { desc = 'Toggle Mini-Map' },
      },

      {
        'b',
        function()
          M.buffer_hydra:activate()
        end,
        { exit = true, nowait = true, desc = 'Buffer Manager' },
      },
      {
        't',
        function()
          M.tab_hydra:activate()
        end,
        { exit = true, nowait = true, desc = 'Tab Manager' },
      },

      { 'o', '<C-w>o', { exit = true, nowait = true, desc = 'Close all other windows' } },
      { 'x', '<C-w>q', { desc = 'Close window' } },

      { '<esc>', function() end, { exit = true, nowait = true, desc = 'Exit' } },
    },
  }

  M.tab_hydra = hydra {
    name = 'Tab Manager',
    hint = [[
 ^Tabs^             ^Navigation^    ^Mode^
 ^────^             ^──────────^    ^────^
 _n_: new tab       _h_: prev tab   _b_: buf mgr
 _x_: close tab     _l_: next tab   _w_: wid mgr
 _s_: search tabs

_<esc>_: exit
]],
    config = {
      color = 'amaranth',
      invoke_on_body = true,
      hint = { position = 'bottom' },
    },
    heads = {
      {
        'n',
        function()
          vim.cmd 'tabnew'
        end,
        { desc = 'New tab' },
      },
      {
        'h',
        function()
          vim.cmd 'tabprevious'
        end,
        { desc = 'Previous tab' },
      },
      {
        'l',
        function()
          vim.cmd 'tabnext'
        end,
        { desc = 'Next tab' },
      },
      {
        'x',
        function()
          vim.cmd 'tabclose'
        end,
        { desc = 'Close tab' },
      },

      {
        'b',
        function()
          M.buffer_hydra:activate()
        end,
        { exit = true, nowait = true, desc = 'Buffer Manager' },
      },
      {
        'w',
        function()
          M.window_hydra:activate()
        end,
        { exit = true, nowait = true, desc = 'Window Manager' },
      },
      {
        's',
        function()
          vim.cmd 'FzfLua tabs'
        end,
        { exit = true, nowait = true, desc = 'tabs' },
      },

      { '<esc>', function() end, { exit = true, nowait = true, desc = 'Exit' } },
    },
  }
end

return M
