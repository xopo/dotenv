return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  --enabled = true, --false,
  --lazy = true,
  event = "VeryLazy",
  ft = "js.ts.jsx.tsx",
  filetypes = { "typescriptreact", "javascriptreact", "typescript", "javascript", "html", "css", "scss", "jsx", "tsx" },
  config = function()
    print("Codeium is loading")
    vim.keymap.set("i", "<C-g>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<c-;>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<c-,>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<c-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true, silent = true })
    require("codeium").setup()
  end,
}
