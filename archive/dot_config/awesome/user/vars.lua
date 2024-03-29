local awful = require "awful"

local terminal = "kitty"
local editor = os.getenv "EDITOR" or "vim"

local l = awful.layout.suit

return {
  terminal = terminal,
  editor = editor,
  editor_cmd = terminal .. " -e " .. editor,
  layouts = {
    l.tile,
    l.floating,
    l.tile.bottom,
    l.tile.left,
    l.tile.top,
    l.fair,
    l.fair.horizontal,
    l.spiral,
    l.spiral.dwindle,
    l.max,
    l.max.fullscreen,
    l.magnifier,
    l.corner.nw,
  },
  layout_by_screen_idx = {
    [1] = l.tile,
    [2] = l.tile.bottom,
  },
  tags = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
}
