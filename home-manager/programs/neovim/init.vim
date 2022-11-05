syntax on

"
" plugins
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

call plug#begin('~/.vim/plugged')

" autocompletion in search
" Plug 'vim-scripts/SearchComplete'

" color
Plug 'junegunn/rainbow_parentheses.vim'

" theme
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

"" nord theme
Plug 'arcticicestudio/nord-vim'

" statusline plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" A Tree-like side bar for better navigation
Plug 'scrooloose/nerdtree'

" show bad whitespace in red
Plug 'ntpeters/vim-better-whitespace'

" indent tab blank
Plug 'lukas-reineke/indent-blankline.nvim'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'

Plug 'vim-test/vim-test'

" Auto-close braces and scopes
" Plug 'jiangmiao/auto-pairs'

" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'mfussenegger/nvim-dap-python'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
"Plug 'nvim-telescope/telescope-frecency.nvim'
"" for frecency
"Plug 'tami5/sqlite.lua'

"Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'

Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/refactoring.nvim'

Plug 'vimwiki/vimwiki'

Plug 'mbbill/undotree'

" git
Plug 'kdheepak/lazygit.nvim'

" comment
Plug 'numToStr/Comment.nvim'
Plug 'folke/todo-comments.nvim'

" markdown preview
"" pacman -S glow
"" :GlowInstall
Plug 'ellisonleao/glow.nvim'
Plug 'dhruvasagar/vim-table-mode'

" Terraform
Plug 'hashivim/vim-terraform'

" Prettier
Plug 'sbdchd/neoformat'

" Python
Plug 'psf/black', { 'branch': 'stable' }

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" LSP Stuff
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'onsails/lspkind-nvim'

" Coc
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}

call plug#end()

filetype plugin indent on

lua require("rwxd")

" colorscheme nord
let g:airline_theme='atomic'


" python neovim
" let g:python_host_prog = '~/.venvs/neovim2/bin/python'
" let g:python3_host_prog = '~/.venvs/neovim3/bin/python'

"" black
let g:black_skip_string_normalization = 1

" tab sizes
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType go setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType tf setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType terraform setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType nix setlocal ts=2 sts=2 sw=2 expandtab

" ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */site-*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */tasks/*.yml set filetype=yaml.ansible

nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

" keybindings
":let mapleader = "\<Space>"
map <SPACE> <Leader>

nnoremap <leader>pv :Ex<CR>

nnoremap <leader>u :UndotreeShow<CR>

" lazygit
" nnoremap <silent> <C-g> :LazyGit<CR>

" nerdtree
" map <C-n> :NERDTreeToggle<CR>
" let NERDTreeShowHidden=1 " Show hidden files in NerdTree buffer

" Split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" make file executable
nnoremap <leader>x :silent !chmod +x %<CR>

" move lines around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" make an empty line
xnoremap <leader>p "_dP

" glow
noremap <leader>m :Glow %<CR>

" Go to tab by number
noremap <M-1> 1gt
noremap <M-2> 2gt
noremap <M-3> 3gt
noremap <M-4> 4gt
noremap <M-5> 5gt
noremap <M-6> 6gt
noremap <M-7> 7gt
noremap <M-8> 8gt
noremap <M-9> 9gt
noremap <M-0> :tablast<cr>

" Quickly edit/reload this configuration file
nnoremap gev :edit $MYVIMRC<CR>
nnoremap gsv :source $MYVIMRC<CR>

" stop highlighting of search
nnoremap gsh :noh<CR>

" save as sudo
cnoremap sudow w !sudo tee % >/dev/null
