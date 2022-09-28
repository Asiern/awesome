local beautiful = require("beautiful")
local wibox = require("wibox")

local utilities = require("utilities")
local shapes = utilities.shapes
local margin = require("widgets.margin_container")

return wibox.widget({
    margin(
        {
            widget = wibox.widget.imagebox,
            image = beautiful.power_path,
            resize = true
        }
    ),
    widget = wibox.container.background,
    bg = beautiful.wibar_wbg,
    shape = shapes.rounded_rect(beautiful.border_radius)
})
