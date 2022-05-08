local M = {}

function M.config()
  local status_ok, feline = pcall(require, "feline")
  if not status_ok then
    return
  end

  feline.setup()
end

return M
