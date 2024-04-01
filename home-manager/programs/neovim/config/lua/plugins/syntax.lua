local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
vim.fn.mkdir(parser_install_dir, "p")
vim.opt.runtimepath:append(parser_install_dir)

-- function to get the absolute path to a command
-- needed for nixos, where we can't use the mason installed commands directly
local function get_cmd_path(cmd)
	local cmd_path = vim.fn.exepath(cmd)
	if cmd_path == "" then
		local home = os.getenv("HOME")
		return home .. "/.local/share/nvim/mason/" .. cmd
	end
	return cmd_path
end

return {
	{ -- highlighting
		"nvim-treesitter/nvim-treesitter",
		opts = {
			-- parser_install_dir = parser_install_dir,
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
				"go",
				"python",
				"php",
			},
		},
	},
	{ -- showing current context
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				throttle = true, -- Throttles plugin updates (may improve performance)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				show_all_context = true,
				patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
					default = {
						"class",
						"function",
						"method",
						"for",
						"while",
						"if",
						"switch",
						"case",
					},
				},
			})
		end,
	},
	{ -- play around with tokens found by treesitter
		"nvim-treesitter/playground",
		config = function()
			require("nvim-treesitter.configs").setup({
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "i",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<cr>",
						show_help = "?",
					},
				},
			})
		end,
	},
	{ -- linting
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				markdown = { "markdownlint" },
				terrafom = { "tflint" },
				dockerfile = { "hadolint" },
			},
		},
	},
	{ -- formatting
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				["python"] = { "ruff_fix", "ruff_format" },
				["lua"] = { "stylua" },
				["sh"] = { "shfmt" },
				["terraform"] = { "terraform_fmt" },
				["go"] = { "goimports", "gofmt" },
				["templ"] = { "templ" },
				["nix"] = { "nixfmt" },
			},
			formatters = {
				stylua = { command = get_cmd_path("stylua") },
			},
		},
	},
	-- rainbow parantheses
	{
		"luochen1990/rainbow",
	},
	-- indent tab blank
	{
		"lukas-reineke/indent-blankline.nvim",
	},
	-- show bad whitespace in red
	{
		"ntpeters/vim-better-whitespace",
	},
}
