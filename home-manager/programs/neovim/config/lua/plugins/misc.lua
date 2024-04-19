return {
	{
		"mbbill/undotree",
	},
	{
		"ThePrimeagen/refactoring.nvim",
	},
	-- {
	-- 	"vim-test/vim-test",
	-- 	keys = {
	-- 		{ "<leader>tt", "<cmd>TestFile<CR>", desc = "Run all tests in the file" },
	-- 		{ "<leader>tn", "<cmd>TestNearest<CR>", desc = "Run the nearest test" },
	-- 		{ "<leader>tf", "<cmd>TestVisit<CR>", desc = "Visits the test file from which you last run your tests" },
	-- 		{ "<leader>ts", "<cmd>TestSuite<CR>", desc = "Run the whole test suite" },
	-- 		{ "<leader>tl", "<cmd>TestLast<CR>", desc = "Run the last test" },
	-- 	},
	-- },
	{
		"numToStr/Comment.nvim",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "<leader>ge", false }, -- deactivate git explorer shortcut
		},
	},
	{
		"laytan/cloak.nvim",
		config = function()
			require("cloak").setup()
		end,
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>ut", vim.cmd.UndotreeToggle },
		},
	},
}
