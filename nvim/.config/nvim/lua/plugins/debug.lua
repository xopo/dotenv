return {
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        config = function()
            local dap = require("dap")
            dap.set_log_level("DEBUG")

            -- dap.adapters.go = {
            --     type = "executable",
            --     comand = "/opt/homebrew/bin/dlv",
            --     args = { "dap", "-l", "127.0.0.1:38697" },
            -- }
            dap.configurations.go = {
                {
                    type = "go",
                    name = "Debug",
                    request = "launch",
                    program = "${workspaceFolder}/cmd/main.go",
                },
            }

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
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
}
