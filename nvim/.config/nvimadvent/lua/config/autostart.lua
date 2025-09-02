---@diagnostic disable-next-line: undefined-global
local vim = vim
-- vim.cmd(':TSUpdate')
vim.cmd('colorscheme gruvbox')
vim.api.nvim_create_autocmd('TextYankPost', {
  desc     = 'Highlight when yanking text',
  group    = vim.api.nvim_create_augroup('advent-highlight-yank', { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

