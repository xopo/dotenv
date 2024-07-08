--return {} -- find a better config

return {
  "mfussenegger/nvim-dap",
  recommended = true,
  desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },
    {
      "williamboman/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "js-debug-adapter")
      end,
    },
  },

  -- stylua: ignore
  keys = {
    { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    -- { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

  config = function()
    -- load mason-nvim-dap here, after all adapters have been setup
    if LazyVim.has("mason-nvim-dap.nvim") then
      require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
    end

    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(LazyVim.config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end

    -- setup dap config by VsCode launch.json file
    local vscode = require("dap.ext.vscode")
    local json = require("plenary.json")
    vscode.json_decode = function(str)
      return vim.json.decode(json.json_strip_comments(str))
    end
  end,

  opts = function()
    local dap = require("dap")
    if not dap.adapters["pwa-node"] then
      require("dap").adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          -- 💀 Make sure to update this path to point to your installation
          args = {
            LazyVim.get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
            "${port}",
          },
        },
      }
    end
    if not dap.adapters["node"] then
      dap.adapters["node"] = function(cb, config)
        if config.type == "node" then
          config.type = "pwa-node"
        end
        local nativeAdapter = dap.adapters["pwa-node"]
        if type(nativeAdapter) == "function" then
          nativeAdapter(cb, config)
        else
          cb(nativeAdapter)
        end
      end
    end

    local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

    local vscode = require("dap.ext.vscode")
    vscode.type_to_filetypes["node"] = js_filetypes
    vscode.type_to_filetypes["pwa-node"] = js_filetypes

    for _, language in ipairs(js_filetypes) do
      if not dap.configurations[language] then
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end
  end,
}

-- local js_based_languages = { "typescript", "javascript", "javascriptreact", "typescriptreact" }
--
-- return {
--   "mfussenegger/nvim-dap",
--   dependencies = {
--     "rcarriga/nvim-dap-ui",
--     "theHamsta/nvim-dap-virtual-text",
--     "nvim-neotest/nvim-nio",
--   },
--   enabled = false,
--   config = function()
--     local dap = require("dap")
--     local dapui = require("dapui")
--
--     require("dapui").setup()
--     require("dap").adapters["pwa-node"] = {
--       type = "server",
--       host = "localhost",
--       port = "${port}",
--       executable = {
--         command = "node",
--         -- 💀 Make sure to update this path to point to your installation
--         args = { "$HOME/js-debug/src/dapDebugServer.js", "${port}" },
--       },
--     }
--     require("dap").configurations.javascript = {
--       {
--         type = "pwa-node",
--         request = "launch",
--         name = "Launch file",
--         program = "${file}",
--         cwd = "${workspaceFolder}",
--       },
--     }
--     dap.listeners.after.event_initialized["dapui_config"] = function()
--       dapui.open()
--     end
--     dap.listeners.before.event_terminated["dapui_config"] = function()
--       dapui.close()
--     end
--     dap.listeners.before.event_exited["dapui_config"] = function()
--       dapui.close()
--     end
--
--     for _, language in pairs(js_based_languages) do
--       print("language is", language)
--       dap.configuration[language] = {
--         -- Debug single node file
--         {
--           type = "pwa-node",
--           request = "launch",
--           name = "Launch file",
--           program = "${file}",
--           cwd = "${workspaceFolder}",
--           sourceMaps = true,
--         },
--         -- Debug nodejs  process (make sure to add --inspect when you run the process)
--         {
--           type = "pwa-node",
--           request = "attach",
--           name = "Attach",
--           processId = require("dap.utils").pick_process,
--           cwd = "${workspaceFolder}",
--           sourceMaps = true,
--         },
--         -- Debug web applications (client side)
--         {
--           type = "pwa-chrome",
--           request = "launch",
--           name = "Launch & debug Chrome",
--           url = function()
--             local co = coroutine.running()
--             return coroutine.create(function()
--               vim.ui.input({
--                 prompt = "Enter URL: ",
--                 default = "http://localhost:3000",
--               }, function(url)
--                 if url == nil or url == "" then
--                   return
--                 else
--                   coroutine.resume(co, url)
--                 end
--               end)
--             end)
--           end,
--           webRoot = "${workspaceFolder}",
--           skipFiles = { "<node_internals>/**/*.js" },
--           protocol = "inspector",
--           sourceMaps = true,
--           userDataDir = false,
--         },
--         {
--           name = "---- launch.json configs -------",
--           type = "",
--           request = "launch",
--         },
--       }
--     end
--     -- add icons for breakpoints
--     vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
--     vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
--
--     -- add some keybindings
--     vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
--     vim.keymap.set("n", "<leader>dc", dap.continue)
--
--     vim.keymap.set("n", "<leader>da", function()
--       if vim.fn.filereadable(".vscode/launch.json") then
--         local dap_vscode = require("dap.ext.vscode")
--         dap_vscode.load_launchjs(nil, {
--           ["pwa-node"] = js_based_languages,
--           ["node"] = js_based_languages,
--           ["chrome"] = js_based_languages,
--           ["pwa-chrome"] = js_based_languages,
--         })
--       end
--       require("dap").continue()
--     end)
--   end,
-- }
