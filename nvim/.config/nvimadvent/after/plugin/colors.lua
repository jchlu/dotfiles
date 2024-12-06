-- overrde colors after colorscheme has loaded
vim.cmd [[
highlight Normal      guibg   = none
highlight NonText     guibg   = none
highlight Normal      ctermbg = none
highlight NonText     ctermbg = none
highlight LineNr      guifg   = #f39c12
highlight LineNrAbove guifg   = #935116
highlight LineNrBelow guifg   = #935116
highlight CursorLine  guibg   = #100c08
]]
