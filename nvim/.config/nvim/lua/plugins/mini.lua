return {
    "echasnovski/mini.nvim",
    enabled = true,
    version = false,
    config = function()
        print("Inside mini, install ai, surround, operators, pairs, bracketed")
        require("mini.icons").setup()
        require("mini.diff").setup()
        require("mini.hipatterns").setup()
        require("mini.ai").setup()
        require("mini.files").setup({
            options = {
                use_as_default_explorer = true,
            },
            windows = {
                max_number = 2,
                preview = true,
                width_focus = 35,
                width_preview = 100,
            },
        })
        require("mini.surround").setup()
        require("mini.operators").setup()
        require("mini.pairs").setup()
        require("mini.bracketed").setup()
    end,
}
