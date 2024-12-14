-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
map("n", "<leader>rr", "<cmd>lua require('kulala').run()<cr>", { desc = "Run Kulala request" })
map("n", "<leader>ra", "<cmd>lua require('kulala').run_all()<cr>", { desc = "Run Kulala all requests" })
-- map({ "<leader>rr", "<cmd>lua require('kulala').run()<cr>", desc = "Run Kulala request" })
-- map({ "<leader>ra", "<cmd>lua require('kulala').run_all()<cr>", desc = "Run Kulala all requests" })
