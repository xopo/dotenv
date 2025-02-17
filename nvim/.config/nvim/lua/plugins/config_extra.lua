return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            presets = {
                lsp_doc_border = true,
            },
        },
    },
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            lazygit = {
                -- your lazygit configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                configure = true,
                theme = {
                    [241] = { fg = "special" },
                    activeBorderColor = { fg = "Constant", bold = true },
                },
            },
        },
    },

    {
        "folke/noice.nvim",
        enable = false,
        lazy = true,
        -- event = "user fileopened",
        opts = {
            cmdline = {
                view = "cmdline",
            },
        },
        event = "VeryLazy",
        dependencies = { "rcarriga/nvim-notify", "MunifTanjim/nui.nvim" },
        -- setup = function()
        --     require("noice").setup({
        --         lsp = {
        --             -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        --             override = {
        --                 ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        --                 ["vim.lsp.util.stylize_markdown"] = true,
        --                 ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        --             },
        --         },
        --         -- you can enable a preset for easier configuration
        --         presets = {
        --             bottom_search = true, -- use a classic bottom cmdline for search
        --             command_palette = false, -- position the cmdline and popupmenu together
        --             long_message_to_split = true, -- long messages will be sent to a split
        --             inc_rename = false, -- enables an input dialog for inc-rename.nvim
        --             lsp_doc_border = false, -- add a border to hover docs and signature help
        --         },
        --     })
        -- end,
    },
}
