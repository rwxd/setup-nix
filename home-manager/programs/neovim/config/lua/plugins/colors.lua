vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

return {
  {
  	"catppuccin/nvim",
	lazy = true,
	name = "catppuccin",
	config = function()
        require("catppuccin").setup({
            transparent_background = true,
        })
    end,
  },
  -- rainbow parantheses
  {
    "luochen1990/rainbow",
  },
  -- show bad whitespace in red
  {
    "ntpeters/vim-better-whitespace",
  },
}
