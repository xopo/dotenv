return {
    { 'mason-org/mason.nvim', version = '^2.0.0' },
    {
        'clvnkhr/macaltkey.nvim',
        config = function() require('macaltkey').setup() end,
    },

    {
        dir = '~/learn/lua/fzf-worktree.nvim/dev',
        enabled = false,
        event = 'VeryLazy',
        config = function()
            print('loading worktree')
            require('fzf-worktree')
        end,
    },
    {
        dir = '~/learn/lua/present.nvim',
        enabled = false,
        event = 'VeryLazy',
        config = function() require('present') end,
    },
    {
        'ray-x/go.nvim',
        enabled = false,
        dependencies = { -- optional packages
            'ray-x/guihua.lua',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function() require('go').setup() end,
        event = { 'CmdlineEnter' },
        ft = { 'go', 'gomod' },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },
}
