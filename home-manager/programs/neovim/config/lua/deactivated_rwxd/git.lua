local nnoremap = require("rwxd.keymap").nnoremap

nnoremap("<leader>gfa", "<cmd>:Git fetch --all<CR>")
nnoremap("<leader>gfa", "<cmd>:Git fetch --all<CR>")

nnoremap("<leader>gruM", "<cmd>:Git rebase upstream/master<CR>")
nnoremap("<leader>grum", "<cmd>:Git rebase upstream/main<CR>")
nnoremap("<leader>groM", "<cmd>:Git rebase origin/master<CR>")
nnoremap("<leader>grom", "<cmd>:Git rebase origin/main<CR>")
nnoremap("<leader>grc", "<cmd>:Git rebase --continue<CR>")

nnoremap("<leader>gp", "<cmd>:Git pull<CR>")
nnoremap("<leader>gP", "<cmd>:Git push<CR>")

nnoremap("<leader>gd", "<cmd>:Gvdiffsplit!<CR>")
nnoremap("<leader>gl", "<cmd>:diffget //3<CR>")
nnoremap("<leader>gh", "<cmd>:diffget //2<CR>")

nnoremap("<leader>gs", "<cmd>:0G<CR>")
nnoremap("<leader>gv", "<cmd>:GV<CR>")

-- Gitsigns
-- See `:help gitsigns.txt`
require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "│" },
		untracked = { text = "┆" },
	},
})
