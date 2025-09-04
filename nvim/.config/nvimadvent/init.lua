---@diagnostic disable-next-line: undefined-global
local vim            = vim
vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"
require('config.keymaps')

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
  { src = 'https://github.com/nvim-mini/mini.nvim' },
  -- { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/folke/which-key.nvim" }
}

require('config.lsp')

require('which-key').setup()
require('mini.pick').setup()
require('mini.align').setup()
require('mini.icons').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.statusline').setup { use_icons = true }
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

-- require 'nvim-treesitter.configs'.setup {
--   -- A list of parser names, or "all" (the listed parsers MUST always be installed)
--   ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "php", "html", "astro" },
--   vim.treesitter.language.register('php', 'blade'),
--   -- Automatically install missing parsers when entering buffer
--   -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--   auto_install = false,
--
--   -- List of parsers to ignore installing (or "all")
--   -- ignore_install = { "javascript" },
--   highlight = {
--     enable = true,
--
--     -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
--     -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
--     -- the name of the parser)
--     -- list of language that will be disabled
--     -- disable = { "c", "rust" },
--     -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
--     disable = function(lang, buf)
--       local max_filesize = 100 * 1024 -- 100 KB
--       local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
--       if ok and stats and stats.size > max_filesize then
--         return true
--       end
--     end,
--
--     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--     -- Using this option may slow down your editor, and you may see some duplicate highlights.
--     -- Instead of true it can also be a list of languages
--     additional_vim_regex_highlighting = { "php" },
--   },
-- }
require('config.autostart')
