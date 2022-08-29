local wezterm = require "wezterm"
local home = os.getenv "HOME"
local colors = dofile(home .. "/.cache/wal/custom-wezterm.lua")

return {
  colors = colors,
  font = wezterm.font {
    family = "Cascadia Code PL",
    harfbuzz_features = { "calt", "ss01" },
  },
  line_height = 1.1,
  font_size = 13,
}
