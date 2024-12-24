-- awesome_mode: api-level=4:screen=on
pcall(require, "luarocks.loader")

local awful = require "awful"
local beautiful = require "beautiful"
local gears = require "gears"
local naughty = require "naughty"

local config_dir = gears.filesystem.get_configuration_dir()

beautiful.init(config_dir .. "themes/pywal/theme.lua")

require "user.bindings"
require "user.rules"
require "user.signals.client"
require "user.signals.naughty"
require "user.signals.ruled"
require "user.signals.screen"
require "user.signals.tag"

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification {
    urgency = "critical",
    title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
    message = message,
  }
end)

awful.spawn.with_shell(config_dir .. "/autostart.sh")
