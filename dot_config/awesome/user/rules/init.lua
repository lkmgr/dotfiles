local awful = require "awful"
local ruled = require "ruled"

local vars = require "user.vars"

-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
  -- All clients will match this rule.
  ruled.client.append_rule {
    id = "global",
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      maximized_vertical = false,
      maximized_horizontal = false,
    },
  }

  ruled.client.append_rule {
    id = "setslave",
    rule = {},
    properties = {},
    callback = awful.client.setslave,
  }

  -- Floating clients.
  ruled.client.append_rule {
    id = "floating",
    rule_any = {
      instance = { "copyq", "pinentry" },
      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "Sxiv",
        "Tor Browser",
        "Wpa_gui",
        "veromix",
        "xtightvncviewer",
        "Lutris",
        "Steam",
        "Bitwarden",
      },
      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        "Event Tester", -- xev.
      },
      role = {
        "AlarmWindow", -- Thunderbird's calendar.
        "ConfigManager", -- Thunderbird's about:config.
        "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
      },
    },
    properties = { floating = true, placement = awful.placement.centered },
  }

  -- Add titlebars to normal clients and dialogs
  -- ruled.client.append_rule {
  --     id = "titlebars",
  --     rule_any = { type = { "normal", "dialog" } },
  --     properties = { titlebars_enabled = true },
  -- }

  ruled.client.append_rules {
    {
      rule = { class = "firefox" },
      properties = { tag = vars.tags[1] },
    },
    {
      rule = { class = "Steam" },
      properties = { tag = vars.tags[3] },
    },
    {
      rule = { class = "Lens" },
      properties = { tag = vars.tags[4] },
    },
    {
      rule = { class = "discord" },
      properties = { tag = vars.tags[5] },
    },
    {
      rule = { class = "chromium" },
      properties = { tag = vars.tags[6] },
    },
    {
      rule = { class = "Thunderbird" },
      properties = { tag = vars.tags[7] },
    },
  }
end)
