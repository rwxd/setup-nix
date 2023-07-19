
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

    end,
  },
}
