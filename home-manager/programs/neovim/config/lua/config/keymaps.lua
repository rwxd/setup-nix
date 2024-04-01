-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

-- Movement
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

-- File
map("n", "<leader>pv", "<cmd>:Ex<cr>", { desc = "Show file explorer" })
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable" })

-- Go
map("n", "<leader>ee", "oif err != nil {<CR>}<ESC>Oreturn err<ESC>", { desc = "Add golang err != nil" })
