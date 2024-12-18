vim.keymap.set("n", "<space><space>x", ":source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
-- vim.keymap.set("n", "<space>ee", ":lua MiniFiles.open()<CR>")
vim.keymap.set("n", "<space>ee", ":Oil<CR>")
vim.keymap.set("n", "<C-s>", "<cmd>write<cr>")
vim.keymap.set("i", "<C-s>", "<esc><cmd>write<cr>") -- write file in insert mode

-- Telescope specific mappings
local telescope_mappings = function()
  local telescope_check = vim.fn.exists('loaded_telescope')
  if not (telescope_check == 1) then return end
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
  vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  vim.keymap.set('n', '<leader>en', function()
    builtin.find_files {
      cwd = vim.fn.stdpath('config')
    }
  end, { desc = 'Telescope edit NeoVim Config' })
end
telescope_mappings()
