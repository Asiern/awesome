local beautiful = require("beautiful")
local wibox = require("wibox")

local utilities = require("utilities")
local shapes = utilities.shapes

local margin_container = require("widgets.margin_container")

local tooltip = require("widgets.tooltip")()

local widget = wibox.widget({
    margin_container({
        {
            widget = wibox.widget.imagebox,
            image = beautiful.clock_path,
            resize = true
        },
        {
            widget = wibox.widget.textclock,
            format = "%H:%M",
            refresh = 60
        },
        widget = wibox.layout.fixed.horizontal,
        spacing = beautiful.widget_spacing
    }),
    widget = wibox.container.background,
    bg = beautiful.wibar_wbg,
    shape = shapes.rounded_rect(beautiful.border_radius)
})

-- Bind tooltip to widget
tooltip:add_to_object(widget)

-- Set tooltip behaviour
widget:connect_signal("mouse::enter", function()
    tooltip.text = os.date('Today is %A %B %d %Y\nThe time is %T')
end)

return widget
