return {
  'dynamotn/Navigator.nvim',
  cmd = {
    'NavigatorLeft',
    'NavigatorRight',
    'NavigatorUp',
    'NavigatorDown',
    'NavigatorPrevious',
  },
  keys = {
    { '<C-h>', '<cmd>NavigatorLeft<cr>', mode = { 'n', 't' } },
    { '<C-l>', '<cmd>NavigatorRight<cr>', mode = { 'n', 't' } },
    { '<C-k>', '<cmd>NavigatorUp<cr>', mode = { 'n', 't' } },
    { '<C-j>', '<cmd>NavigatorDown<cr>', mode = { 'n', 't' } },
    { '<C-p>', '<cmd>NavigatorPrevious<cr>', mode = { 'n', 't' } },
  },
  opts = {},
}
