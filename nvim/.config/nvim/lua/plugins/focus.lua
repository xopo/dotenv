return {
    "nvim-focus/focus.nvim",
    version = false,
    config = function()
        require("focus").setup({
            enable = true,
            autoresize = {
                enable = true,
            },
            -- relativenumber = true,
            ui = {
                number = true,
                -- hibridnumber = true,
                absolutenumber_unfocussed = true,
                winhighlight = true,
                cursorline = true,
                cursorcolumn = true,
            },
            colorcolumn = {
                enable = true,
                list = "+1,+2",
            },
        })
    end,
}
