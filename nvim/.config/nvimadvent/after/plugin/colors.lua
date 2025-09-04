---@diagnostic disable-next-line: undefined-global
local vim = vim
-- overrde colors after colorscheme has loaded
vim.cmd [[
"highlight Normal      guibg   = none
"highlight NonText     guibg   = none
"highlight Normal      ctermbg = none
"highlight NonText     ctermbg = none
highlight LineNr      guifg   = #f39c12
highlight LineNrAbove guifg   = #f39c12
highlight LineNrBelow guifg   = #f39c12
highlight CursorLine  guibg   = #100c08
]]
