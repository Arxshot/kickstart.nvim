return {
  'Arxshot/smear-cursor.nvim',
  branch = 'patch-1',

  lazy = false,

  config = true,

  keys = { -- load the plugin only when using it's keybinding:
    {
      '<leader>tc',
      function()
        require('smear_cursor').toggle()
        if require('smear_cursor').enabled == false then
          vim.opt.guicursor = ''
          -- os.execute 'tput cnorm'
        end
      end,
      desc = '[T]oggle Smear [C]ursor',
    },
  },

  opts = {
    -- Only smear cursor when moving at least these distances
    min_horizontal_distance_smear = 2,
    min_vertical_distance_smear = 2,

    -- When to switch between rasterization methods
    max_slope_horizontal = 0.6666,
    min_slope_vertical = 1.3333,

    -- Smear cursor when switching buffers or windows.
    smear_between_buffers = true,

    -- Smear cursor when moving within line or to neighbor lines.
    -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
    smear_between_neighbor_lines = true,

    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,

    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears will blend better on all backgrounds.
    legacy_computing_symbols_support = false,

    -- Smear cursor in insert mode.
    -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
    smear_insert_mode = true,

    -- Smear cursor in replace mode.
    smear_replace_mode = true,

    -- Smear cursor in terminal mode.
    -- If the smear goes to the wrong location when enabled, try increasing `delay_after_key`.
    smear_terminal_mode = true,

    -- Default  Range
    stiffness = 0.9, -- 0.6      [0, 1]
    trailing_stiffness = 0.6, -- 0.4      [0, 1]
    stiffness_insert_mode = 0.9, -- 0.4      [0, 1]
    trailing_stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
    slowdown_exponent = -0.05,
    distance_stop_animating = 0.5, -- 0.1      > 0

    delay_event_to_smear = 2,
    delay_after_key = 5, -- milliseconds
    time_interval = 8,
    delay_disable = 32,
  },
}
