local awful = require("awful")

local vars = require("user.vars")

-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts",
                   function() awful.layout.append_default_layouts(vars.layouts) end)

