-- awesome_mode: api-level=4:screen=on
pcall(require, "luarocks.loader")

local awful = require "awful"
local beautiful = require "beautiful"
local gears = require "gears"

beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/custom/theme.lua")

require "user.bindings"
require "user.rules"
require "user.signals"

awful.spawn.with_shell "/home/lukas/.config/awesome/autostart.sh"
