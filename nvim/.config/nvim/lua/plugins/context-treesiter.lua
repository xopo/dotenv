return {
    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = { 'html', 'tsx', 'javascript', 'typescript', 'xml', 'toml' },
            highlight = { enable = true },
            matchup = { enable = true },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
}
