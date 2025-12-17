return {
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {
            cmdline = {
                view = 'cmdline',
                position = { row = -1 },
            },
            presets = {
                lsp_doc_border = true,
            },
            lsp = {
                signature = {
                    enabled = true,
                    trigger = true,
                    luasnip = true,
                },
                view = 'hover',
                opts = {
                    position = { row = 1, col = 1 },
                    relative = 'cursort',
                    anchor = 'SW',
                },
            },
        },
    },

    {
        -- added this to configure lazygit colours
        'folke/snacks.nvim',
        ---@type snacks.Config
        opts = {
            lazygit = {
                -- your lazygit configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                configure = true,
                theme = {
                    [241] = { fg = 'special' },
                    activeBorderColor = { fg = 'Constant', bold = true },
                },
            },
        },
    },
    -- {
    --     'hrsh7th/nvim-cmp',
    --     enabled = false,
    --     opts = function(_, opts)
    --         local cmp = require('cmp')
    --
    --         opts.preselect = cmp.PreselectMode.None
    --
    --         -- Optional: keep manual keys
    --         opts.mapping['<C-n>'] = cmp.mapping.select_next_item()
    --         opts.mapping['<C-p>'] = cmp.mapping.select_prev_item()
    --         opts.mapping['<C-Space>'] = cmp.mapping.complete()
    --         opts.mapping['<CR>'] = cmp.mapping.confirm({ select = false })
    --
    --         return opts
    --     end,
    -- },
}
