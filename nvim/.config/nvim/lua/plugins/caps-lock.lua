return {
    "barklan/capslock.nvim",
    enabled = true,
    config = function()
        require("capslock").setup({
            statusline = true,
            statusline_icon = "🔒",
            statusline_color = "green",
        })
    end,
}
