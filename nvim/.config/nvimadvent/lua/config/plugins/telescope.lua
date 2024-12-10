return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = { height = 0.95, width = 0.95, preview_width = 0.6 },
      },
      --   pickers = {
      --     find_files = {
      --       theme = 'ivy',
      --     },
      --   },
    }
    require('telescope').load_extension('fzf')
  end,
}
