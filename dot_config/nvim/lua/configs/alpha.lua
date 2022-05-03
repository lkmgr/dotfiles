local M = {}

-- Modified alpha startify to only show MRU for CWD

function M.config()
  local status_ok, alpha = pcall(require, "alpha")
  if not status_ok then
    return
  end

  local startify_default = require "alpha.themes.startify"

  local mru_cwd = {
    type = "group",
    val = {
      { type = "padding", val = 1 },
      { type = "text", val = "MRU " .. vim.fn.getcwd(), opts = { hl = "SpecialComment", shrink_margin = false } },
      { type = "padding", val = 1 },
      {
        type = "group",
        val = function()
          return { startify_default.mru(1, vim.fn.getcwd(), 15) }
        end,
        opts = { shrink_margin = false },
      },
    },
  }

  local startify_custom = {
    config = {
      layout = {
        { type = "padding", val = 1 },
        startify_default.section.header,
        { type = "padding", val = 2 },
        startify_default.section.top_buttons,
        mru_cwd,
        { type = "padding", val = 1 },
        startify_default.section.bottom_buttons,
        startify_default.section.footer,
      },
    },
    section = {},
  }

  local merged = vim.tbl_deep_extend("force", startify_default, startify_custom)

  alpha.setup(merged.config)
end

return M
