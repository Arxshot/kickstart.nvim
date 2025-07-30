return {
  'wfxr/minimap.vim',
  build = 'cargo install --locked code-minimap',
  cmd = { 'Minimap', 'MinimapClose', 'MinimapToggle', 'MinimapRefresh', 'MinimapUpdateHighlight', 'MinimapRescan' },
  config = function()
    vim.g.minimap_width = 10
    vim.g.minimap_auto_start = 1
    vim.g.minimap_auto_start_win_enter = 1
    -- require('minimap').setup {}
  end,
}
