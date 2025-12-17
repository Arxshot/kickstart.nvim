return {
  'sylvanfranklin/omni-preview.nvim',
  dependencies = {
    {
      'chomosuke/typst-preview.nvim',
      opts = {
        open_cmd = 'start %s',
      },
      lazy = true,
    },
    { 'tigion/nvim-asciidoc-preview', lazy = true },
    { 'laytan/cloak.nvim', lazy = true },
    { 'toppair/peek.nvim', lazy = true, build = 'deno task --quiet build:fast' },
  },
  opts = {},
  keys = {
    { '<leader>po', '<cmd>OmniPreview start<CR>', desc = 'OmniPreview Start' },
    { '<leader>pc', '<cmd>OmniPreview stop<CR>', desc = 'OmniPreview Stop' },
  },
}
