-- This is necessary for LSPs to "pick up" on .templ files.
vim.filetype.add({ extension = { templ = "templ" } })

return {
	{
		"hashivim/vim-terraform",
	},
	{
		"ray-x/go.nvim",
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = {
				enabled = true,
			},

			codelens = {
				enabled = true,
			},

			servers = {
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							codeLens = {
								enable = true,
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
				setup = {},
			},
		},
	},
}
