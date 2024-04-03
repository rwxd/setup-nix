local search_wiki = function()
	require("telescope.builtin").live_grep({
		prompt_title = "Search in wiki",
		cwd = "~/wiki/",
	})
end

local getVisualSelection = function()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg("v")
	vim.fn.setreg("v", {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ""
	end
end

return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		config = function()
			local actions = require("telescope.actions")

			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")

			require("telescope").setup({
				defaults = {
					file_sorter = require("telescope.sorters").get_fzy_sorter,
					prompt_prefix = " >",
					color_devicons = true,

					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

					pickers = {
						find_files = {
							hidden = true,
						},
					},

					mappings = {
						i = {
							["<C-x>"] = false,
							["<C-q>"] = actions.send_to_qflist,
							-- shows the mappings for the current picker
							["<C-h>"] = "which_key",
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sort = true,
						override_file_sorter = true,
						case_mode = "ignore_case",
					},
				},
			})
		end,
		keys = {
			-- collides with vim fugitive
			{ "<leader>gs", false },
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files({ no_ignore = true, hidden = true })
				end,
				desc = "Telescope: Find files",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Telescope: Find buffers",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Telescope: Find help tags",
			},
			{
				"<leader>fs",
				function()
					require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ") })
				end,
				desc = "Telescope: Grep string in files",
			},
			{
				"<C-p>",
				function()
					require("telescope.builtin").git_files({ show_untracked = true })
				end,
				desc = "Telescope: Find git files",
			},
			{
				"<leader>fgb",
				function()
					require("telescope.builtin").git_branches()
				end,
				desc = "Telescope: Find git branches",
			},
			{
				"<leader>fgcc",
				function()
					require("telescope.builtin").git_commits()
				end,
				desc = "Telescope: Find git commits",
			},
			{
				"<leader>fgcb",
				function()
					require("telescope.builtin").git_bcommits()
				end,
				desc = "Telescope: Find git bcommits",
			},
			{
				"<leader>fgs",
				function()
					require("telescope.builtin").git_stash()
				end,
				desc = "Telescope: Find stashed git changes",
			},
			{
				"<leader>fv",
				function()
					require("telescope.builtin").live_grep()
				end,
				mode = { "n" },
				desc = "Telescope: Grep",
			},
			{

				"<leader>fv",
				function()
					require("telescope.builtin").live_grep({ default_text = getVisualSelection() })
				end,
				mode = { "v" },
				desc = "Telescope: Grep for selection",
			{
				"<leader>fW",
				function()
					search_wiki()
				end,
				desc = "Telescope: Find in wiki",
			},
			{
				"<leader>fk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Telescope: Find keymappings",
			},
			{
				"<leader>fl",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Telescope: List the results of the last search (previous telescope picker)",
			},
			{
				"<leader>fI",
				function()
					require("telescope.builtin").lsp_document_symbols()
				end,
				desc = "Telescope: Lists LSP document symbols in the current buffer",
			},
			{
				"<leader>fi",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols()
				end,
				desc = "Telescope: Dynamically Lists LSP for all workspace symbols",
			},
			{
				"<C-S-p>",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "Telescope: Find commands and run them on enter",
			},
		},
	},
}
