" let g:coc_global_extensions = [
"             \ 'coc-pyright',
"             \ 'coc-prettier',
"             \ 'coc-git',
"             \ 'coc-json',
"             \ 'coc-docker',
"             \ 'coc-yaml',
"             \ 'coc-html',
"             \ 'coc-sh',
"             \ 'coc-go',
"             \ '@yaegassy/coc-ansible',
"             \ ]
"
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
"
" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction
"
" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
"
" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <C-space> coc#refresh()
" """ vim
" inoremap <silent><expr> <C-@> coc#refresh()
" """ in case Nul is send
" inoremap <silent><expr> <Nul> coc#refresh()
"
" inoremap <silent><expr> <C-f> coc#refresh()
"
" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Remap for rename current word
" nmap <F2> <Plug>(coc-rename)
" nmap <leader>rn <Plug>(coc-rename)
"
" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')
"
" " golang
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" command! -nargs=0 OR :silent call CocAction('runCommand', 'editor.action.organizeImport')
