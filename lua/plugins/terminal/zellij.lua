return {
  'https://github.com/fresh2dev/zellij.vim',
  -- Pin version to avoid breaking changes.
  tag = '0.3.*',
  lazy = false,
  cmd = {
    'ZellijNavigateUp',
    'ZellijNavigateDown',
    'ZellijNavigateLeft',
    'ZellijNavigateRight',

    'ZellijNewTab',
    'ZellijNewPane',
    'ZellijNewPaneSplit',
    'ZellijNewPaneVSplit',
  },
  keys = {
    {
      '<A-h>',
      '<cmd>ZellijNavigateLeft<cr>',
      mode = { 'n', 't' },
      desc = '[Z]ellij Navigate Left',
    },
    {
      '<A-j>',
      '<cmd>ZellijNavigateDown<cr>',
      mode = { 'n', 't' },
      desc = '[Z]ellij Navigate Down',
    },
    {
      '<A-k>',
      '<cmd>ZellijNavigateUp<cr>',
      mode = { 'n', 't' },
      desc = '[Z]ellij Navigate Up',
    },
    {
      '<A-l>',
      '<cmd>ZellijNavigateRight<cr>',
      mode = { 'n', 't' },
      desc = '[Z]ellij Navigate Right',
    },

    {
      '<leader>zt',
      '<cmd>ZellijNewTab<cr>',
      mode = { 'n', 't' },
      desc = '[Z]ellij New [T]ab',
    },
    {
      '<leader>zf',
      '<cmd>ZellijNewPane<cr>',
      mode = { 'n', 't' },
      desc = '[Z]ellij New [F]loating Pane',
    },
    {
      '<leader>zs',
      '<cmd>ZellijNewPaneSplit<cr>',
      mode = { 'n', 't' },
      desc = '[Z]ellij [S]plit Pane',
    },
    {
      '<leader>zv',
      '<cmd>ZellijNewPaneVSplit<cr>',
      mode = { 'n', 't' },
      desc = '[Z]ellij [V]Split Pane',
    },
  },
  init = function()
    -- Options:
    -- vim.g.zelli_navigator_move_focus_or_tab = 1
    vim.g.zellij_navigator_no_default_mappings = 1
  end,
}
