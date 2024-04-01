-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

-- File
vim.keymap.set("n", "<leader>pv", "<cmd>:Ex<cr>", { desc = "Show file explorer" })

-- Go
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<ESC>Oreturn err<ESC>", { desc = "Add golang err != nil" })
