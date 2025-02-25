return {
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        config = function()
            local dap = require("dap")
            dap.set_log_level("DEBUG")

            vim.keymap.set("n", "<F8>", dap.continue, { desc = "Debug: Continue" })
            vim.keymap.set("n", "<F7>", dap.step_out, { desc = "Debug: Out" })
            vim.keymap.set("n", "<F9>", dap.step_over, { desc = "Debug: Over" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Into" })
            vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
            vim.keymap.set("n", "<space>B", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition:"))
            end, { desc = "Debug: Set Conditional Breakpoint" })
        end,
    },
}
