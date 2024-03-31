return {
	{
		"catppuccin/nvim", -- must be initialized before LazyVim
		name = "catppuccin",
		opts = {
			flavour = "frappe",
			transparent_background = true,
		},
		-- config = function()
		-- 	require("catppuccin").setup({
		--               flavour = "frappe",
		-- 		transparent_background = true,
		--               default_integrations = true,
		-- 		integrations = {
		-- 			cmp = true,
		-- 			gitsigns = true,
		-- 			nvimtree = true,
		-- 			treesitter = true,
		-- 			notify = false,
		-- 			mini = {
		-- 				enabled = true,
		-- 				indentscope_color = "",
		-- 			},
		-- 		},
		-- 	})
		-- end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
