return {
    "Mofiqul/vscode.nvim",
    enabled = true,
    opts = {
        colorscheme = "vscode",
        transparent = true,
        italic_comments = true,
    },
    config = function()
        color_overrides = {
            vscTabCurrent = "#008000",
            vscBack = "#008000",
        }
        vim.cmd([[colorscheme vscode]])
    end,
}
