return {
    "dbinagi/nomodoro",
    lazy = true,
    config = function()
        require("nomodoro").setup({})
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }
        map("n", "<space>nw", "<cmd>NomoWork<cr>", opts)
        map("n", "<space>nb", "<cmd>NomoBreak<cr>", opts)
        map("n", "<space>ns", "<cmd>NomoStop<cr>", opts)
    end,
}
