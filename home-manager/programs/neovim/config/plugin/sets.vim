set autoindent
set nowrap
set mouse=a
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set scrolloff=8
set colorcolumn=100
set noswapfile
set nobackup
set nohlsearch

" statusline
set laststatus=3

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
"
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=750

" Give more space for displaying messages.
set cmdheight=1

set termguicolors
