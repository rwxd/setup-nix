local copilot_enabled = os.getenv("NEOVIM_COPILOT_ENABLED")
local copilot_auto_trigger = os.getenv("NEOVIM_COPILOT_AUTO_TRIGGER")

if copilot_auto_trigger == nil then
    copilot_auto_trigger = false
else
    copilot_auto_trigger = true
end

return {
  {
    "zbirenbaum/copilot.lua",
	config = function()
	  require("copilot").setup({
	    suggestion = {
	    	enabled = true,
	    	auto_trigger = copilot_auto_trigger,
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
      if copilot_enabled == nil then
        vim.cmd([[Copilot disable]])
      end
	end,
    init = function()
    end,
  },
}
