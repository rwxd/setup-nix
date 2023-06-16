local nnoremap = require("rwxd.keymap").nnoremap
local vnoremap = require("rwxd.keymap").vnoremap
local inoremap = require("rwxd.keymap").inoremap

nnoremap("<leader>gg", "<cmd>ChatGPT<CR>")

nnoremap("<leader>go", "<cmd>ChatGPTRun optimize_code<CR>")
vnoremap("<leader>go", "<cmd>ChatGPTRun optimize_code<CR>")

nnoremap("<leader>gh", "<cmd>ChatGPTRun explain_code<CR>")
vnoremap("<leader>gh", "<cmd>ChatGPTRun explain_code<CR>")

nnoremap("<leader>ge", "<cmd>ChatGPTEditWithInstructions<CR>")
vnoremap("<leader>ge", "<cmd>ChatGPTEditWithInstructions<CR>")

nnoremap("<leader>gc", "<cmd>ChatGPTCompleteCode<CR>")
vnoremap("<leader>gc", "<cmd>ChatGPTCompleteCode<CR>")

nnoremap("<leader>ga", "<cmd>ChatGPTActAs<CR>")
vnoremap("<leader>ga", "<cmd>ChatGPTActAs<CR>")

nnoremap("<leader>gf", "<cmd>ChatGPTRun fix_bugs<CR>")
vnoremap("<leader>gf", "<cmd>ChatGPTRun fix_bugs<CR>")
