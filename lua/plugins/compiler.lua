return {
  'Zeioth/compiler.nvim',

  cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },

  dependencies = { 'stevearc/overseer.nvim', 'nvim-telescope/telescope.nvim' },

  keys = {
    -- Open compiler
    { '<leader>co', '<cmd>CompilerOpen<cr>', mode = 'n', desc = '[C]ompiler [O]pen' },

    -- Redo last selected option
    {
      '<leader>cr',
      '<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>',
      mode = 'n',
      desc = '[C}ompiler [R]edo Last Option',
    },

    -- Toggle compiler results
    {
      '<leader>ct',
      '<cmd>CompilerToggleResults<cr>',
      mode = 'n',
      desc = '[C]ompiler [T]oggle Results',
    },

    -- Redo
    {
      '<leader>cs',
      '<cmd>CompilerStop<cr>',
      mode = 'n',
      desc = '[C}ompiler [S]top',
    },
  },

  opts = {},
}
