return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  lazy = false,
  cmd = { 'FzfLua' },
  keys = {
    -- [[find]]
    -- [[git]]
    { '<leader>gb', '<cmd>FzfLua git_status<CR>', desc = '[G]it [B]lame' },
    { '<leader>gc', '<cmd>FzfLua git_commits<CR>', desc = '[G]it [C]ommits' },
    { '<leader>gf', '<cmd>FzfLua git_files<CR>', desc = '[G]it [F]iles' },
    { '<leader>gs', '<cmd>FzfLua git_status<CR>', desc = '[G]it [S]tatus' },
    -- [[search]]
    { '<leader>s"', '<cmd>FzfLua registers<cr>', desc = '[S]earch [R]egisters' },
    { '<leader>sa', '<cmd>FzfLua autocmds<cr>', desc = '[S]earch [A]uto Commands' },
    { '<leader>sb', '<cmd>FzfLua lgrep_curbuf<cr>', desc = '[S]earch [B]uffer' },
    { '<leader>sc', '<cmd>FzfLua command_history<cr>', desc = '[S]earch [C]ommand History' },
    { '<leader>sC', '<cmd>FzfLua commands<cr>', desc = '[S]earch [C]ommands' },
    -- { '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>', desc = '[S]earch Document [D]iagnostics' },
    -- { '<leader>sD', '<cmd>FzfLua diagnostics_workspace<cr>', desc = '[S]earch Workspace [D]iagnostics' },
    { '<leader>sg', '<cmd>FzfLua live_grep_native<cr>', desc = '[S]earch by [G]rep' },
    { '<leader>sG', '<cmd>FzfLua live_grep_native<cr>', desc = '[S]earch [G]lobal Grep' },
    { '<leader>sh', '<cmd>FzfLua highlights<cr>', desc = '[S]earch [H]ighlight Groups' },
    { '<leader>sj', '<cmd>FzfLua jumps<cr>', desc = '[S]earch [J]umplist' },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = '[S]earch [K]ey Maps' },
    { '<leader>sm', '<cmd>FzfLua marks<cr>', desc = '[S]earch Jump to [M]ark' },
    { '<leader>sq', '<cmd>FzfLua lgrep_quickfix	<cr>', desc = '[S]earch [Q]uickfix' },
    { '<leader>st', '<cmd>FzfLua tags_live_grep<cr>', desc = '[S]earch [T]ags' },
    { '<leader>sT', '<cmd>FzfLua treesitter<cr>', desc = '[S]earch [T]reesitter' },
    { '<leader>sr', '<cmd>FzfLua resume<cr>', desc = '[S]earch [R]esume' },
    { '<leader>sR', '<cmd>FzfLua oldfiles<cr>', desc = '[S]earch [R]ecet' },
    { '<leader>sv', '<cmd>FzfLua grep_visual<cr>', desc = '[S]earch [V]isual' },
    { '<leader>sz', '<cmd>FzfLua zoxide<cr>', desc = '[S]earch [Z]oxide' },
    -- [[jump]]
    -- [[lsp]]
    -- { '<leader>la', '<cmd>FzfLua lsp_code_actions<cr>', desc = '[L]SP Code [A]ctions' },
    -- { '<leader>ld', '<cmd>FzfLua lsp_definitions<cr>', desc = '[L]SP [D]efinitions' },
    -- { '<leader>lD', '<cmd>FzfLua lsp_declarations<cr>', desc = '[L]SP [D]eclarations' },
    -- { '<leader>li', '<cmd>FzfLua lsp_incoming_calls<cr>', desc = '[L]SP [I]ncoming Calls' },
    -- { '<leader>lI', '<cmd>FzfLua lsp_implementations<cr>', desc = '[L]SP [I]mplementations' },
    -- { '<leader>lo', '<cmd>FzfLua lsp_outgoing_calls<cr>', desc = '[L]SP [O]utgoning Calls' },
    -- --{ '<leader>lsd', '<cmd>FzfLua lsp_document_symbols<cr>', desc = '[L]SP Document Symbols' },
    -- { '<leader>lw', '<cmd>FzfLua lsp_live_workspace_symbols<cr>', desc = '[L]SP [W]orkspace Symbols' },
    -- { '<leader>lt', '<cmd>FzfLua lsp_typedefs<cr>', desc = '[L]SP [T]ypeDefs' },
    -- { '<leader>lr', '<cmd>FzfLua lsp_references<cr>', desc = '[L]SP [R]eferences' },
  },
  config = function()
    require('fzf-lua').setup {
      'fzf-native',
      'hide',
    }

    vim.ui.select = require('fzf-lua').ui_select

    -- See `:help fzf-lua.builtin`
    local biltin = require 'fzf-lua.previewer.builtin'

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
