-- This is necessary for LSPs to "pick up" on .templ files.
vim.filetype.add({ extension = { templ = "templ" } })

local function check_nixos()
	local f = io.open("/etc/nixos/", "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local is_nixos = check_nixos()

return {
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
					mason = not is_nixos,
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
				ruff_lsp = {
					mason = not is_nixos,
				},
				rust_analyzer = {
					mason = not is_nixos,
				},
				phpactor = {
					mason = not is_nixos,
				},
				neocmake = {
					mason = not is_nixos,
				},
			},
			setup = {},
		},
	},
}
