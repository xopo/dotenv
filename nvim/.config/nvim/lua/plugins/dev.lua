return {
    {
        'ray-x/navigator.lua',
        enabled = false,
        requires = {
            { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
            { 'neovim/nvim-lspconfig' },
        },
        config = function()
            require('navigator').setup({
                debug = false,
                width = 0.75,
            })
        end,
    },
    {
        'chrisgrieser/nvim-early-retirement', -- close buffers not used after a while - 20min default
        config = true,
        event = 'VeryLazy',
        opts = {
            retirementAgeMins = 60,
            minimumBufferNum = 4,
        },
    },
    {
        -- there are problems in mac with alt key inside vim/nvim
        'clvnkhr/macaltkey.nvim',
        config = function() require('macaltkey').setup() end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        optional = true,
        opts = {
            ensure_installed = { 'sql', 'odin', 'go' },
        },
    },

    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        -- enabled = false,
        opts = {
            -- cmdline = {
            --     enabled = false,
            -- },
            -- messages = {
            --     enabled = false,
            -- },
        },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
            code = {
                sign = true,
                width = 'block',
                right_pad = 1,
            },
            heading = {
                sign = true,
                icons = {},
            },
            checkbox = {
                enabled = true,
            },
        },
        ft = { 'markdown', 'norg', 'rmd', 'org', 'codecompanion' },
        config = function(_, opts)
            require('render-markdown').setup(opts)
            Snacks.toggle({
                name = 'Render Markdown',
                get = require('render-markdown').get,
                set = require('render-markdown').set,
            }):map('<leader>um')
        end,
    },
    {
        'dmtrKovalenko/fff.nvim',
        build = function() require('fff.download').download_or_build_binary() end,
        lazy = false, -- recommended for fast startup
    },

    {
        'madmaxieee/fff-snacks.nvim',
        lazy = false,
        keys = {
            { '<leader>ff', function() require('fff-snacks').find_files() end, desc = 'FFF Find files' },
            { '<leader>sg', function() require('fff-snacks').live_grep() end, desc = 'FFF Live grep' },
        },
    },
}
