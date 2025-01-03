return {
  "nvim-telescope/telescope.nvim",
  fag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        fzf = {},
      },
      pickers = {
        find_files = {
          theme = "ivy",
        },
      },
    })
    require("telescope").load_extension("fzf")
    vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags)
  end,
}
