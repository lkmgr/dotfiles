-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = function(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Set formatoptions everywhere
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufRead", "BufNewFile" }, {
  desc = "Set formatoptions",
  group = augroup("formatoptions"),
  callback = function()
    vim.opt_local.formatoptions = "jncrql"
  end,
  pattern = "*",
})
