local M = {}

-- make all keymaps silent by default
local map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  return vim.keymap.set(mode, lhs, rhs, opts)
end

M.map = map
M.nmap = function(lhs, rhs, opts) return map("n", lhs, rhs, opts or {}) end
M.vmap = function(lhs, rhs, opts) return map("v", lhs, rhs, opts or {}) end
M.imap = function(lhs, rhs, opts) return map("i", lhs, rhs, opts or {}) end

return M
