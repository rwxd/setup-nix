vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

return {
  {
  	"catppuccin/nvim", -- must be initialized before LazyVim
	lazy = true,
	name = "catppuccin",
	config = function()
        require("catppuccin").setup({
            transparent_background = true,
        })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    }
  },
}
