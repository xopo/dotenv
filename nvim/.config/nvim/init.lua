-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.wo.number = true
vim.wo.relativenumber = true

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

vim.api.nvim_create_augroup("focus_group", { clear = true })

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "FocusGained" }, {
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "#1c1c1c" })
        blink()
        vim.cmd([[set mouse=nvi]])
    end,
    group = "focus_group",
})
vim.api.nvim_create_autocmd({ "WinLeave", "FocusLost" }, {
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "#333333" })
    end,
    group = "focus_group",
})

-- vim.opt.guicursor = "i:block-blinkwait1000-blinkon500-blinkoff500";
