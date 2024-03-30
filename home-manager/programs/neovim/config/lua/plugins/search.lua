earch_dotfiles = function()
	require("telescope.builtin").git_files({
		prompt_title = "< dotfiles >",
		cwd = "~/.dotfiles/",
		hidden = true,
	})
end

search_wiki = function()
	require("telescope.builtin").live_grep({
		prompt_title = "< wiki >",
		cwd = "~/wiki/",
	})
end

git_branches = function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
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
			local pickers = require("telescope.pickers")
			local finders = require("telescope.finders")
			local previewers = require("telescope.previewers")
			local action_state = require("telescope.actions.state")
			local conf = require("telescope.config").values
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
				"<leader>fw",
				function()
					require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
				end,
				desc = "Telescope: Grep for word under cursor",
			},
			{
				"<leader>fv",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "Telescope: Grep",
			},
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
				"<C-S-p>",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "Telescope: Find commands and run them on enter",
			},
		},
	},
}
