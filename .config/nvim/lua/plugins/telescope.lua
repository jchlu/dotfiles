-- Fuzzy finder
return {
  'nvim-telescope/telescope.nvim',
  lazy = true,
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    'nvim-tree/nvim-web-devicons', -- Fancy icon support
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    telescope.setup {
      defaults = {
        layout_strategy = 'vertical',
        layout_config = {
          vertical = {
            width = 0.95,
            height = 0.95,
            preview_cutoff = 1,
          }
        },
        mappings = {
          n = {
            ['<c-d>'] = actions.delete_buffer
          },
          i = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            -- ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            ['<C-u>'] = false,
            ['<c-d>'] = actions.delete_buffer,
          },
        },
      }
    }
    telescope.load_extension('fzf')
  end
}
