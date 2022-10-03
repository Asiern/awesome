local wibox = require("wibox")
local container = require("widgets.base.inner_widget")
local beautiful = require("beautiful")

local widget = wibox.widget({
    {
        widget = wibox.widget.imagebox,
        image = beautiful.bell_path,
        resize = true
    },
    {
        widget = wibox.widget.imagebox,
        image = beautiful.layout_path,
        resize = true
    },
    layout = wibox.layout.align.horizontal

})

return container(widget)
