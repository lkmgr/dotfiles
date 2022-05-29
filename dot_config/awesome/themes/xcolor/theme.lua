local gfs = require "gears.filesystem"
local theme_assets = require "beautiful.theme_assets"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

local default_themes_path = gfs.get_themes_dir()

-- inherit default theme
local theme = dofile(default_themes_path .. "default/theme.lua")

-- wallpaper
theme.wallpaper = gfs.get_configuration_dir() .. "themes/xcolor/bg.jpg"

-- icon theme
theme.icon_theme = "/usr/share/icons/Papirus-Dark/128x128/apps/"
-- theme.icon_theme = "Papirus-Dark"

-- font
theme.font_name = "JetBrainsMono Nerd Font"
theme.font_size = "14"
theme.font = theme.font_name .. " " .. theme.font_size

-- xresources colors
theme.xbg = xrdb.background
theme.xfg = xrdb.foreground

theme.xblack = xrdb.color0
theme.xred = xrdb.color1
theme.xgreen = xrdb.color2
theme.xyellow = xrdb.color3
theme.xblue = xrdb.color4
theme.xmagenta = xrdb.color5
theme.xcyan = xrdb.color6
theme.xwhite = xrdb.color7

theme.xbrblack = xrdb.color8
theme.xbrwhite = xrdb.color15

theme.xdarkgray = "#353B45"
theme.xgray = "#505868"
theme.xgray = "#ABB2BF"
theme.xlightgray = "#CFD3DA"

theme.urgent_red = "#D13426"

-- general
theme.bg_normal = theme.xwhite
theme.bg_focus = theme.xred
theme.bg_urgent = theme.urgent_red
theme.bg_minimize = theme.bg_normal
theme.bg_systray = theme.bg_normal

theme.fg_normal = theme.xfg
theme.fg_focus = theme.bg_normal
theme.fg_urgent = theme.bg_normal
theme.fg_minimize = theme.bg_normal

-- borders
theme.useless_gap = dpi(10)
theme.border_width = dpi(5)
theme.border_color_normal = theme.xbrblack
theme.border_color_active = theme.bg_focus
theme.border_color_marked = theme.xmagenta

-- widgets
theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal

theme.menu_submenu_icon = default_themes_path .. "default/submenu.png"
theme.menu_height = dpi(20)
theme.menu_width = dpi(160)

-- recolor layout icons
theme = theme_assets.recolor_layout(theme, theme.fg_normal)

-- generate taglist squares
local taglist_square_size = dpi(6)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

return theme
