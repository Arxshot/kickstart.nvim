local function in_zellij()
  return vim.env.ZELLIJ ~= nil
end

local function map_nav(z_cmd, nvim_cmd)
  return function()
    if in_zellij() then
      vim.cmd(z_cmd)
    else
      vim.cmd(nvim_cmd)
    end
  end
end

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
      "<A-h>",
      -- map_nav("ZellijNavigateLeft", "wincmd h"),
      "<cmd>wincmd h<cr>",
      mode = { "n", "t" },
      desc = "Navigate Left",
    },
    {
      "<A-j>",
      -- map_nav("ZellijNavigateDown", "wincmd j"),
      "<cmd>wincmd j<cr>",
      mode = { "n", "t" },
      desc = "Navigate Down",
    },
    {
      "<A-k>",
      -- map_nav("ZellijNavigateUp", "wincmd k"),
      "<cmd>wincmd k<cr>",
      mode = { "n", "t" },
      desc = "Navigate Up",
    },
    {
      "<A-l>",
      -- map_nav("ZellijNavigateRight", "wincmd l"),
      "<cmd>wincmd l<cr>",
      mode = { "n", "t" },
      desc = "Navigate Right",
    },

    -- Only meaningful in Zellij → guard them
    {
      "<leader>zt",
      function()
        if in_zellij() then vim.cmd("ZellijNewTab") end
      end,
      desc = "[Z]ellij New Tab",
    },
    {
      "<leader>zf",
      function()
        if in_zellij() then vim.cmd("ZellijNewPane") end
      end,
      desc = "[Z]ellij Floating Pane",
    },
    {
      "<leader>zs",
      function()
        if in_zellij() then vim.cmd("ZellijNewPaneSplit") end
      end,
      desc = "[Z]ellij Split Pane",
    },
    {
      "<leader>zv",
      function()
        if in_zellij() then vim.cmd("ZellijNewPaneVSplit") end
      end,
      desc = "[Z]ellij VSplit Pane",
    },
  },
  init = function()
    -- Options:
    -- vim.g.zelli_navigator_move_focus_or_tab = 1
    vim.g.zellij_navigator_no_default_mappings = 1

  end,
}
