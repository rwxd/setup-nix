return {
  {
    "lewis6991/gitsigns.nvim",
	config = function()
      require("gitsigns").setup({
		  signs = {
			add = { text = '+' },
			change = { text = '│' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '│' },
			untracked = { text = '┆' },
		  },
	  })
    end,
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "junegunn/gv.vim",
  },
  {
    "rhysd/git-messenger.vim",
  },
}
