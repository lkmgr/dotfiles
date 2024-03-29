local awful = require "awful"

local mod = require "user.bindings.mod"

client.connect_signal("request::default_keybindings", function()
  awful.keyboard.append_client_keybindings {
    awful.key {
      modifiers = { mod.super, mod.shift },
      key = "f",
      on_press = function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
      end,
      description = "toggle fullscreen",
      group = "client",
    },

    awful.key({ mod.super }, "w", function(c)
      c:kill()
    end, { description = "close", group = "client" }),

    awful.key({ mod.super }, "f", awful.client.floating.toggle, {
      description = "toggle floating",
      group = "client",
    }),

    awful.key({ mod.super, mod.ctrl }, "Return", function(c)
      c:swap(awful.client.getmaster())
    end, { description = "move to master", group = "client" }),

    -- awful.key({ mod.super }, "o", function (c) c:move_to_screen() end,
    --         {description = "move to screen", group = "client"}),

    awful.key({ mod.super, mod.shift }, "bracketleft", function(c)
      c:move_to_screen(c.screen.index - 1)
    end, {
      description = "move to previous screen",
      group = "screen",
    }),

    awful.key({ mod.super, mod.shift }, "bracketright", function(c)
      c:move_to_screen(c.screen.index + 1)
    end, {
      description = "move to next screen",
      group = "screen",
    }),

    awful.key({ mod.super }, "t", function(c)
      c.ontop = not c.ontop
    end, {
      description = "toggle keep on top",
      group = "client",
    }),

    awful.key({ mod.super, mod.ctrl, mod.shift }, "k", function()
      awful.client.incwfact(-0.05)
    end, {
      description = "decrease client wfact",
      group = "layout",
    }),

    awful.key({ mod.super, mod.ctrl, mod.shift }, "j", function()
      awful.client.incwfact(0.05)
    end, {
      description = "increase client wfact",
      group = "layout",
    }),

    -- awful.key({ mod.super }, "n",
    --     function (c)
    --         -- The client currently has the input focus, so it cannot be
    --         -- minimized, since minimized clients can't have the focus.
    --         c.minimized = true
    --     end,
    --     {description = "minimize", group = "client"}),

    awful.key({ mod.super }, "m", function(c)
      c.maximized = not c.maximized
      c:raise()
    end, { description = "(un)maximize", group = "client" }),

    awful.key({ mod.super, mod.ctrl }, "m", function(c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end, {
      description = "(un)maximize vertically",
      group = "client",
    }),

    awful.key({ mod.super, mod.shift }, "m", function(c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end, {
      description = "(un)maximize horizontally",
      group = "client",
    }),
  }
end)
