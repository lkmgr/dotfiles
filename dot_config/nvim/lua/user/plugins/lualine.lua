local M = {}

function M.setup()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  lualine.setup {
    options = {
      theme = "catppuccin",
    },
  }
end

return M