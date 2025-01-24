-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- cnext ancprev change on quicklist
map("n", "˚", "<cmd>cprev<CR>", { desc = "prev quick list element" })
map("n", "∆", "<cmd>cnext<CR>", { desc = "next quick list element" })
map("n", "[c", "<cmd>cprev<CR>", { desc = "prev quick list element" })
map("n", "]c", "<cmd>cnext<CR>", { desc = "next quick list element" })

-- resource for lua stuff
map("n", "<space><space>x", "<cmd>source %<CR>")

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
