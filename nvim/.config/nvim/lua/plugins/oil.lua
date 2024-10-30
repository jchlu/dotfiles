return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    -- Don't autostart
    default_file_explorer = false,
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
    float = {
      preview_split = "right",
      override = function(conf)
        return conf
      end,
    }
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
