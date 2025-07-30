return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  lazy = true,
  cmd = { 'FzfLua' },
  keys = {
    -- [[find]]
    -- [[git]]
    { '<leader>gb', '<cmd>FzfLua git_blame<CR>', desc = '[G]it [B]lame' },
    { '<leader>gc', '<cmd>FzfLua git_commits<CR>', desc = '[G]it [C]ommits' },
    { '<leader>gf', '<cmd>FzfLua git_files<CR>', desc = '[G]it [F]iles' },
    { '<leader>gs', '<cmd>FzfLua git_status<CR>', desc = '[G]it [S]tatus' },
    -- [[search]]
    { '<leader>s"', '<cmd>FzfLua registers<cr>', desc = '[S]earch [R]egisters' },
    { '<leader>sa', '<cmd>FzfLua autocmds<cr>', desc = '[S]earch [A]uto Commands' },
    { '<leader>sb', '<cmd>FzfLua lgrep_curbuf<cr>', desc = '[S]earch [B]uffer' },
    { '<leader>sB', '<cmd>FzfLua builtin<cr>', desc = '[S]earch [B]uiltin' },
    { '<leader>sc', '<cmd>FzfLua command_history<cr>', desc = '[S]earch [C]ommand History' },
    { '<leader>sC', '<cmd>FzfLua commands<cr>', desc = '[S]earch [C]ommands' },
    { '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>', desc = '[S]earch Document [D]iagnostics' },
    { '<leader>sD', '<cmd>FzfLua diagnostics_workspace<cr>', desc = '[S]earch Workspace [D]iagnostics' },
    { '<leader>sg', '<cmd>FzfLua live_grep_native<cr>', desc = '[S]earch by [G]rep' },
    { '<leader>sG', '<cmd>FzfLua live_grep_native<cr>', desc = '[S]earch [G]lobal Grep' },
    { '<leader>sh', '<cmd>FzfLua highlights<cr>', desc = '[S]earch [H]ighlight Groups' },
    { '<leader>sj', '<cmd>FzfLua jumps<cr>', desc = '[S]earch [J]umplist' },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = '[S]earch [K]ey Maps' },
    { '<leader>sm', '<cmd>FzfLua marks<cr>', desc = '[S]earch Jump to [M]ark' },
    { '<leader>sq', '<cmd>FzfLua lgrep_quickfix	<cr>', desc = '[S]earch [Q]uickfix' },
    { '<leader>sT', '<cmd>FzfLua tags_live_grep<cr>', desc = '[S]earch [T]ags' },
    { '<leader>st', '<cmd>FzfLua treesitter<cr>', desc = '[S]earch [T]reesitter' },
    { '<leader>sr', '<cmd>FzfLua resume<cr>', desc = '[S]earch [R]esume' },
    { '<leader>sR', '<cmd>FzfLua oldfiles<cr>', desc = '[S]earch [R]ecet' },
    { '<leader>sv', '<cmd>FzfLua grep_visual<cr>', desc = '[S]earch [V]isual' },
    { '<leader>sz', '<cmd>FzfLua zoxide<cr>', desc = '[S]earch [Z]oxide' },
    -- [[jump]]
  },
  config = function()
    require('fzf-lua').setup {
      'fzf-native',
      'hide',
    }
  end,
  opts = {},
}
