local M = {}

function M.config()
  local status_ok, treesitter_context = pcall(require, "treesitter-context")
  if not status_ok then
    return
  end

  treesitter_context.setup {
    -- separator = "┄",
  }
end

return M
