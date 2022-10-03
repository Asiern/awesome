local beautiful = require("beautiful")
local wibox = require("wibox")
local awful = require("awful")

local utilities = require("utilities")
local shapes = utilities.shapes
local margin = require("widgets.base.margin_container")
local hover = require("widgets.base.hover")

local widget = wibox.widget({
    margin({
        widget = wibox.widget.imagebox,
        image = beautiful.power_path,
        resize = true
    }, 5, 5, 10, 10),
    widget = wibox.container.background,
    bg = beautiful.wibar_wbg,
    shape = shapes.rounded_rect(beautiful.border_radius)
})

widget:connect_signal("button::press", function()
    awful.util.spawn("poweroff")
end)

-- Add hover effect
hover(widget)

return widget
