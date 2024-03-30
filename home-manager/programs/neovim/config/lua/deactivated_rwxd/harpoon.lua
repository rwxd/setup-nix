local nnoremap = require("rwxd.keymap").nnoremap

nnoremap("<leader>h", "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<CR>")
nnoremap("<leader>a", "<cmd>:lua require('harpoon.mark').add_file()<CR>")

nnoremap("<C-h>", "<cmd>:lua require('harpoon.ui').nav_file(1)<CR>")
nnoremap("<C-j>", "<cmd>:lua require('harpoon.ui').nav_file(2)<CR>")
nnoremap("<C-k>", "<cmd>:lua require('harpoon.ui').nav_file(3)<CR>")
nnoremap("<C-l>", "<cmd>:lua require('harpoon.ui').nav_file(4)<CR>")
nnoremap("<M-h>", "<cmd>:lua require('harpoon.ui').nav_file(5)<CR>")
nnoremap("<M-j>", "<cmd>:lua require('harpoon.ui').nav_file(6)<CR>")
nnoremap("<M-k>", "<cmd>:lua require('harpoon.ui').nav_file(7)<CR>")
nnoremap("<M-l>", "<cmd>:lua require('harpoon.ui').nav_file(8)<CR>")
