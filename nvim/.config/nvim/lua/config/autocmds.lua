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
vim.api.nvim_create_augroup('http_bindings', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'http',
    callback = function()
        print('make keybindings for rest')
        vim.keymap.set('n', '<space>rr', '<cmd>Rest run<cr>', { desc = 'Rest run' })
        vim.keymap.set('n', '<space>rl', '<cmd>Rest last<cr>', { desc = 'Rest last' })
    end,
    group = 'http_bindings',
})

-- autosave on lost focus
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost' }, {
    callback = function()
        if vim.bo.modified and not vim.bo.readonly and vim.fn.expand('%') ~= '' then vim.cmd('silent write') end
    end,
})

-- disable diagnostic on .env files
local group = vim.api.nvim_create_augroup('__env', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '.env',
    group = group,
    callback = function() vim.diagnostic.enable(false) end,
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost' }, {
    pattern = '.env',
    group = group,
    callback = function() vim.diagnostic.enable(true) end,
})

-- vim.api.nvim_create_augroup("focus_group", { clear = true })
--
-- vim.api.nvim_create_autocmd({ "InsertEnter", "BufEnter", "BufWinEnter", "WinEnter" }, {
--     callback = function()
--         vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
--     end,
--     group = "focus_group",
-- })
-- vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "WinLeave" }, {
--     callback = function()
--         vim.api.nvim_set_hl(0, "Normal", { bg = "#1c1c1c" })
--     end,
--     group = "focus_group",
-- })

-- /*
-- vim.cmd([[echo "hello colorscheme"]])
-- vim.cmd([[colorscheme catppuccin-macchiato]])
-- vim.cmd([[
--   " Transparent background by default
--   autocmd VimEnter * highlight Normal ctermbg=none guibg=none
--
--   " Change background to red when switching between windows (splits)
--   augroup change_bg_on_split
--     autocmd!
--     autocmd WinEnter * highlight Normal ctermbg=red guibg=#1b212c
--     autocmd WinLeave * highlight Normal ctermbg=none guibg=none
--   augroup END
--
--   " Change background to blue in insert mode
--   autocmd InsertEnter * highlight Normal ctermbg=blue guibg=#191b20
--   autocmd InsertLeave * highlight Normal ctermbg=none guibg=none
-- ]])
-- */

-- hi DimNormal guibg=#1b212c
-- hi DimConsole guifg=#d8dee9 guibg=#1b212c
--
-- function! DimWindow()
--   if getwinvar(winnr(), '&diff')==1
--     return
--   endif
--   if getwininfo(win_getid())[0].terminal==1
--     setlocal wincolor=DimConsole
--   else
--     setlocal wincolor=DimNormal
--   endif
-- endfunction
--
-- augroup ActiveWin | au!
--   au WinEnter,BufEnter,BufWinEnter * setlocal wincolor=
--   au WinLeave,BufLeave * call DimWindow()
-- augroup
