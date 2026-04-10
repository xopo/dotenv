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

-- config for build-in undotree plugin
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'nvim-undotree',
    callback = function()
        vim.cmd.wincmd('H')
        vim.api.nvim_win_set_width(0, 40)
    end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = '*.env',
    callback = function() vim.diagnostic.enable(false) end,
})

vim.cmd('packadd cfilter')
-- vim.cmd([[echo "loading colorscheme"]])
-- vim.cmd([[colorscheme catppuccin]])

local timer = vim.loop.new_timer()
local blink = function()
    local cnt, blink_times = 0, 5

    timer:start(
        0,
        100,
        vim.schedule_wrap(function()
            vim.cmd('set cursorcolumn! cursorline!')

            cnt = cnt + 1
            if cnt == blink_times then timer:stop() end
        end)
    )
end

vim.api.nvim_create_augroup('buffer_highlight', { clear = true })

-- Define highlight namespaces
local ns_active = vim.api.nvim_create_namespace('active_buffer')
local ns_inactive = vim.api.nvim_create_namespace('inactive_buffer')
local ns_unfocused = vim.api.nvim_create_namespace('unfocused')

-- Set up highlight definitions
vim.api.nvim_set_hl(ns_active, 'Normal', { bg = '#111111' })
vim.api.nvim_set_hl(ns_inactive, 'Normal', { bg = '#333333' })
vim.api.nvim_set_hl(ns_unfocused, 'Normal', { bg = '#2c2c2c' }) -- Unfocused terminal: even lighter

-- Function to update all windows highlight based on the active buffer
-- local function update_highlight()
--     local current_win = vim.api.nvim_get_current_win()
--     for _, win_id in ipairs(vim.api.nvim_get_current_wins()) do
--         if win_id == current_win then
--             vim.api.nvim_win_set_hl_ns(win_id, ns_active)
--         else
--             vim.api.nvim_win_set_hl_ns(win_id, ns_inactive)
--         end
--     end
-- end

-- When entering a buffer or window, apply the active highlight
vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter', 'VimEnter', 'FocusGained' }, {
    group = 'buffer_highlight',
    callback = function()
        local win_id = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_hl_ns(win_id, ns_active)
        -- Optional: call your blink() function
        blink()
        -- vim.opt.number = true
        -- vim.opt.relativenumber = true
    end,
})

-- When leaving a buffer or window, apply the inactive highlight
vim.api.nvim_create_autocmd({ 'BufLeave', 'WinLeave', 'FocusLost' }, {
    group = 'buffer_highlight',
    callback = function()
        local win_id = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_hl_ns(win_id, ns_inactive)
        -- vim.opt.number = true
        -- vim.opt.relativenumber = false
    end,
})

vim.api.nvim_create_autocmd('BufLeave', {
    pattern = '*',
    callback = function()
        if vim.fn.bufname() ~= '' and vim.bo.modifiable then vim.cmd('silent update') end
    end,
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
