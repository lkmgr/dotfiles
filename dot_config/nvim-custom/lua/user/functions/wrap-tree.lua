local M = {}

M.open = function ()
  require("bufferline.state").set_offset(31, "FileTree")
  require("nvim-tree").find_file(true)
end

M.close = function ()
  require("bufferline.state").set_offset(0)
  require("nvim-tree").close()
end

return M

