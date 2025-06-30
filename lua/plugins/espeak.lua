return {
  name = 'espeak',
  dir = vim.fn.stdpath 'config' .. '/lua/espeak',
  lazy = false,
  cmd = { 'EspeakStop', 'EspeakVisual' },
  keys = {
    {
      '<leader>r',
      function()
        require('espeak').stop()
        require('espeak').speak { bufnr = vim.api.nvim_get_current_buf() }
      end,
      mode = { 'v' },
      desc = 'Espeak [R]ead Selected Text',
    },
    {
      '<leader>r',
      function()
        require('espeak').stop()
        -- require('espeak').speak { bufnr = vim.api.nvim_get_current_buf() }
      end,
      mode = 'n',
      desc = 'Espeak Stop [R]eading',
    },
    {
      '<leader>R',
      function()
        vim.ui.input({ prompt = 'Enter register (default "): ' }, function(input)
          local reg = input or '"'
          require('espeak').stop()
          require('espeak').speak { register = reg }
        end)
      end,
      mode = 'n',
      desc = 'Espeak [R]ead Registor',
    },
  },
  config = function()
    require('espeak').setup()
  end,
}
