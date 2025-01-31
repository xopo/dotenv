return {
    "echasnovski/mini.nvim",
    enabled = true,
    version = false,
    config = function()
        print("Inside mini, install ai, surround, operators, pairs, bracketed")
        require("mini.ai").setup()
        require("mini.surround").setup()
        require("mini.operators").setup()
        require("mini.pairs").setup()
        require("mini.bracketed").setup()
    end,
}
