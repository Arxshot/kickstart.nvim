return {
  't-troebst/perfanno.nvim',
  keys = {
    -- Load perf data
    { '<leader>plf', ':PerfLoadFlat<CR>', mode = 'n', desc = '[P]erf [L]oad [F]lat' },
    { '<leader>plg', ':PerfLoadCallGraph<CR>', mode = 'n', desc = '[P]erf [L]oad Call [G]raph' },
    { '<leader>plo', ':PerfLoadFlameGraph<CR>', mode = 'n', desc = '[P]erf [L][o]ad Flame Graph' },

    -- Pick event
    { '<leader>pe', ':PerfPickEvent<CR>', mode = 'n', desc = '[P]erf Pick [E]vent' },

    -- Annotate
    { '<leader>pa', ':PerfAnnotate<CR>', mode = 'n', desc = '[P]erf [A]nnotate' },
    { '<leader>pf', ':PerfAnnotateFunction<CR>', mode = 'n', desc = '[P]erf Annotate [F]unction' },
    { '<leader>pa', ':PerfAnnotateSelection<CR>', mode = 'v', desc = '[P]erf Annotate Selection' },

    -- Toggle
    { '<leader>pt', ':PerfToggleAnnotations<CR>', mode = 'n', desc = '[T]oggle [P]erf Annotations' },

    -- Hottest stuff
    { '<leader>ph', ':PerfHottestLines<CR>', mode = 'n', desc = '[P]erf [H]ottest Lines' },
    { '<leader>ps', ':PerfHottestSymbols<CR>', mode = 'n', desc = '[P]erf Hottest [S]ymbols' },
    { '<leader>pc', ':PerfHottestCallersFunction<CR>', mode = 'n', desc = '[P]erf [C]allers (Function)' },
    { '<leader>pc', ':PerfHottestCallersSelection<CR>', mode = 'v', desc = '[P]erf [C]allers (Selection)' },
  },
  config = function()
    local opts = {
      -- List of highlights that will be used to highlight hot lines (or nil to disable).
      line_highlights = require('perfanno.util').make_bg_highlights(nil, '#FF0000', 10),
      -- Highlight used for virtual text annotations (or nil to disable virtual text).
      vt_highlight = require('perfanno.util').make_fg_highlight '#FF0000',

      -- Annotation formats that can be cycled between via :PerfCycleFormat
      --   "percent" controls whether percentages or absolute counts should be displayed
      --   "format" is the format string that will be used to display counts / percentages
      --   "minimum" is the minimum value below which lines will not be annotated
      -- Note: this also controls what shows up in the telescope finders
      formats = {
        { percent = true, format = '%.2f%%', minimum = 0.5 },
        { percent = false, format = '%d', minimum = 1 },
      },

      -- Automatically annotate files after :PerfLoadFlat and :PerfLoadCallGraph
      annotate_after_load = true,
      -- Automatically annotate newly opened buffers if information is available
      annotate_on_open = true,

      -- Options for telescope-based hottest line finders
      telescope = {
        -- Enable if possible, otherwise the plugin will fall back to vim.ui.select
        enabled = pcall(require, 'telescope'),
        -- Annotate inside of the preview window
        annotate = true,
      },

      -- Node type patterns used to find the function that surrounds the cursor
      ts_function_patterns = {
        -- These should work for most languages (at least those used with perf)
        default = {
          'function',
          'method',
        },
        -- Otherwise you can add patterns for specific languages like:
        -- weirdlang = {
        --     "weirdfunc",
        -- }
      },
    }
    require('perfanno').setup(opts)
  end,
}
