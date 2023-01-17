-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank { timeout = 250 } end,
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
})

-- Set formatoptions everywhere
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufRead", "BufNewFile" }, {
  desc = "Set formatoptions",
  group = vim.api.nvim_create_augroup("formatoptions", { clear = true }),
  callback = function() vim.opt_local.formatoptions = "jcrql" end,
  pattern = "*",
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function() vim.cmd "tabdo wincmd =" end,
})

