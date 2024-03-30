local nnoremap = require("rwxd.keymap").nnoremap

nnoremap("<leader>rt", "<cmd>:TestNearest<CR>");
nnoremap("<leader>rf", "<cmd>:TestFile<CR>");
nnoremap("<leader>ra", "<cmd>:TestSuite<CR>");
nnoremap("<leader>rl", "<cmd>:TestLast<CR>");
nnoremap("<leader>rv", "<cmd>:TestVisit<CR>");
