local nnoremap = require("rwxd.keymap").nnoremap

nnoremap("<leader>pcr", "<cmd>:!pre-commit run<CR>")
nnoremap("<leader>pca", "<cmd>:!pre-commit run --all-files<CR>")
