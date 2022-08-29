local awful = require "awful"
-- local wibox = require("wibox")
require "awful.autofocus"

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:activate { context = "mouse_enter", raise = false }
end)

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
