local awful = require "awful"
local beautiful = require "beautiful"
local hotkeys_popup = require "awful.hotkeys_popup"
local wibox = require "wibox"
local gears = require "gears"

local mod = require "user.bindings.mod"
local vars = require "user.vars"

local _M = {}

_M.awesomemenu = {
  {
    "hotkeys",
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end,
  },
  { "manual", vars.terminal .. " -e man awesome" },
  { "edit config", vars.editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  {
    "quit",
    function()
      awesome.quit()
    end,
  },
}

_M.mainmenu = awful.menu {
  items = {
    { "awesome", _M.awesomemenu, beautiful.awesome_icon },
    { "open terminal", vars.terminal },
  },
}

_M.launcher = awful.widget.launcher { image = beautiful.awesome_icon, menu = _M.mainmenu }

_M.textclock = wibox.widget.textclock(" %d.%m.%Y %H:%M:%S ", 1)

function _M.create_promptbox()
  return awful.widget.prompt()
end

function _M.create_layoutbox(s)
  return awful.widget.layoutbox {
    screen = s,
    buttons = {
      awful.button({}, 1, function()
        awful.layout.inc(1)
      end),
      awful.button({}, 3, function()
        awful.layout.inc(-1)
      end),
    },
  }
end

function _M.create_taglist(s)
  return awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    -- layout = {
    --   spacing = 10,
    -- spacing_widget = {
    --     color  = '#dddddd',
    --     shape  = gears.shape.powerline,
    --     widget = wibox.widget.separator,
    -- },
    --   layout = wibox.layout.fixed.horizontal,
    -- },
    widget_template = {
      {
        {
          -- {
          --   {
          --     {
          --       id = "index_role",
          --       widget = wibox.widget.textbox,
          --     },
          --     margins = 4,
          --     widget = wibox.container.margin,
          --   },
          --   bg = "#dddddd",
          --   shape = gears.shape.circle,
          --   widget = wibox.container.background,
          -- },
          -- {
          --   {
          --     id = "icon_role",
          --     widget = wibox.widget.imagebox,
          --   },
          --   margins = 2,
          --   widget = wibox.container.margin,
          -- },
          {
            id = "text_role",
            widget = wibox.widget.textbox,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        left = 18,
        right = 18,
        widget = wibox.container.margin,
      },
      id = "background_role",
      widget = wibox.container.background,
      -- Add support for hover colors and an index label
      -- create_callback = function(self, c3, index, objects) --luacheck: no unused args
      --   self:get_children_by_id("index_role")[1].markup = "<b> " .. index .. " </b>"
      --   self:connect_signal("mouse::enter", function()
      --     if self.bg ~= "#ff0000" then
      --       self.backup = self.bg
      --       self.has_backup = true
      --     end
      --     self.bg = "#ff0000"
      --   end)
      --   self:connect_signal("mouse::leave", function()
      --     if self.has_backup then
      --       self.bg = self.backup
      --     end
      --   end)
      -- end,
      -- update_callback = function(self, c3, index, objects) --luacheck: no unused args
      --   self:get_children_by_id("index_role")[1].markup = "<b> " .. index .. " </b>"
      -- end,
    },
    buttons = {
      awful.button({}, 1, function(t)
        t:view_only()
      end),
      awful.button({ mod.super }, 1, function(t)
        if client.focus then
          client.focus:move_to_tag(t)
        end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ mod.super }, 3, function(t)
        if client.focus then
          client.focus:toggle_tag(t)
        end
      end),
    },
  }
end

function _M.create_tasklist(s)
  return awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = {
      awful.button({}, 1, function(c)
        c:activate { context = "tasklist", action = "toggle_minimization" }
      end),
      awful.button({}, 3, function()
        awful.menu.client_list { theme = { width = 250 } }
      end),
      awful.button({}, 4, function()
        awful.client.focus.byidx(-1)
      end),
      awful.button({}, 5, function()
        awful.client.focus.byidx(1)
      end),
    },
  }
end

function _M.create_wibox(s)
  return awful.wibar {
    position = "top",
    screen = s,
    widget = {
      layout = wibox.layout.align.horizontal,
      -- Left widgets
      { layout = wibox.layout.fixed.horizontal, _M.launcher, s.taglist, s.promptbox },
      -- s.mytasklist, -- Middle widget
      -- { layout = wibox.layout.flex.horizontal },
      s.tasklist,
      -- Right widgets
      {
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        _M.textclock,
        s.layoutbox,
      },
    },
  }
end

return _M
