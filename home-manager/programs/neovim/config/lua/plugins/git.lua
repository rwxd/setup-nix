vim.g.git_messenger_always_into_popup = true;

-- pre-commit
local api = vim.api
local function run_pre_commit(all)
    local command = "pre-commit run"
    if all then
        command = command .. " --all"
    end
    local output = vim.fn.systemlist(command)

    -- Create or clear the buffer
    local bufnr = api.nvim_call_function('bufnr', {'pre-commit'})
    if bufnr == -1 then
        bufnr = api.nvim_create_buf(false, true)
    else
        api.nvim_buf_delete(bufnr, {force = true})
        bufnr = api.nvim_create_buf(false, true)
    end

    -- Set buffer options
    api.nvim_buf_set_name(bufnr, "pre-commit")
    api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')
    api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
    api.nvim_buf_set_option(bufnr, 'modifiable', true)

    -- Insert output into buffer
    api.nvim_buf_set_lines(bufnr, 0, -1, false, output)

    -- Open buffer in a split
    api.nvim_command('split')
    api.nvim_command('buffer ' .. bufnr)
end

-- Function to run pre-commit without --all
function RunPreCommit()
    run_pre_commit(false)
end

-- Function to run pre-commit with --all
function RunPreCommitAll()
    run_pre_commit(true)
end

vim.keymap.set("n", "<leader>pcr", function()
    RunPreCommit()
end, { desc = "Pre-commit: run" })
vim.keymap.set("n", "<leader>pca", function()
    RunPreCommitAll()
end, { desc = "Pre-commit: run on all files" })

return {
  {
    "lewis6991/gitsigns.nvim",
	config = function()
      require("gitsigns").setup({
		  signs = {
			add = { text = '+' },
			change = { text = '│' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '│' },
			untracked = { text = '┆' },
		  },
	  })
    end,
  },
  {
    "tpope/vim-fugitive",
    keys = {
        {"<leader>gfa", "<cmd>Git fetch --all<CR>", desc = "Git: fetch --all"},
        {"<leader>gruM", "<cmd>Git rebase upstream/master<CR>", desc = "Git: rebase upstream master"},
        {"<leader>grum", "<cmd>Git rebase upstream/main<CR>", desc = "Git. rebase upstream main"},
        {"<leader>groM", "<cmd>Git rebase origin/master<CR>", desc = "Git: rebase origin master"},
        {"<leader>grom", "<cmd>Git rebase origin/main<CR>", desc = "Git: rebase origin main"},
        {"<leader>grc", "<cmd>Git rebase --continue<CR>", desc = "Git: rebase continue"},
        {"<leader>gp", "<cmd>Git pull<CR>", desc = "Git: pull"},
        {"<leader>gP", "<cmd>Git push<CR>", desc = "Git: push"},
        {"<leader>gd", "<cmd>Gvdiffsplit!<CR>", desc = "Git: diff with 3 windows"},
        {"<leader>gh", "<cmd>diffget //2<CR>", desc = "GitFugitive: diff choose left buffer"},
        {"<leader>gl", "<cmd>diffget //3<CR>", desc = "GitFugitive: diff choose right buffer"},
        {"<leader>gs", "<cmd>0G<CR>", desc = "GitFugitive: Show window"},
        {"<leader>gv", "<cmd>GV<CR>", desc = "GitFugitive: Show change log"},
    },
  },
  {
    "junegunn/gv.vim",
  },
  {
    "rhysd/git-messenger.vim",
    keys = {
        {"<leader>gm", "<cmd>GitMessenger<CR>", desc = "GitMessenger: Show last commit message (blame)"},
    },
  },
}
