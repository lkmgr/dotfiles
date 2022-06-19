local navic = require "nvim-navic"

local excluded_filetypes = { "neo-tree" }

local M = {}

function M.get()
  if M.is_excluded(vim.bo.filetype) then
    return ""
  end

  if navic.is_available() then
    return navic.get_location()
  end
end

function M.is_excluded(ft)
  return vim.tbl_contains(excluded_filetypes, ft)
end

return M
