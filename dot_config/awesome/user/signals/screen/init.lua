local awful = require "awful"

local vars = require "user.vars"
local widgets = require "user.widgets"

screen.connect_signal("request::desktop_decoration", function(s)
  -- Different default layouts per screen
  local screen_layout = (s.index == 1) and vars.layouts[1] or vars.layouts[3]
  awful.tag(vars.tags, s, screen_layout)

  s.promptbox = widgets.create_promptbox()
  s.layoutbox = widgets.create_layoutbox(s)
  s.taglist = widgets.create_taglist(s)
  -- s.tasklist = widgets.create_tasklist(s)
  s.wibox = widgets.create_wibox(s)
end)
