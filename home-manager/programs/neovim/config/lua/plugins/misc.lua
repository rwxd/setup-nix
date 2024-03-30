vim.g.rainbow_active = 1

return {
  {
    "mbbill/undotree",
  },
  {
    "ThePrimeagen/refactoring.nvim",
  },
  -- indent tab blank
  {
    "lukas-reineke/indent-blankline.nvim",
  },
  -- Easy test shortcuts
  {
    "vim-test/vim-test",
    keys = {
        {"<leader>tt", "<cmd>TestFile<CR>", desc = "Run all tests in the file"},
        {"<leader>tn", "<cmd>TestNearest<CR>", desc = "Run the nearest test"},
        {"<leader>tf", "<cmd>TestVisit<CR>", desc = "Visits the test file from which you last run your tests"},
        {"<leader>ts", "<cmd>TestSuite<CR>", desc = "Run the whole test suite"},
        {"<leader>tl", "<cmd>TestLast<CR>", desc = "Run the last test"},
    },
  },
  {
    "numToStr/Comment.nvim",
  },
  {
    "folke/todo-comments.nvim",
  },
  -- rainbow parantheses
  {
    "luochen1990/rainbow",
  },
  -- show bad whitespace in red
  {
    "ntpeters/vim-better-whitespace",
  },
}
