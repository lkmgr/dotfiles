local M = {}

function M.config()
  local status_ok, gitsigns = pcall(require, "gitsigns")
  if not status_ok then
    return
  end

  -- Transparent bg for current line blame
  -- vim.cmd [[highlight GitSignsCurrentLineBlame ctermfg=12 guifg=#5c6370 guibg=#00000000]]

  gitsigns.setup {
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 400,
    },
    current_line_blame_formatter = "    <author>, <author_time:%Y-%m-%d> - <summary>",
  }
end

return M
