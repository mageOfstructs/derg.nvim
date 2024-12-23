return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      start_in_insert = true,
      direction = 'float',
      auto_scroll = true,
      float_opts = {
        border = 'double',
      },
    }
  end,
}
