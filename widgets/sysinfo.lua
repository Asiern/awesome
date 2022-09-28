local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local utilities = require("utilities")
local shapes = utilities.shapes

local margin = require("widgets.margin_container")

local tooltip = require("widgets.tooltip")

local wifi_tooltip = tooltip()

local wifi_widget = {
    {
        widget = wibox.widget.imagebox,
        image = beautiful.wifi_path,
        resize = true
    },
    widget = wibox.container.margin,
    right = dpi(5)
}

-- wifi_tooltip:add_to_object(wifi_widget)

-- wifi_widget:connect_signal("mouse::enter", function()
--     wifi_tooltip.text = "Wifi"
-- end)

return wibox.widget({
    margin({
        {
            {
                widget = wibox.widget.imagebox,
                image = beautiful.globe_path,
                resize = true
            },
            widget = wibox.container.margin,
            right = dpi(5)
        },
        wifi_widget,
        {
            {
                widget = wibox.widget.imagebox,
                image = beautiful.battery_path,
                resize = true
            },
            widget = wibox.container.margin,
            left = dpi(5)
        },
        widget = wibox.layout.align.horizontal
    }),
    widget = wibox.container.background,
    bg = beautiful.wibar_wbg,
    shape = shapes.rounded_rect(beautiful.border_radius)
})
