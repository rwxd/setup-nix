local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
vim.fn.mkdir(parser_install_dir, "p")
vim.opt.runtimepath:append(parser_install_dir)

vim.g.rainbow_active = 1

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

vim.api.nvim_create_user_command("AutoformatDisable", function()
	vim.g.autoformat = false
end, { bang = true, desc = "Disable autoformatting" })

vim.api.nvim_create_user_command("AutoformatEnable", function()
	vim.g.autoformat = true
end, { bang = true, desc = "Enable autoformatting" })

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
		keys = {
			{ "<leader>ut", false },
		},
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
				["html"] = { "djlint" },
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
