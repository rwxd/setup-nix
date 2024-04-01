return {
	{
		"catppuccin/nvim", -- must be initialized before LazyVim
		name = "catppuccin",
		opts = {
			flavour = "frappe",
			transparent_background = true,
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
