"Line Numbers
set relativenumber
set number

"Tabs & Indentation
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smartindent

"Line Wrapping
set nowrap
        
"Search Settings
set hlsearch
set incsearch
"set ignorecase = false
set smartcase

"Cursor Line
set cursorline

"Backspace
set backspace =indent,eol,start

"Clipboard
set clipboard=unnamed,unnamedplus

"Consider - as part of keyword
"set iskeyword:append("-")

"Folding
set foldlevel=20
"set foldmethod = "expr"
set foldexpr = "nvim_treesitter#foldexpr()" ; Utilize Treesitter folds

"Performance
set updatetime=50
