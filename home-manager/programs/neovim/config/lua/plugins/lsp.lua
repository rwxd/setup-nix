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
		"b0o/SchemaStore.nvim", -- json schemas
		lazy = true,
		version = false, -- last release is way too old
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "ansible-lint" })
			vim.list_extend(opts.ensure_installed, { "hadolint" })
			vim.list_extend(opts.ensure_installed, { "helm-ls" })
			vim.list_extend(opts.ensure_installed, { "cmakelang", "cmakelint" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		init = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			-- change a keymap
			-- keys[#keys + 1] = { "K", "<cmd>echo 'hello'<cr>" }
			-- disable a keymap
			-- keys[#keys + 1] = { "K", false }
			-- add a keymap
			-- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
		end,
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
				gopls = {
					settings = {
						gopls = {
							gofumpt = true,
							codelenses = {
								gc_details = false,
								generate = true,
								regenerate_cgo = true,
								run_govulncheck = true,
								test = true,
								tidy = true,
								upgrade_dependency = true,
								vendor = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							analyses = {
								fieldalignment = true,
								nilness = true,
								unusedparams = true,
								unusedwrite = true,
								useany = true,
							},
							usePlaceholders = true,
							completeUnimported = true,
							staticcheck = true,
							directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
							semanticTokens = true,
						},
					},
				},
				pyright = {
					enabled = lsp == "pyright",
				},
				basedpyright = {
					enabled = lsp == "basedpyright",
				},
				ruff_lsp = {
					keys = {
						{
							"<leader>co",
							function()
								vim.lsp.buf.code_action({
									apply = true,
									context = {
										only = { "source.organizeImports" },
										diagnostics = {},
									},
								})
							end,
							desc = "Organize Imports",
						},
					},
				},
				ansiblels = {},
				dockerls = {},
				docker_compose_language_service = {},
				yamlls = {},
				helm_ls = {},
				jsonls = {
					-- lazy-load schemastore when needed
					on_new_config = function(new_config)
						new_config.settings.json.schemas = new_config.settings.json.schemas or {}
						vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
					end,
					settings = {
						json = {
							format = {
								enable = true,
							},
							validate = { enable = true },
						},
					},
				},
				rust_analyzer = {},
				terraformls = {},
				tailwindcss = {
					-- exclude a filetype from the default_config
					filetypes_exclude = { "markdown" },
					-- add additional filetypes to the default_config
					filetypes_include = {},
					-- to fully override the default_config, change the below
					-- filetypes = {}
				},
			},
			setup = {
				ruff_lsp = function()
					LazyVim.lsp.on_attach(function(client, _)
						if client.name == "ruff_lsp" then
							-- Disable hover in favor of Pyright
							client.server_capabilities.hoverProvider = false
						end
					end)
				end,
				rust_analyzer = function()
					return true
				end,
				tailwindcss = function(_, opts)
					local tw = require("lspconfig.server_configurations.tailwindcss")
					opts.filetypes = opts.filetypes or {}

					-- Add default filetypes
					vim.list_extend(opts.filetypes, tw.default_config.filetypes)

					-- Remove excluded filetypes
					--- @param ft string
					opts.filetypes = vim.tbl_filter(function(ft)
						return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
					end, opts.filetypes)

					-- Add additional filetypes
					vim.list_extend(opts.filetypes, opts.filetypes_include or {})
				end,
			},
		},
	},
}
