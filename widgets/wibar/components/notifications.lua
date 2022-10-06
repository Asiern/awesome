local wibox = require("wibox")
local container = require("widgets.base.inner_widget")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- DPI
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local hover = require("widgets.base.hover")

local bell = wibox.widget({
    widget = wibox.widget.imagebox,
    image = beautiful.bell_path,
    resize = true
})

-- Toggle notifications
bell:connect_signal("button::press", function()
    if naughty.is_suspended() then
        -- Enable notifications
        bell.image = beautiful.bell_path
    else
        -- Disable notifications
        bell.image = beautiful.bell_off_path
    end
    -- Toggle notifications
    naughty.toggle()
end)

-- Add hover effect
hover(bell)

local widget = wibox.widget({
    bell,
    {
        widget = wibox.widget.imagebox,
        image = beautiful.layout_path,
        resize = true
    },
    layout = wibox.layout.fixed.horizontal,
    spacing = dpi(5)
})

return container(widget)
