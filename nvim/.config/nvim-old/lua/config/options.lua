-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local function configure_env()
  print("this is the config for env file")
  -- Set tab width to 3 spaces
  vim.bo.tabstop = 3
  vim.bo.softtabstop = 3
  vim.bo.shiftwidth = 3
  vim.bo.expandtab = true

  -- Turn off diagnostics
  vim.diagnostic.disable()
  -- vim.diagnostic.enable(false)
end

-- Autocommand to apply settings when .env files are opened
vim.api.nvim_create_autocmd("FileType", {
  pattern = "env",
  callback = configure_env,
})
