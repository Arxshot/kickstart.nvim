return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  keys = {
    -- [[find]]
    -- [[git]]
    { '<leader>gc', '<cmd>FzfLua git_commits<CR>', desc = '[G]it [C]ommits' },
    { '<leader>gs', '<cmd>FzfLua git_status<CR>', desc = '[G]it [S]tatus' },
    -- [[search]]
    { '<leader>s"', '<cmd>FzfLua registers<cr>', desc = 'Registers' },
    -- { '<leader>sa', '<cmd>FzfLua autocmds<cr>', desc = 'Auto Commands' },
    { '<leader>sb', '<cmd>FzfLua lgrep_curbuf<cr>', desc = '[S]earch [B]uffer' },
    { '<leader>sc', '<cmd>FzfLua command_history<cr>', desc = '[S]earch [C]ommand History' },
    { '<leader>sC', '<cmd>FzfLua commands<cr>', desc = '[S]earch [C]ommands' },
    --{ '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>', desc = 'Document Diagnostics' },
    --{ '<leader>sD', '<cmd>FzfLua diagnostics_workspace<cr>', desc = 'Workspace Diagnostics' },
    { '<leader>sg', '<cmd>FzfLua live_grep_native<cr>', desc = '[S]earch by [Grep]' },
    -- { '<leader>sH', '<cmd>FzfLua highlights<cr>', desc = '[S]earch [H]ighlight Groups' },
    { '<leader>sj', '<cmd>FzfLua jumps<cr>', desc = '[S]earch [J]umplist' },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = '[S]earch [K]ey Maps' },
    -- { '<leader>sm', '<cmd>FzfLua marks<cr>', desc = 'Jump to Mark' },
    { '<leader>sq', '<cmd>FzfLua lgrep_quickfix	<cr>', desc = '[S]earch [Q]uickfix' },
    { '<leader>st', '<cmd>FzfLua tags_live_grep<cr>', desc = '[S]earch [T]ags' },
    { '<leader>sT', '<cmd>FzfLua treesitter<cr>', desc = '[S]earch [T]reesitter' },
    -- { '<leader>sr', '<cmd>FzfLua oldfiles<cr>', desc = '[S]earch [R]ecent' },
    { '<leader>sr', '<cmd>FzfLua resume<cr>', desc = '[S]earch [R]esume' },
    { '<leader>sv', '<cmd>FzfLua grep_visual<cr>', desc = '[S]earch [V]isual' },
    { '<leader>sv', '<cmd>FzfLua zoxide<cr>', desc = '[S]earch [Z]oxide' },
    -- [[jump]]
  },
  config = function()
    require('fzf-lua').setup {
      'fzf-native',
      'hide',
    }
    -- See `:help fzf-lua.builtin`
    local builtin = require 'fzf-lua.previewer.builtin'

    --vim.keymap.set('n', '<leader>sh', builtin.base, { desc = '[S]earch [H]elp' })
    --vim.keymap.set('n', '<leader>sk', builtin.tags, { desc = '[S]earch [T]ags' })
    --vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    --vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    --vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    --vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    --vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    --vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    --vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    --vim.keymap.set('n', '<leader><leader>', builtin.current_buffer_fuzzy_find, { desc = '[ ] Find existing buffers' })
  end,
  opts = {},
}
