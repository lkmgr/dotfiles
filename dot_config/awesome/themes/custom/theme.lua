---------------------------------------------
-- Awesome theme which follows xrdb config --
--   by Yauhen Kirylau                    --
---------------------------------------------
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
-- local gdebug = require("gears.debug")
local gfs = require("gears.filesystem")
-- local themes_path = gfs.get_configuration_dir() .. "themes/"
local themes_path = gfs.get_themes_dir()

-- inherit default theme
local theme = dofile(themes_path .. "default/theme.lua")

-- local font_name = "Inter Regular"
local font_name = "JetBrainsMono Nerd Font"
local font_size = 12

theme.font = font_name .. " " .. font_size

theme.bg_normal = xrdb.background
theme.bg_focus = xrdb.color12
theme.bg_urgent = xrdb.color9
theme.bg_minimize = xrdb.color8
theme.bg_systray = theme.bg_normal

theme.fg_normal = xrdb.foreground
theme.fg_focus = xrdb.color3
theme.fg_urgent = xrdb.color2
theme.fg_minimize = theme.fg_normal

theme.useless_gap = dpi(5)
theme.border_width = dpi(3)
theme.border_color_normal = xrdb.color0
theme.border_color_active = theme.bg_focus
theme.border_color_marked = xrdb.color10

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
-- theme.taglist_bg_focus = "#ff0000"

theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(20)
theme.menu_width = dpi(160)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
-- theme.bg_widget = "#cc0000"

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.fg_normal)

-- Recolor titlebar icons:
--
-- local function darker(color_value, darker_n)
--     local result = "#"
--     for s in color_value:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
--         local bg_numeric_value = tonumber("0x"..s) - darker_n
--         if bg_numeric_value < 0 then bg_numeric_value = 0 end
--         if bg_numeric_value > 255 then bg_numeric_value = 255 end
--         result = result .. string.format("%2.2x", bg_numeric_value)
--     end
--     return result
-- end
-- theme = theme_assets.recolor_titlebar(
--     theme, theme.fg_normal, "normal"
-- )
-- theme = theme_assets.recolor_titlebar(
--     theme, darker(theme.fg_normal, -60), "normal", "hover"
-- )
-- theme = theme_assets.recolor_titlebar(
--     theme, xrdb.color1, "normal", "press"
-- )
-- theme = theme_assets.recolor_titlebar(
--     theme, theme.fg_focus, "focus"
-- )
-- theme = theme_assets.recolor_titlebar(
--     theme, darker(theme.fg_focus, -60), "focus", "hover"
-- )
-- theme = theme_assets.recolor_titlebar(
--     theme, xrdb.color1, "focus", "press"
-- )

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "/usr/share/icons/Papirus-Dark/128x128/apps/"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Generate taglist squares:
local taglist_square_size = dpi(6)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size,
                                                                 theme.fg_normal)

-- Try to determine if we are running light or dark colorscheme:
-- local bg_numberic_value = 0;
-- for s in theme.bg_normal:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
--     bg_numberic_value = bg_numberic_value + tonumber("0x"..s);
-- end
-- local is_dark_bg = (bg_numberic_value < 383)

-- Generate wallpaper:
-- local wallpaper_bg = xrdb.color8
-- local wallpaper_fg = xrdb.color7
-- local wallpaper_alt_fg = xrdb.color12
-- if not is_dark_bg then
--     wallpaper_bg, wallpaper_fg = wallpaper_fg, wallpaper_bg
-- end
--
-- theme.wallpaper = themes_path.."wallhaven-m91yg1.jpg"

-- theme.wallpaper_bg = wallpaper_bg

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' },
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
