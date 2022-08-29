local awful = require "awful"
local hotkeys_popup = require "awful.hotkeys_popup"
local menubar = require "menubar"

local vars = require "user.vars"
local mod = require "user.bindings.mod"
-- local widgets = require("widgets")

menubar.utils.terminal = vars.terminal

-- session
awful.keyboard.append_global_keybindings {
  group = "session",
  awful.key({ mod.super, mod.ctrl, mod.shift }, "l", function()
    awful.spawn.with_shell "betterlockscreen -l blur"
  end, { description = "lock screen" }),
}

-- awesome
awful.keyboard.append_global_keybindings {
  group = "awesome",
  awful.key({ mod.super }, "F1", hotkeys_popup.show_help, { description = "show help" }),
  awful.key({ mod.super, mod.ctrl }, "r", awesome.restart, { description = "reload awesome" }),
  awful.key({ mod.super, mod.ctrl }, "q", awesome.quit, { description = "quit awesome" }),
}

-- launcher
awful.keyboard.append_global_keybindings {
  group = "launcher",
  awful.key({ mod.super }, "Return", function()
    awful.spawn(vars.terminal)
  end, { description = "open a terminal" }),
  -- awful.key({ mod.super }, "r", function() awful.screen.focused().mypromptbox:run() end,
  --           { description = "run prompt" }),
  -- awful.key({ mod.super }, "p", function() menubar.show() end,
  --           { description = "show the menubar" }),
  awful.key({ mod.super }, "space", function()
    awful.spawn.with_shell "rofi -show drun"
  end, { description = "open rofi drun" }),
  awful.key({ mod.super, mod.shift }, "space", function()
    awful.spawn.with_shell "rofi -show calc"
  end, { description = "open rofi calc" }),
  awful.key({ mod.super, mod.ctrl }, "space", function()
    awful.spawn.with_shell "rofi -show run"
  end, { description = "open rofi run" }),
}

-- media
awful.keyboard.append_global_keybindings {
  group = "media",
  awful.key({}, "XF86AudioRaiseVolume", function()
    awful.spawn.with_shell "pamixer -i 3"
  end, { description = "raise volume" }),
  awful.key({}, "XF86AudioLowerVolume", function()
    awful.spawn.with_shell "pamixer -d 3"
  end, { description = "lower volume" }),
  awful.key({}, "XF86AudioMute", function()
    awful.spawn.with_shell "pamixer -t"
  end, { description = "toggle mute" }),
  awful.key({ mod.super }, "F9", function()
    awful.spawn.with_shell "playerctl play-pause"
  end, { description = "media play/pause" }),
  awful.key({ mod.super }, "F10", function()
    awful.spawn.with_shell "playerctl previous"
  end, { description = "media previous" }),
  awful.key({ mod.super }, "F11", function()
    awful.spawn.with_shell "playerctl next"
  end, { description = "media next" }),
}

-- tag
awful.keyboard.append_global_keybindings {
  group = "tag",
  awful.key({ mod.super }, "bracketleft", awful.tag.viewprev, { description = "view previous" }),
  awful.key({ mod.super }, "bracketright", awful.tag.viewnext, { description = "view next" }),
  -- awful.key({ mod.super }, "grave", awful.tag.history.restore, { description = "go back" }),
  awful.key {
    modifiers = { mod.super },
    keygroup = "numrow",
    description = "only view tag",
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
  },
  awful.key {
    modifiers = { mod.super, mod.ctrl },
    keygroup = "numrow",
    description = "toggle tag",
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end,
  },
  awful.key {
    modifiers = { mod.super, mod.shift },
    keygroup = "numrow",
    description = "move focused client to tag",
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  },
  awful.key {
    modifiers = { mod.super, mod.ctrl, mod.shift },
    keygroup = "numrow",
    description = "toggle focused client on tag",
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end,
  },
}

-- Focus related keybindings
awful.keyboard.append_global_keybindings {
  awful.key({ mod.super }, "j", function()
    awful.client.focus.byidx(1)
  end, { description = "focus next by index", group = "client" }),
  awful.key({ mod.super }, "k", function()
    awful.client.focus.byidx(-1)
  end, { description = "focus previous by index", group = "client" }),

  awful.key({ mod.super }, "grave", function()
    awful.client.focus.history.previous()
    if client.focus then
      client.focus:raise()
    end
  end, { description = "go back", group = "client" }),

  awful.key({ mod.super }, "comma", function()
    awful.screen.focus(2)
  end, { description = "focus screen 2", group = "screen" }),
  awful.key({ mod.super }, "period", function()
    awful.screen.focus(1)
  end, { description = "focus screen 1", group = "screen" }),
  -- awful.key({ mod.super, mod.ctrl }, "n",
  --     function ()
  --         local c = awful.client.restore()
  --         -- Focus restored client
  --         if c then
  --           c:activate { raise = true, context = "key.unminimize" }
  --         end
  --     end,
  --     {description = "restore minimized", group = "client"}),
}

-- Layout related keybindings
awful.keyboard.append_global_keybindings {
  awful.key({ mod.super, mod.shift }, "j", function()
    awful.client.swap.byidx(1)
  end, { description = "swap with next client by index", group = "client" }),
  awful.key({ mod.super, mod.shift }, "k", function()
    awful.client.swap.byidx(-1)
  end, { description = "swap with previous client by index", group = "client" }),

  awful.key(
    { mod.super },
    "u",
    awful.client.urgent.jumpto,
    { description = "jump to urgent client", group = "client" }
  ),

  awful.key({ mod.super }, "l", function()
    awful.tag.incmwfact(0.02)
  end, { description = "increase master width factor", group = "layout" }),
  awful.key({ mod.super }, "h", function()
    awful.tag.incmwfact(-0.02)
  end, { description = "decrease master width factor", group = "layout" }),

  awful.key({ mod.super, mod.shift }, "l", function()
    awful.tag.incnmaster(1, nil, true)
  end, { description = "increase the number of master clients", group = "layout" }),
  awful.key({ mod.super, mod.shift }, "h", function()
    awful.tag.incnmaster(-1, nil, true)
  end, { description = "decrease the number of master clients", group = "layout" }),

  awful.key({ mod.super, mod.ctrl }, "l", function()
    awful.tag.incncol(1, nil, true)
  end, { description = "increase the number of columns", group = "layout" }),
  awful.key({ mod.super, mod.ctrl }, "h", function()
    awful.tag.incncol(-1, nil, true)
  end, { description = "decrease the number of columns", group = "layout" }),

  awful.key({ mod.super }, "Tab", function()
    awful.layout.inc(1)
  end, { description = "select next", group = "layout" }),
  awful.key({ mod.super, mod.shift }, "Tab", function()
    awful.layout.inc(-1)
  end, { description = "select previous", group = "layout" }),
}
