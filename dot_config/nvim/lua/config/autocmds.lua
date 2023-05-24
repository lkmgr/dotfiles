local augroup = function(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank { timeout = 250 } end,
  group = augroup("highlight_yank"),
  pattern = "*",
})

-- Set formatoptions everywhere
-- vim.api.nvim_create_autocmd({ "BufWinEnter", "BufRead", "BufNewFile" }, {
--   desc = "Set formatoptions",
--   group = augroup("formatoptions")
--   callback = function() vim.opt_local.formatoptions = "jcrql" end,
--   pattern = "*",
-- })

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function() vim.cmd "tabdo wincmd =" end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
