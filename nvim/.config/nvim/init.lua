vim.g.user_emmet_leader_key = ','

-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--[[ -- @jchlu - Add automatic apply of chezmoi file changes
local group = vim.api.nvim_create_augroup('jchlu', { clear = true })
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

autocmd('BufWritePost', {
    pattern = '*/.local/share/chezmoi/*',
    command = '! chezmoi apply --source-path "%"',
    group = group
})
-- @jchlu - And in the other direction
local group = vim.api.nvim_create_augroup('nvimsync', { clear = true })
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- local directory = vim.fn.expand("%:h")
-- autocmd('BufWritePost', {
--     pattern = '*/.config/(*.)/*',
--     command = '! chezmoi add ~/.config/' .. directory .. '/*',
--     group = group
-- })

autocmd('BufWritePost', {
    pattern = '*/.config/nvim/*',
    command = '! chezmoi add ~/.config/nvim/*',
    group = group
}) ]]
-- This has to be set before initializing lazy
vim.g.mapleader = " "
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Initialize lazy with dynamic loading of anything in the plugins directory
require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } }, {
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = false, -- turn off notifications whenever plugin changes are made
  },
})

-- Add filetype for Blade
vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade.php",
  },
})

-- These modules are not loaded by lazy
require("core.options")
require("core.keymaps")

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = "blade.php"
}

-- Set the *.blade.php file to be filetype of blade
-- augroup BladeFiltypeRelated
--   au BufNewFile,BufRead *.blade.php set ft=blade
-- augroup END
