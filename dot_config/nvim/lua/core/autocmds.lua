local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("packer_plugins", {})
cmd("BufWritePost", {
  desc = "Auto Compile plugins.lua file",
  group = "packer_plugins",
  command = "source <afile> | PackerCompile",
  pattern = "plugins.lua",
})

augroup("yank_highlight", {})
cmd("TextYankPost", {
  desc = "Highlight Yank",
  group = "yank_highlight",
  callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400 }) end,
  pattern = "*",
})

