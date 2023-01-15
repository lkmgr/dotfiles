local M = {}

M.autoformat = true

function M.toggle()
  M.autoformat = not M.autoformat

  vim.notify(string.format("%s format on save", M.autoformat and "Enabled" or "Disabled"), vim.log.levels.INFO)
end

return M
