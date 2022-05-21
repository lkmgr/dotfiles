local M = {}

function M.config()
  local status_ok, smart_splits = pcall(require, "smart-splits")
  if not status_ok then
    return
  end

  smart_splits.setup {
    -- Ignored filetypes (only while resizing)
    ignored_filetypes = {
      "nofile",
      "quickfix",
      "qf",
      "prompt",
    },
    -- Ignored buffer types (only while resizing)
    ignored_buftypes = { "nofile" },
    -- when moving cursor between splits left or right,
    -- place the cursor on the same row of the *screen*
    -- regardless of line numbers. False by default.
    -- Can be overridden via function parameter, see Usage.
    move_cursor_same_row = false,
  }
end

return M
