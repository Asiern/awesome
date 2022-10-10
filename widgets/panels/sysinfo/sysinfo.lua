local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")
local shapes = require("utilities").shapes

-- DPI
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Get screen geometry
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

local margin = require("widgets.base.margin_container")
local hover = require("widgets.base.hover")

-- Widget widths
local button_width = dpi(30)
local width = dpi(400)

local widget = wibox({
    x = screen_width - dpi(20) - width, -- // TODO set wibar margin as theme var
    y = dpi(50) + 2 * dpi(20), -- // TODO set wibar height as theme var
    visible = false,
    ontop = true,
    type = "dock",
    height = dpi(200),
    width = width,
    window = "sysinfo_menu"
})

-- Base button
local function createButton(content)
    return wibox.widget({
        margin(content, 20, 20, 20, 20),
        widget = wibox.container.background,
        bg = beautiful.wibar_wbg,
        shape = shapes.rounded_rect(dpi(20))
    })
end

-- Buttons
local wifi_icon = wibox.widget({
    widget = wibox.widget.imagebox,
    image = beautiful.wifi_path
})

local wifi_button = createButton(wifi_icon)
local wifi_on = true
hover(wifi_button)

wifi_button:connect_signal("button:press", function()
    if wifi_on then
        -- Disable bluetooth
        awful.util.spawn("bash -c 'rfkill block wifi'")
        -- Change icon
        wifi_icon.image = beautiful.wifi_off_path
        -- Set var
        wifi_on = false
    else
        -- Disable bluetooth
        awful.util.spawn("bash -c 'rfkill unblock wifi'")
        -- Change icon
        wifi_icon.image = beautiful.wifi_path
        -- Set var 
        wifi_on = true
    end
end)

local bluetooth_on = true

local bluetooth_icon = wibox.widget({
    widget = wibox.widget.imagebox,
    image = beautiful.bluetooth_path,
    resize = true
})

local bluetooth_button = createButton(bluetooth_icon)
hover(bluetooth_button)

bluetooth_button:connect_signal("button:press", function()
    if bluetooth_on then
        -- Disable bluetooth
        awful.util.spawn("bash -c 'rfkill block bluetooth'")
        -- Change icon
        bluetooth_icon.image = beautiful.x_path
        -- Set var
        bluetooth_on = false
    else
        -- Disable bluetooth
        awful.util.spawn("bash -c 'rfkill unlblock bluetooth'")
        -- Change icon
        bluetooth_icon.image = beautiful.bluetooth_path
        -- Set var 
        bluetooth_on = true
    end
end)

widget:setup({
    margin({
        {
            wifi_button,
            bluetooth_button,
            layout = wibox.layout.fixed.horizontal,
            spacing = dpi(10)
        },
        layout = wibox.layout.grid,
        forced_num_cols = 1,
        homogeneous = true,
        expand = false,
        spacing = dpi(10)
    }, 20, 20, 20, 20),
    widget = wibox.container.background,
    bg = beautiful.wibar_bg,
    shape = shapes.rounded_rect(beautiful.border_radius)
})

return widget
