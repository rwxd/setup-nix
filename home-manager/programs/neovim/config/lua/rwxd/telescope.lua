local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

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
				hidden = true
			}
		},

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
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
	}
})

require("telescope").load_extension("fzf")
-- require("telescope").load_extension("frecency")
require("telescope").load_extension("file_browser")

local M = {}
M.search_dotfiles = function()
	require("telescope.builtin").git_files({
		prompt_title = "< dotfiles >",
		cwd = "~/.dotfiles/",
		hidden = true,
	})
end

M.search_wiki = function()
	require("telescope.builtin").live_grep({
		prompt_title = "< wiki >",
		cwd = "~/wiki/",
	})
end

M.git_branches = function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end

return M
