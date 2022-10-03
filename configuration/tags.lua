local awful = require("awful")
-- DPI
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9"}, s, awful.layout.layouts[1])
    -- awful.tag.add("1", {
    --     layout = awful.layout.layouts[1],
    --     gap = dpi(20),
    --     select = true
    -- })
end)
