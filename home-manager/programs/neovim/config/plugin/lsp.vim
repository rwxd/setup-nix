autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
nnoremap glr <cmd>LspRestart<cr>
nnoremap gls <cmd>LspStop<cr>
nnoremap glS <cmd>LspStart<cr>
nnoremap gli <cmd>LspInfo<cr>
