-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
-- Donagh on 2025-04-22

local map = vim.keymap.set

--esc
map("i", "jk", "<esc>", { desc = "To normal mode" })

-- Long dash 
map("i", "lh", "—", { desc = "type — "})

map("n", "z;", "za", { desc = "Toggle folds like emacs & vim" })
