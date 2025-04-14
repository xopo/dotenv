-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.mouse = "a"

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.env",
    callback = function()
        vim.diagnostic.enable(false)
    end,
})

vim.cmd("packadd cfilter")
-- vim.cmd([[echo "loading colorscheme"]])
-- vim.cmd([[colorscheme catppuccin]])
vim.cmd([[colorscheme vscode]])

local timer = vim.loop.new_timer()
local blink = function()
    local cnt, blink_times = 0, 5

    timer:start(
        0,
        100,
        vim.schedule_wrap(function()
            vim.cmd("set cursorcolumn! cursorline!")

            cnt = cnt + 1
            if cnt == blink_times then
                timer:stop()
            end
        end)
    )
end

vim.api.nvim_create_augroup("buffer_highlight", { clear = true })

-- Define highlight namespaces
local ns_active = vim.api.nvim_create_namespace("active_buffer")
local ns_inactive = vim.api.nvim_create_namespace("inactive_buffer")
local ns_unfocused = vim.api.nvim_create_namespace("unfocused")

-- Set up highlight definitions
vim.api.nvim_set_hl(ns_active, "Normal", { bg = "#111111" })
vim.api.nvim_set_hl(ns_inactive, "Normal", { bg = "#333333" })
vim.api.nvim_set_hl(ns_unfocused, "Normal", { bg = "#2c2c2c" }) -- Unfocused terminal: even lighter

-- Function to update all windows highlight based on the active buffer
local function update_highlight()
    local current_win = vim.api.nvim_get_current_win()
    for _, win_id in ipairs(vim.api.nvim_get_current_wins()) do
        if win_id == current_win then
            vim.api.nvim_win_set_hl_ns(win_id, ns_active)
        else
            vim.api.nvim_win_set_hl_ns(win_id, ns_inactive)
        end
    end
end

-- When entering a buffer or window, apply the active highlight
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
    group = "buffer_highlight",
    callback = function()
        local win_id = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_hl_ns(win_id, ns_active)
        -- Optional: call your blink() function
        blink()
    end,
})

-- When leaving a buffer or window, apply the inactive highlight
vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
    group = "buffer_highlight",
    callback = function()
        local win_id = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_hl_ns(win_id, ns_inactive)
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

-- When the terminal loses focus, apply the unfocused highlight to all windows
-- vim.api.nvim_create_autocmd("FocusLost", {
--     group = "buffer_highlight",
--     callback = function()
--         -- Apply unfocused highlight to all open windows
--         for _, win_id in ipairs(vim.api.nvim_list_wins()) do
--             vim.api.nvim_win_set_hl_ns(win_id, ns_inactive)
--         end
--     end,
-- })

-- vim.api.nvim_create_augroup("focus_group", { clear = true })
--
-- vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained" }, {
--     callback = function()
--         vim.api.nvim_set_hl(0, "Normal", { bg = "#1c1c1c" })
--         blink()
--         -- vim.cmd([[set mouse=nvi]])
--     end,
--     group = "focus_group",
-- })
-- vim.api.nvim_create_autocmd({ "WinLeave", "FocusLost" }, {
--     callback = function()
--         vim.api.nvim_set_hl(0, "Normal", { bg = "#333333" })
--     end,
--     group = "focus_group",
-- })

-- vim.opt.guicursor = "i:block-blinkwait1000-blinkon500-blinkoff500";
