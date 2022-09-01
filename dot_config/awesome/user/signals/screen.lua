local awful = require "awful"
local beautiful = require "beautiful"
local gears = require "gears"
local wibox = require "wibox"

local vars = require "user.vars"
local widgets = require "user.widgets"

screen.connect_signal("request::wallpaper", function(s)
  -- use gears.wallpaper => https://github.com/awesomeWM/awesome/issues/3547
  gears.wallpaper.maximized(beautiful.wallpaper, s)
end)

screen.connect_signal("request::desktop_decoration", function(s)
  -- Different default layouts per screen
  -- local screen_layout = (s.index == 1) and vars.layouts[1] or vars.layouts[3]
  local screen_layout = vars.layout_by_screen_idx[s.index]
  awful.tag(vars.tags, s, screen_layout)

  -- s.promptbox = widgets.create_promptbox()
  s.layoutbox = widgets.create_layoutbox(s)
  s.taglist = widgets.create_taglist(s)
  s.tasklist = widgets.create_tasklist(s)
  s.wibox = widgets.create_wibox(s)

  -- local textclock = wibox.widget.textclock(" %d.%m.%Y %H:%M:%S ", 1)
end)
