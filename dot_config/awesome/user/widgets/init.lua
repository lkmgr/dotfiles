local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")
local wibox = require("wibox")

local vars = require("user.vars")
local mod = require("user.bindings.mod")

local _M = {}

_M.awesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", vars.terminal .. " -e man awesome" },
    { "edit config", vars.editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

_M.mainmenu = awful.menu({
    items = {
        { "awesome", _M.awesomemenu, beautiful.awesome_icon },
        { "open terminal", vars.terminal },
    },
})

_M.launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = _M.mainmenu })

_M.textclock = wibox.widget.textclock(" %d.%m.%Y %H:%M:%S ", 1)

function _M.create_promptbox() return awful.widget.prompt() end

function _M.create_layoutbox(s)
    return awful.widget.layoutbox({
        screen = s,
        buttons = {
            awful.button({}, 1, function() awful.layout.inc(1) end),
            awful.button({}, 3, function() awful.layout.inc(-1) end),
        },
    })
end

function _M.create_taglist(s)
    return awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({}, 1, function(t) t:view_only() end),
            awful.button({ mod.super }, 1,
                         function(t) if client.focus then client.focus:move_to_tag(t) end end),
            awful.button({}, 3, awful.tag.viewtoggle),
            awful.button({ mod.super }, 3,
                         function(t) if client.focus then client.focus:toggle_tag(t) end end),
        },
    })
end

-- function _M.create_tasklist(s)
--     return awful.widget.tasklist({
--         screen = s,
--         filter = awful.widget.tasklist.filter.currenttags,
--         buttons = {
--             awful.button({}, 1, function(c)
--                 c:activate{ context = "tasklist", action = "toggle_minimization" }
--             end),
--             awful.button({}, 3, function()
--                 awful.menu.client_list { theme = { width = 250 } }
--             end),
--             awful.button({}, 4, function() awful.client.focus.byidx(-1) end),
--             awful.button({}, 5, function() awful.client.focus.byidx(1) end),
--         },
--     })
-- end

function _M.create_wibox(s)
    return awful.wibar({
        position = "top",
        screen = s,
        widget = {
            layout = wibox.layout.align.horizontal,
            -- Left widgets
            { layout = wibox.layout.fixed.horizontal, _M.launcher, s.taglist, s.promptbox },
            -- s.mytasklist, -- Middle widget
            { layout = wibox.layout.flex.horizontal },
            -- Right widgets
            {
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),
                _M.textclock,
                s.layoutbox,
            },
        },
    })
end

return _M

