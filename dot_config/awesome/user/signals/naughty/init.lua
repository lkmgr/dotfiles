local naughty = require "naughty"
local beautiful = require "beautiful"
local awful = require "awful"

local dpi = beautiful.xresources.apply_dpi

naughty.config.defaults.ontop = true
naughty.config.defaults.icon_size = dpi(32)
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.timeout = 10
naughty.config.defaults.title = "System Notification"
naughty.config.defaults.position = "top_right"

naughty.config.icon_dirs = { "/usr/share/icons/Papirus-Dark/64x64/apps/" }
naughty.config.icon_formats = { "png", "svg" }

naughty.config.presets.low.timeout = 10
naughty.config.presets.normal.timeout = 10
naughty.config.presets.critical.timeout = 0

naughty.config.presets.ok = naughty.config.presets.normal
naughty.config.presets.info = naughty.config.presets.normal
naughty.config.presets.warn = naughty.config.presets.critical

naughty.connect_signal("request::display", function(n)
  -- local appicon = n.icon or n.app_icon
  -- if not appicon then appicon = beautiful.notification_icon end

  naughty.layout.box { notification = n }
end)
