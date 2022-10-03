local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local utilities = require("utilities")
local shapes = utilities.shapes

local margin = require("widgets.base.margin_container")
local hover = require("widgets.base.hover")
local tooltip = require("widgets.base.tooltip")

-- Widgets

local bluetooth_widget = wibox.widget({
    {
        widget = wibox.widget.imagebox,
        image = beautiful.bluetooth_path,
        resize = true
    },
    widget = wibox.container.margin,
    right = dpi(5)
})

local wifi_widget = wibox.widget({
    {
        widget = wibox.widget.imagebox,
        image = beautiful.wifi_path,
        resize = true
    },
    widget = wibox.container.margin,
    right = dpi(5),
    left = dpi(5)
})

local battery_widget = wibox.widget({
    {
        widget = wibox.widget.imagebox,
        image = beautiful.battery_path,
        resize = true
    },
    widget = wibox.container.margin,
    left = dpi(5)
})

-- Tooltips
local bluetooth_tooltip = tooltip()
bluetooth_tooltip:add_to_object(bluetooth_widget)
bluetooth_widget:connect_signal("mouser::enter", function()
    awful.widget.watch("bash -c 'rfkill list'", 10, function(_, stdout)
        bluetooth_tooltip.text = stdout
    end)
end)

local wifi_tooltip = tooltip()
wifi_tooltip:add_to_object(wifi_widget)

wifi_widget:connect_signal("mouse::enter", function()
    awful.widget.watch("bash -c 'nmcli -m tabular| head -n 9'", 10, function(_, stdout)
        wifi_tooltip.text = stdout
    end)
end)

local battery_tooltip = tooltip()
battery_tooltip:add_to_object(battery_widget)
battery_widget:connect_signal("mouse::enter", function()
    -- awful.widget.watch("bash -c 'upower -d | grep -E 'percentage|status' | head -n 2'", 15, function(_, stdout)
    awful.widget.watch("bash -c 'upower -d | grep percentage | head -n 1'", 15, function(_, stdout)
        battery_tooltip.text = stdout
    end)
end)

local widget = wibox.widget({
    margin({
        bluetooth_widget,
        wifi_widget,
        battery_widget,
        widget = wibox.layout.align.horizontal
    }, 5, 5, 10, 10),
    widget = wibox.container.background,
    bg = beautiful.wibar_wbg,
    shape = shapes.rounded_rect(beautiful.border_radius)
})

widget:connect_signal("button::press", function()
    -- // TODO sysinfo expended widget
end)

-- Add hover effect
hover(widget)

return widget
