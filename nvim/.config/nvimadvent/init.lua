print('Advent of NeoVim')
require('config.lazy')
require('config.keymaps')
-- require('advent.learninglua')

vim.opt.shiftwidth     = 4
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.clipboard      = "unnamedplus"

vim.api.nvim_create_autocmd('TextYankPost', {
  desc     = 'Highlight when yanking text',
  group    = vim.api.nvim_create_augroup('advent-highlight-yank', { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})
