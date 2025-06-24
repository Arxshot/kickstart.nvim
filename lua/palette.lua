local M = {}

-- Helper: Create palette with aliases (color0=black, etc.)
local function with_aliases(base)
  local aliases = {
    color0 = 'black',
    color1 = 'red',
    color2 = 'green',
    color3 = 'yellow',
    color4 = 'blue',
    color5 = 'magenta',
    color6 = 'cyan',
    color7 = 'white',
    color8 = 'black_bright',
    color9 = 'red_bright',
    color10 = 'green_bright',
    color11 = 'yellow_bright',
    color12 = 'blue_bright',
    color13 = 'magenta_bright',
    color14 = 'cyan_bright',
    color15 = 'white_bright',
  }

  return setmetatable({}, {
    __index = function(_, key)
      if base[key] then
        return base[key]
      end
      if aliases[key] then
        return base[aliases[key]]
      end
      return nil
    end,
    __pairs = function()
      local function iter(t, k)
        local next_key, next_val = next(base, k)
        if next_key then
          return next_key, next_val
        else
          -- after base keys, iterate aliases
          local alias_iter = next(aliases, k)
          if alias_iter then
            local aliased_key = aliases[alias_iter]
            return alias_iter, base[aliased_key]
          end
        end
      end
      return iter, nil, nil
    end,
  })
end

-- Dynamically fetch terminal default ANSI colors
local function get_terminal_palette()
  local term = {}
  for i = 0, 15 do
    term['color' .. i] = '#ff00ff'
  end

  local base = {
    black = term.color0,
    red = term.color1,
    green = term.color2,
    yellow = term.color3,
    blue = term.color4,
    magenta = term.color5,
    cyan = term.color6,
    white = term.color7,
    black_bright = term.color8,
    red_bright = term.color9,
    green_bright = term.color10,
    yellow_bright = term.color11,
    blue_bright = term.color12,
    magenta_bright = term.color13,
    cyan_bright = term.color14,
    white_bright = term.color15,
  }

  return with_aliases(base)
end

-- Static palettes (wrap with_aliases)
M.palettes = {
  terminal = get_terminal_palette(),

  tokyonight = with_aliases {
    black = '#1a1b26',
    red = '#f7768e',
    green = '#9ece6a',
    yellow = '#e0af68',
    blue = '#7aa2f7',
    magenta = '#bb9af7',
    cyan = '#7dcfff',
    white = '#c0caf5',
    black_bright = '#414868',
    red_bright = '#f7768e',
    green_bright = '#9ece6a',
    yellow_bright = '#e0af68',
    blue_bright = '#7aa2f7',
    magenta_bright = '#bb9af7',
    cyan_bright = '#7dcfff',
    white_bright = '#ffffff',
  },

  tokyonight_storm = with_aliases {
    bg = '#24283b',
    bg_dark = '#1f2335',
    bg_dark1 = '#1b1e2d',
    bg_highlight = '#292e42',
    blue = '#7aa2f7',
    blue0 = '#3d59a1',
    blue1 = '#2ac3de',
    blue2 = '#0db9d7',
    blue5 = '#89ddff',
    blue6 = '#b4f9f8',
    blue7 = '#394b70',
    comment = '#565f89',
    cyan = '#7dcfff',
    dark3 = '#545c7e',
    dark5 = '#737aa2',
    fg = '#c0caf5',
    fg_dark = '#a9b1d6',
    fg_gutter = '#3b4261',
    green = '#9ece6a',
    green1 = '#73daca',
    green2 = '#41a6b5',
    magenta = '#bb9af7',
    magenta2 = '#ff007c',
    orange = '#ff9e64',
    purple = '#9d7cd8',
    red = '#f7768e',
    red1 = '#db4b4b',
    teal = '#1abc9c',
    terminal_black = '#414868',
    yellow = '#e0af68',
  },

  dracula = with_aliases {
    black = '#282a36',
    red = '#ff5555',
    green = '#50fa7b',
    yellow = '#f1fa8c',
    blue = '#bd93f9',
    magenta = '#ff79c6',
    cyan = '#8be9fd',
    white = '#f8f8f2',
    black_bright = '#44475a',
    red_bright = '#ff6e6e',
    green_bright = '#69ff94',
    yellow_bright = '#ffffa5',
    blue_bright = '#d6acff',
    magenta_bright = '#ff92df',
    cyan_bright = '#a4ffff',
    white_bright = '#ffffff',
  },

  catppuccin = with_aliases {
    black = '#1e1e2e',
    red = '#f38ba8',
    green = '#a6e3a1',
    yellow = '#f9e2af',
    blue = '#89b4fa',
    magenta = '#f5c2e7',
    cyan = '#94e2d5',
    white = '#cdd6f4',
    black_bright = '#313244',
    red_bright = '#f38ba8',
    green_bright = '#a6e3a1',
    yellow_bright = '#f9e2af',
    blue_bright = '#89b4fa',
    magenta_bright = '#f5c2e7',
    cyan_bright = '#94e2d5',
    white_bright = '#ffffff',
  },
}

-- Default palette
M.palette = M.palettes.tokyonight_storm

return M
