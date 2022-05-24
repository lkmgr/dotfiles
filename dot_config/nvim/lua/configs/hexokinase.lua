local M = {}

function M.config()
  vim.g.Hexokinase_highlighters = { "virtual" }
  vim.g.Hexokinase_optInPatterns = "full_hex,rgb,rgba,hsl,hsla,colour_names"
end

return M
