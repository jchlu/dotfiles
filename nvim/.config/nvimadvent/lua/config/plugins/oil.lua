return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    use_default_keymaps = true,
    keymaps = {
      ["l"] = "actions.select",
      ["h"] = { "actions.parent", mode = "n" },
    },
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
