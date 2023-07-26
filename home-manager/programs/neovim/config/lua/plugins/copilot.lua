return {
  {
    "zbirenbaum/copilot.lua",
	config = function()
	  require("copilot").setup({
	    suggestion = {
	    	enabled = true,
	    	auto_trigger = true,
	    	debounce = 75,
	    	keymap = {
	    		jump_prev = "<M-n>",
	    		jump_next = "<M-m>",
	    		dismiss = "<C-CR>",
	    		accept = "<M-l>",
	    		accept_word = false,
	    		accept_line = false,
	    	},
	    },
	    filetypes = {
	    	yaml = true,
	    	markdown = true,
	    	help = true,
	    	gitcommit = true,
	    	gitrebase = true,
	    	hgcommit = true,
	    	svn = true,
	    	cvs = true,
	    	["."] = true,
	    },
	    copilot_node_command = vim.g.copilot_node_command,
	  })
	end,
  },
}
