return {
  "folke/tokyonight.nvim",
  -- dependencies = 'xiyaowong/transparent.nvim',
  -- opts = { transparent = vim.g.transparent_enabled },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd.colorscheme "tokyonight-storm"
  end
}
