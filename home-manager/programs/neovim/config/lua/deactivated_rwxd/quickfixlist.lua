local nnoremap = require("rwxd.keymap").nnoremap

nnoremap("<leader>K>", "<cmd>cnext<CR>zz");
nnoremap("<leader>J>", "<cmd>cprev<CR>zz");
nnoremap("<leader>k", "<cmd>lnext<CR>zz");
nnoremap("<leader>j", "<cmd>lprev<CR>zz");

nnoremap("<C-q>", "<cmd>:call ToggleQFList(1)<CR>");
nnoremap("<leader>q", "<cmd>:call ToggleQFList(0)<CR>");
