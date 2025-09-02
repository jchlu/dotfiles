---@diagnostic disable-next-line: undefined-global
local vim = vim
local keymap = vim.keymap
keymap.set("n", "<leader><leader>x", ":source %<CR>")
keymap.set("n", "<leader>x", ":.lua<CR>", { desc = 'Execute the current line in Lua' })
keymap.set("v", "<leader>x", ":lua<CR>", { desc = 'Execute the current line in Lua' })
keymap.set("n", "<leader>ee", ":Oil<CR>", { desc = 'Open the Oil file manager' })

keymap.set({ 'n', 'i' }, "<C-s>", function()
  vim.cmd "stopinsert"
  vim.lsp.buf.format()
  vim.cmd "update"
end, { desc = 'write and format file' })

keymap.set('n', '<leader>ff', ":Pick files<CR>", { desc = 'Pick files' })
keymap.set('n', '<leader>fh', ":Pick help<CR>", { desc = 'Pick help' })
keymap.set('n', '<leader>fg', ":Pick grep_live<CR>", { desc = 'Pick Live Grep' })
keymap.set('n', '<leader><leader>', ":Pick buffers<CR>", { desc = 'Pick Buffers' })

keymap.set("n", "<C-t>", "<cmd>$tabnew<cr>", { desc = 'Open a new tab after the final one' })
keymap.set({ "n", "t" }, "<C-\\>", "<cmd>Floaterminal<CR>", { desc = 'Toggle a floating terminal window' })

keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })
keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })
keymap.set({ 'n', 'i' }, "<C-;>", function()
  vim.cmd "stopinsert"
  vim.api.nvim_input("A;<ESC>")
end, { desc = "Append a semi-colon to the end of the line, for PHP mostly" })
keymap.set({ 'n', 'i' }, "<C-.>", function()
  vim.cmd "stopinsert"
  vim.api.nvim_input("A,<ESC>")
end, { desc = "Append a full-stop to the end of the line, for JSON mostly" })

-- Selection
keymap.set("n", "<C-a>", "ggVG", { desc = "select all" })

-- Buffer Management
keymap.set("n", "<leader>bb", ":b#<CR>", { desc = 'toggle last two buffers' })

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = 'open a new tab' })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = 'close a tab' })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = 'next tab' })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = 'previous tab' })
local oil_mappings = function()
  keymap.set('n', '<leader>en', function()
    local cwd = vim.fn.stdpath('config')
    require('oil').open(cwd)
    vim.cmd.cd({ args = { cwd } })
  end, { desc = 'Edit NeoVim Config' })
  keymap.set('n', '<leader>ed', function()
    local cwd = '~/dotfiles/'
    require('oil').open(cwd)
    vim.cmd.cd({ args = { cwd } })
  end, { desc = 'Edit dotfiles' })
end
oil_mappings()
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
  keymap.set('n', '<leader>ed', function()
    builtin.find_files {
      hidden = true,
      cwd = "~/dotfiles/"
    }
  end, { desc = 'Telescope edit dotfiles' })
  keymap.set('n', '<leader>eh', function()
    builtin.find_files {
      cwd = "~/dotfiles/niri/.config/niri/"
    }
  end, { desc = 'Telescope edit WindowManager Config' })
  keymap.set('n', '<leader>eg', function()
    builtin.find_files {
      cwd = "~/dotfiles/ghostty/.config/ghostty/"
    }
  end, { desc = 'Telescope edit Ghostty Config' })
  keymap.set('n', '<leader>ez', function()
    builtin.find_files {
      cwd = "~/dotfiles/zshrc/.config/zshrc"
    }
  end, { desc = 'Telescope edit zsh Config' })
end
telescope_mappings()

local function toggle_theme()
  if vim.opt.background:get() == "dark" then
    vim.opt.background = "light"
    -- In my case it was unnecessary to set theme directly,
    -- as tokyonight reacted to change of vim.opt.background
    -- vim.cmd("colorscheme tokyonight-day")
  else
    vim.opt.background = "dark"
    -- vim.cmd("colorscheme tokyonight-moon")
  end
end

vim.keymap.set("n", "<leader>tt", toggle_theme, {})
vim.keymap.set('i', "<C-space>", vim.lsp.completion.get)
-- vim.keymap.set({ 'n', 'i' }, "<leader>lf", vim.lsp.buf.format)
