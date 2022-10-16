"set term=cons25"

syntax on
set autoindent

set mouse=a

" Don't wrap text
set nowrap

set termguicolors

" Show line number
set number
set relativenumber

set tabstop=4

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab


"""""""""""""""
"""" PLUGIN
"""""""""""""""

" Install vim-plug if it doesn't installed yet
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins, use :PlugInstall, :PlugUpdate, :PlugClean, :PlugUpgrade, or :PlugStatus
call plug#begin('~/.vim/plugged')
" Color Scheme
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf'
call plug#end()

colorscheme nord
