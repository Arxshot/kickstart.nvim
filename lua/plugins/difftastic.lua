return {
  'clabby/difftastic.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  lazy = true,
  cmd = { 'Difft', 'DifftClose', 'DifftUpdate' },
  config = function()
    require('difftastic-nvim').setup {
      download = true, -- Auto-download pre-built binary (default: false)
      vcs = 'jj', -- "jj" (default) or "git"
      hunk_wrap_file = false, -- Next hunk at last hunk goes to next file
      highlight_mode = 'treesitter', -- "treesitter" (default) or "difftastic"
      scroll_to_first_hunk = false, -- Auto-scroll to first hunk after opening a file (default: false)
      keymaps = {
        next_file = ']f',
        prev_file = '[f',
        next_hunk = ']c',
        prev_hunk = '[c',
        close = 'q',
        focus_tree = '<Tab>',
        focus_diff = '<Tab>',
        select = '<CR>',
        goto_file = 'gf',
      },
      tree = {
        width = 40,
        icons = {
          enable = true, -- use nvim-web-devicons if available
          dir_open = '',
          dir_closed = '',
        },
      },
      highlights = {
        -- Override any highlight group (see Highlight Groups below)
        -- DifftAdded = { bg = "#2d4a3e" },
      },
    }
  end,
}
