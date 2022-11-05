require("nvim-lsp-installer").setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
})

local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]", nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-f>"] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. " " .. menu
				end
				vim_item.kind = ""
			end
			vim_item.menu = menu
			return vim_item
		end,
	},

	sources = {
		-- tabnine completion? yayaya

		-- { name = "cmp_tabnine" },

		{ name = "nvim_lsp" },

		-- For vsnip user.
		-- { name = 'vsnip' },

		-- For luasnip user.
		{ name = "luasnip" },

		-- For ultisnips user.
		-- { name = 'ultisnips' },

		{ name = "buffer" },
	},
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
			vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = 0 })
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { buffer = 0 })
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { buffer = 0 })
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { buffer = 0 })
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { buffer = 0 })
			vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = 0 })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
			vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
			vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
			vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", { buffer = 0 })
			vim.keymap.set("n", "<leader>dv", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = 0 })
		end,
	}, _config or {})
end

require("lspconfig").gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))

local snippets_paths = function()
	local plugins = { "friendly-snippets" }
	local paths = {}
	local path
	local root_path = vim.env.HOME .. "/.vim/plugged/"
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
		if vim.fn.isdirectory(path) ~= 0 then
			table.insert(paths, path)
		end
	end
	return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
	paths = snippets_paths(),
	include = nil, -- Load all languages
	exclude = {},
})

require("lspconfig").pyright.setup(config())
require("lspconfig").ansiblels.setup(config())
require("lspconfig").terraformls.setup(config())
require("lspconfig").rust_analyzer.setup(config({
	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
			completion = {
				autoimport = {
					enable = true,
				},
			},
		},
	}
}))
require("lspconfig").sumneko_lua.setup(config())
require("lspconfig").prosemd_lsp.setup(config())
require("lspconfig").jsonls.setup(config())
require("lspconfig").dockerls.setup(config())
require("lspconfig").cmake.setup(config())
require("lspconfig").intelephense.setup(config())
require("lspconfig").yamlls.setup(config())
-- require("lspconfig").powershell_es.setup(config())
require("lspconfig").svelte.setup(config())
require("lspconfig").tsserver.setup(config())
require("lspconfig").html.setup(config())
require("lspconfig").cssls.setup(config())
require("lspconfig").bashls.setup(config())
require("lspconfig").rnix.setup(config())
