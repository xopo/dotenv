-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.number = true

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.env",
    callback = function()
        vim.diagnostic.enable(false)
    end,
})

vim.cmd("packadd cfilter")
-- vim.cmd([[echo "loading colorscheme"]])
vim.cmd([[colorscheme catppuccin]])

-- vim.api.nvim_create_augroup("focus_group", { clear = true })
--
-- vim.api.nvim_create_autocmd({ "InsertEnter", "BufEnter", "BufWinEnter", "WinEnter" }, {
--     callback = function()
--         vim.api.nvim_set_hl(0, "Normal", { bg = "#1c1c1c" })
--     end,
--     group = "focus_group",
-- })
-- vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "WinLeave" }, {
--     callback = function()
--         vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
--     end,
--     group = "focus_group",
-- })
