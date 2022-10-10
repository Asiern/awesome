local wibox = require("wibox")

local widget = wibox.widget({
    {
        widget = wibox.widget.textbox,
        text = "Brightness "
    },
    widget = wibox.widget.base
})

widget:connect_signal("brightness::update", function(value)
    widget:set_visible(true)
end)
