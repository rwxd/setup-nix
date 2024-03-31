local env_copilot_enabled = os.getenv("NEOVIM_COPILOT_ENABLED")
local env_copilot_auto_trigger = os.getenv("NEOVIM_COPILOT_AUTO_TRIGGER")

return {
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = env_copilot_auto_trigger,
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
			if env_copilot_enabled == nil then
				vim.cmd([[Copilot disable]])
			end
		end,
		init = function() end,
		keys = {
			{ "<M-m>", "<cmd>:Copilot suggestion next<CR>", mode = { "i" }, desc = "Next copilot suggestion" },
			{ "<M-n>", "<cmd>:Copilot suggestion prev<CR>", mode = { "i" }, desc = "Previous copilot suggestion" },
			{ "<M-,>", "<cmd>:Copilot disable<CR>", mode = { "i", "n" }, desc = "Disable Copilot" },
			{ "<M-.>", "<cmd>:Copilot enable<CR>", mode = { "i", "n" }, desc = "Enable Copilot" },
		},
	},
}
