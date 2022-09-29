local beautiful = require("beautiful")
local wibox = require("wibox")

local utilities = require("utilities")
local shapes = utilities.shapes

local container = require("widgets.inner_widget")

local tooltip = require("widgets.tooltip")()

local widget = container({
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
})

-- Bind tooltip to widget
tooltip:add_to_object(widget)

-- Set tooltip behaviour
widget:connect_signal("mouse::enter", function()
    tooltip.text = os.date('Today is %A %B %d %Y\nThe time is %T')
end)

return widget
