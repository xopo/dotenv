return {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'BufReadPost',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'lua', 'go', 'bash', 'css', 'scss', 'python', 'javascript' },
            highlight = { enable = true },
        })

        require('treesitter-context').setup({
            enable = true,
            max_lines = 3,
        })
    end,
}
