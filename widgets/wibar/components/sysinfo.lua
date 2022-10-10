local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")

local utilities = require("utilities")
local shapes = utilities.shapes

local margin = require("widgets.base.margin_container")
local hover = require("widgets.base.hover")
local tooltip = require("widgets.base.tooltip")

local panel = require("widgets.panels.sysinfo.sysinfo")
local panel_visible = false

-- Widgets

local bluetooth_widget = wibox.widget({

    widget = wibox.widget.imagebox,
    image = beautiful.bluetooth_path,
    resize = true
})

local wifi_widget = wibox.widget({

    widget = wibox.widget.imagebox,
    image = beautiful.wifi_path,
    resize = true
})

local battery_widget = wibox.widget({
    widget = wibox.widget.imagebox,
    image = beautiful.battery_path,
    resize = true
})

gears.timer {
    timeout = 2,
    call_now = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async_with_shell(
            "upower  -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | awk '{print $2}'", function(out)
                if out:find("discharging") then
                    battery_widget.image = beautiful.battery_path
                else
                    battery_widget.image = beautiful.battery_charging_path
                end
            end)
    end
}

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
        widget = wibox.layout.fixed.horizontal,
        spacing = dpi(10)
    }, 5, 5, 10, 10),
    widget = wibox.container.background,
    bg = beautiful.wibar_wbg,
    shape = shapes.rounded_rect(beautiful.border_radius)
})

widget:connect_signal("button::press", function()
    -- // TODO sysinfo expanded widget
    if panel_visible then
        panel.visible = false
        panel_visible = false
    else

        panel.visible = true
        panel_visible = true
    end
end)

-- Add hover effect
hover(widget)

return widget
