local keymap = vim.keymap
-- keymap.set("n", "<space><space>x", ":source %<CR>")
keymap.set("n", "<space>x", ":.lua<CR>", { desc = 'Execute the current line in Lua' })
keymap.set("v", "<space>x", ":lua<CR>", { desc = 'Execute the current line in Lua' })
-- keymap.set("n", "<space>ee", ":lua MiniFiles.open()<CR>")
keymap.set("n", "<space>ee", ":Oil<CR>", { desc = 'Opem the Oil file manager' })
keymap.set("n", "<C-s>", "<cmd>write<cr>")
keymap.set("i", "<C-s>", "<esc><cmd>write<cr>", { desc = 'write file in insert mode' })
keymap.set("n", "<C-t>", "<cmd>$tabnew<cr>", { desc = 'Open a new tab after the final one' })
keymap.set({ "n", "t" }, "<C-\\>", "<cmd>Floaterminal<CR>", { desc = 'Toggle a floating terminal window' })

-- Selection
keymap.set("n", "<C-a>", "ggVG", { desc = "select all" })

-- Buffer Management
keymap.set("n", "<leader>bb", ":b#<CR>", { desc = 'toggle last two buffers' })

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = 'open a new tab' })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = 'close a tab' })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = 'next tab' })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = 'previous tab' })

-- Telescope specific mappings
local telescope_mappings = function()
  local telescope_check = vim.fn.exists('loaded_telescope')
  if not (telescope_check == 1) then return end
  local builtin = require('telescope.builtin')
  keymap.set('n', '<leader>km', builtin.keymaps, { desc = 'View keymaps' })
  keymap.set('n', '<leader>qf', builtin.quickfix, { desc = 'View quickfix' })
  keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'View git status' })
  keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
  keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
  keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Telescope buffers' })
  keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  keymap.set('n', '<leader>en', function()
    builtin.find_files {
      cwd = vim.fn.stdpath('config')
    }
  end, { desc = 'Telescope edit NeoVim Config' })
end
telescope_mappings()
