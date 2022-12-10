local nnoremap = require("rwxd.keymap").nnoremap
local vnoremap = require("rwxd.keymap").vnoremap

nnoremap("<leader>pv", "<cmd>:Ex<CR>")

-- Markdown preview
nnoremap("<leader>m", "<cmd>:Glow<CR>")

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
