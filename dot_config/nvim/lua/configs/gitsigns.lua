local M = {}

function M.config()
  local status_ok, gitsigns = pcall(require, "gitsigns")
  if not status_ok then
    return
  end

  gitsigns.setup {
    current_line_blame = true,
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  }
end

return M

