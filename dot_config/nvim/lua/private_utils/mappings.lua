local M = {}

M.nmap = function(lhs, rhs, opts) return vim.keymap.set("n", lhs, rhs, opts or {}) end
M.vmap = function(lhs, rhs, opts) return vim.keymap.set("v", lhs, rhs, opts or {}) end
M.imap = function(lhs, rhs, opts) return vim.keymap.set("i", lhs, rhs, opts or {}) end

return M
