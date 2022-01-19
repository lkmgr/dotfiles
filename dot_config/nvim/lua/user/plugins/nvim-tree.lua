local M = {}

function M.setup()
  local status_ok, nvimtree = pcall(require, "nvim-tree")
  if not status_ok then
    return
  end

  nvimtree.setup({
    update_focused_file = {
      enable = true,
    },
    view = {
      width = 35,
    },
  })
end

return M

