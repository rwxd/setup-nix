nnoremap <leader>ff :lua require('telescope.builtin').find_files({ no_ignore = true, hidden = true })<CR>
nnoremap <leader>fv <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

nnoremap <C-p> :lua require('telescope.builtin').git_files({ show_untracked = true })<CR>
nnoremap <leader>fgb :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>fgcc :lua require('telescope.builtin').git_commits()<CR>
nnoremap <leader>fgcb :lua require('telescope.builtin').git_bcommits()<CR>
nnoremap <leader>fgs :lua require('telescope.builtin').git_stash()<CR>
nnoremap <leader>gi :lua require('telescope.builtin').git_status()<CR>

nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fd :lua require('rwxd.telescope').search_dotfiles()<CR>
nnoremap <leader>fW :lua require('rwxd.telescope').search_wiki()<CR>

nnoremap <leader>fp :lua require('telescope').extensions.file_browser.file_browser({ hidden = true })<CR>

nnoremap <leader>fo :lua require('telescope').extensions.frecency.frecency({})<CR>
