local nnoremap = require("rwxd.keymap").nnoremap
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

nnoremap("<leader>ff", function()
	require('telescope.builtin').find_files({ no_ignore = true, hidden = true })
end)

nnoremap("<leader>fs", function()
	require('telescope.builtin').live_grep()
end)

nnoremap("<leader>fb", function()
	require('telescope.builtin').buffers()
end)

nnoremap("<leader>fh", function()
	require('telescope.builtin').help_tags()
end)

nnoremap("<leader>fs", function()
	require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)

nnoremap("<C-p>", function()
	require('telescope.builtin').git_files({ show_untracked = true })
end)

nnoremap("<leader>fgb", function()
	require('telescope.builtin').git_branches()
end)

nnoremap("<leader>fgcc", function()
	require('telescope.builtin').git_commits()
end)

nnoremap("<leader>fgcb", function()
	require('telescope.builtin').git_bcommits()
end)

nnoremap("<leader>fgs", function()
	require('telescope.builtin').git_stash()
end)

nnoremap("<leader>gi", function()
	require('telescope.builtin').git_status()
end)

nnoremap("<leader>fv", function()
	require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)

nnoremap("<leader>vh", function()
	require('telescope.builtin').help_tags()
end)

nnoremap("<leader>fd", function()
	M.search_dotfiles()
end)

nnoremap("<leader>fw", function()
	M.search_wiki()
end)

nnoremap("<leader>fp", function()
	require('telescope.builtin').extensions.file_browser.file_browser({ hidden = true })
end)

nnoremap("<leader>fo", function()
	require('telescope.builtin').extensions.frecency.frecency({})
end)

return M
