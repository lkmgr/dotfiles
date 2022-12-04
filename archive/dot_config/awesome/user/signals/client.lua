local awful = require "awful"
local beautiful = require "beautiful"
local gears = require "gears"
local helpers = require "user.helpers"
-- local wibox = require("wibox")
require "awful.autofocus"

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:activate { context = "mouse_enter", raise = false }
end)

if beautiful.border_radius and beautiful.border_radius > 0 then
  client.connect_signal("manage", function(c, startup)
    if not c.fullscreen and not c.maximized then
      c.shape = helpers.rrect(beautiful.border_radius)
    end
  end)

  local function no_round_corners(c)
    if c.fullscreen or c.maximized then
      c.shape = gears.shape.rectangle
    else
      c.shape = helpers.rrect(beautiful.border_radius)
    end
  end

  client.connect_signal("property::fullscreen", no_round_corners)
  client.connect_signal("property::maximized", no_round_corners)
end

-- client.connect_signal("request::manage", function(c)
--   if awesome.startup then
--     awful.client.setslave(c)
--   end
-- end)

-- client.connect_signal("request::titlebars", function(c)
--     -- buttons for the titlebar
--     local buttons = {
--         awful.button({}, 1, function()
--             c:activate{ context = "titlebar", action = "mouse_move" }
--         end),
--         awful.button({ "Shift" }, 1,
--                      function() c:activate{ context = "titlebar", action = "mouse_resize" } end),
--         awful.button({}, 3,
--                      function() c:activate{ context = "titlebar", action = "mouse_resize" } end),
--     }

--     awful.titlebar(c, { size = 37.5 }):setup{
--         { -- Middle
--             { -- Title
--                 align = "center",
--                 widget = awful.titlebar.widget.titlewidget(c),
--             },
--             buttons = buttons,
--             layout = wibox.layout.flex.horizontal,
--         },

--         {
--             { -- Right
--                 awful.titlebar.widget.closebutton(c),
--                 layout = wibox.layout.fixed.horizontal,
--             },
--             widget = wibox.container.margin,
--             margins = 14,
--         },
--         layout = wibox.layout.stack,
--     }
-- end)
