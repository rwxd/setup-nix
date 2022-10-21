vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
	transparent_background = false,
	-- dim_inactive = {
	-- 	enabled = false,
	-- 	shade = "dark",
	-- 	percentage = 0.15,
	-- },
})

vim.cmd [[colorscheme catppuccin]]
