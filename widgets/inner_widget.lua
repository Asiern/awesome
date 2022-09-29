local wibox = require("wibox")
local beautiful = require("beautiful")
local shapes = require("utilities.shapes")
local margin = require("widgets.margin_container")

local function widget(w)
    return wibox.widget({
        margin(w, 5, 5, 10, 10),
        widget = wibox.container.background,
        bg = beautiful.wibar_wbg,
        shape = shapes.rounded_rect(beautiful.border_radius)
    })
end

return widget
