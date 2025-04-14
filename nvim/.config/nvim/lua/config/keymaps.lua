-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- map Q to record macro instead of q
-- vim.api.nvim_set_keymap("n", "q", "<nop>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "Q", "q", { noremap = true, silent = true })
-- map jj to exit insert mode
map("i", "jj", "<esc>")

-- map move keys and center
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-f>", "<C-f>zz")
map("n", "<C-b>", "<C-b>zz")

-- Oil speed shortcut
-- map("n", "-", "<CMD>Yazi<CR>", { desc = "Open parent directory" })
map("n", "<space>jsl", "<cmd>:.! jq .<cr>", { desc = "json inline prettyfy" })
map("n", "<space>jsb", "<cmd>:'<,'>! jq .<cr>", { desc = "json block prettyfy" })
map("n", "<space>jsf", "<cmd>:%! jq .<cr>", { desc = "json file prettyfy" })

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
