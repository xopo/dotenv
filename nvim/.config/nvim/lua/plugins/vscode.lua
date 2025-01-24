return {
    "Mofiqul/vscode.nvim",
    enabled = false,
    opts = {
        colorscheme = "vscode",
        transparent = true,
        italic_comments = true,
    },
    config = function()
        vim.cmd([[colorscheme vscode]])
    end,
}
