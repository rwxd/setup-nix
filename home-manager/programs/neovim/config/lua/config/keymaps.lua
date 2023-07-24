-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

nmap = bind("n", {noremap = false})
nnoremap = bind("n")
vnoremap = bind("v")
xnoremap = bind("x")
inoremap = bind("i")

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Vim Fugitive
map("n", "<leader>gfa", "<cmd>:Git fetch --all<cr>", { desc = "Git fetch --all" })
map("n", "<leader>gruM", "<cmd>:Git rebase upstream/master<cr>", { desc = "Git rebase upstream master" })
map("n", "<leader>grum", "<cmd>:Git rebase upstream/main<cr>", { desc = "Git rebase upstream main" })
map("n", "<leader>groM", "<cmd>:Git rebase origin/master<cr>", { desc = "Git rebase origin master" })
map("n", "<leader>grom", "<cmd>:Git rebase origin/main<cr>", { desc = "Git rebase origin main" })
map("n", "<leader>grc", "<cmd>:Git rebase --continue<cr>", { desc = "Git rebase continue" })
map("n", "<leader>gp", "<cmd>:Git pull<cr>", { desc = "Git pull" })
map("n", "<leader>gP", "<cmd>:Git push<cr>", { desc = "Git push" })
map("n", "<leader>gd", "<cmd>:Gvdiffsplit!<cr>", { desc = "Git diff with 3 windows" })
map("n", "<leader>gl", "<cmd>:diffget //2<cr>", { desc = "Git diff choose left buffer" })
map("n", "<leader>gl", "<cmd>:diffget //3<cr>", { desc = "Git diff choose right buffer" })
map("n", "<leader>gs", "<cmd>:0G<cr>", { desc = "Show Git fugitive window" })
map("n", "<leader>gv", "<cmd>:GV<cr>", { desc = "Git change log" })

-- ChatGPT
map("n", "<leader>cc", "<cmd>ChatGPT<cr>", { desc = "ChatGPT Interaction" })
map("v", "<leader>cc", "<cmd>ChatGPT<cr>", { desc = "ChatGPT Interaction" })
map("v", "<leader>co", "<cmd>ChatGPTRun optimize_code<cr>", { desc = "ChatGPT optimize code" })
map("v", "<leader>ch", "<cmd>ChatGPTRun explain_code<cr>", { desc = "ChatGPT explain code" })
map("v", "<leader>ce", "<cmd>ChatGPTEditWithInstructions<cr>", { desc = "ChatGPT edit with instructions" })
map("v", "<leader>ca", "<cmd>ChatGPTActAs<cr>", { desc = "ChatGPT act as" })
map("v", "<leader>cb", "<cmd>ChatGPTRun fix_bugs<cr>", { desc = "ChatGPT fix bugs" })

-- Harpoon
map("n", "<leader>h", "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Show harpoon" })
map("n", "<leader>a", "<cmd>:lua require('harpoon.mark').add_file()<cr>", { desc = "Add current file to harpoon" })
map("n", "<C-h>", "<cmd>:lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Navigate to file 1" })
map("n", "<C-j>", "<cmd>:lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Navigate to file 2" })
map("n", "<C-k>", "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Navigate to file 3" })
map("n", "<C-l>", "<cmd>:lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Navigate to file 4" })
map("n", "<M-h>", "<cmd>:lua require('harpoon.ui').nav_file(5)<cr>", { desc = "Navigate to file 5" })
map("n", "<M-j>", "<cmd>:lua require('harpoon.ui').nav_file(6)<cr>", { desc = "Navigate to file 6" })
map("n", "<M-k>", "<cmd>:lua require('harpoon.ui').nav_file(7)<cr>", { desc = "Navigate to file 7" })
map("n", "<M-l>", "<cmd>:lua require('harpoon.ui').nav_file(8)<cr>", { desc = "Navigate to file 8" })

-- Misc
map("n", "<leader>pv", "<cmd>:Ex<cr>", { desc = "Show file explorer" })
map("n", "<leader>m", "<cmd>:Glow<cr>", { desc = "Render Markdown file" })


map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable" })

-- pre-commit
map("n", "<leader>pcr", "<cmd>:!pre-commit run<CR>", { desc = "Run pre-commit" })
map("n", "<leader>pca", "<cmd>:!pre-commit run --all-files<CR>", { desc = "Run pre-commit on all files" })

-- quickfix list
map("n", "<leader>K>", "<cmd>cnext<CR>zz", { desc = "Go to the next quickfix item and center it" })
map("n", "<leader>J>", "<cmd>cprev<CR>zz", { desc = "Go to the previous quickfix item and center it" })
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Go to the next location list item and center it" })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Go to the previous location list item and center it" })

map("n", "<C-q>", "<cmd>:call ToggleQFList(1)<CR>", { desc = "Toggle QuickFix List with 1" })
map("n", "<leader>q", "<cmd>:call ToggleQFList(0)<CR>", { desc = "Toggle QuickFix List with 0" })

-- vim-test
map("n", "<leader>rt", "<cmd>:TestNearest<CR>", { desc = "Run nearest test" })
map("n", "<leader>rf", "<cmd>:TestFile<CR>", { desc = "Run file tests" })
map("n", "<leader>ra", "<cmd>:TestSuite<CR>", { desc = "Run test suite" })
map("n", "<leader>rl", "<cmd>:TestLast<CR>", { desc = "Run last test" })
map("n", "<leader>rv", "<cmd>:TestVisit<CR>", { desc = "Visit test" })

-- Telescope

search_dotfiles = function()
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

nnoremap("<leader>ff", function()
	require('telescope.builtin').find_files({ no_ignore = true, hidden = true })
end)

nnoremap("<leader>fv", function()
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

nnoremap("<leader>fw", function()
	require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)

nnoremap("<leader>vh", function()
	require('telescope.builtin').help_tags()
end)

nnoremap("<leader>fW", function()
	search_wiki()
end)

nnoremap("<leader>fp", function()
	require('telescope.builtin').extensions.file_browser.file_browser({ hidden = true })
end)

nnoremap("<leader>fo", function()
	require('telescope.builtin').extensions.frecency.frecency({})
end)

