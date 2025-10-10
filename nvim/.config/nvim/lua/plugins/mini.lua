return {
    'nvim-mini/mini.nvim',
    enabled = true,
    version = false,
    config = function()
        require('mini.icons').setup()
        require('mini.diff').setup()
        require('mini.hipatterns').setup()
        require('mini.ai').setup()
        require('mini.surround').setup()
        require('mini.operators').setup()
        require('mini.pairs').setup()
        require('mini.bracketed').setup()
        require('mini.diff').setup()
    end,
}
