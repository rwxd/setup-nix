local nnoremap = require("rwxd.keymap").nnoremap

nnoremap("<leader>",  "<cmd>:!pre-commit run<CR>");
nnoremap("<leader>", "<cmd>:!pre-commit run --all-files<CR>");
