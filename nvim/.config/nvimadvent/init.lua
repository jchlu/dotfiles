---@diagnostic disable-next-line: undefined-global
local vim            = vim
vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"
-- print('Advent of NeoVim')
-- require('config.lazy')
require('config.keymaps')
-- require('advent.learninglua')
--
vim.o.expandtab      = true
vim.o.softtabstop    = 2
vim.o.shiftwidth     = 2
vim.o.number         = true
vim.o.relativenumber = true
vim.o.clipboard      = "unnamedplus"
vim.o.signcolumn     = "yes"
vim.o.winborder      = "rounded"

vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/echasnovski/mini.nvim' }
}

require('mini.pick').setup()
require('mini.align').setup()
require('mini.icons').setup()
require('mini.pairs').setup()
require('mini.statusline').setup { use_icons = true }
require('config.lsp')
require('oil').setup({
  use_default_keymaps = true,
  keymaps = {
    ["l"] = "actions.select",
    ["h"] = { "actions.parent", mode = "n" },
  },
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  },
})
require('gruvbox').setup()
vim.cmd.colorscheme "gruvbox"

vim.api.nvim_create_autocmd('TextYankPost', {
  desc     = 'Highlight when yanking text',
  group    = vim.api.nvim_create_augroup('advent-highlight-yank', { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})
