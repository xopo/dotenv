-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- map Q to record macro instead of q
vim.api.nvim_set_keymap("n", "q", "<nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "Q", "q", { noremap = true, silent = true })

-- Oil speed shortcut
-- map("n", "-", "<CMD>Yazi<CR>", { desc = "Open parent directory" })

-- file editor default open shortcut set to Yazi
map("n", "<space>fe", "<CMD>Yazi<CR>")

-- undotree
map("n", "<space>U", ":UndotreeToggle<CR>", { desc = "toggle undo tree" })

map("n", "<space>w", function()
    vim.cmd("w")
    vim.cmd("source %")
end, { desc = "save and source file" })

map("n", "<space>gwwc", ":GitWorktreeCreate<CR>", { desc = "Worktree Create" })
map("n", "<space>gwws", ":GitWorktreeSwitch<CR>", { desc = "Worktree Switch" })
