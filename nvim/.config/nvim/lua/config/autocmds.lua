-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.cmd([[highlight VertSplit guifg=#2e2e2e guibg=#2e2e2e]])
vim.cmd([[highlight WinSeparator guifg=#fff]])

-- keymap for request (postman functionality)
vim.api.nvim_create_augroup("http_bindings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "http",
    callback = function()
        print("make keybindings for rest")
        vim.keymap.set("n", "<space>rr", "<cmd>Rest run<cr>", { desc = "Rest run" })
        vim.keymap.set("n", "<space>rl", "<cmd>Rest last<cr>", { desc = "Rest last" })
    end,
    group = "http_bindings",
})
