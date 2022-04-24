local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("packer_plugins", {})
cmd("BufWritePost", {
  desc = "Auto Compile plugins.lua file",
  group = "packer_plugins",
  command = "source <afile> | PackerCompile",
  pattern = "plugins.lua",
})

