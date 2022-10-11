local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local awful = require("awful")

local container = require("widgets.base.inner_widget")

local textbox = wibox.widget({
    text = "Not connected",
    widget = wibox.widget.textbox
})

gears.timer {
    timeout = 5,
    call_now = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async_with_shell("nmcli | grep inet4 | awk '{print $2}'", function(out)
            -- // TODO emit proper signal
            -- // TODO get more connection info
            -- awesome.emit_signal("signal::connection", out)
            textbox.text = out
        end)
    end
}

local widget = container({
    {
        image = beautiful.globe_path,
        resize = true,
        widget = wibox.widget.imagebox
    },
    textbox,
    layout = wibox.layout.fixed.horizontal,
    spacing = beautiful.widget_spacing
})

-- textbox:connect_signal("signal::connection", function(info)
--     textbox.text = info;
-- end)

return widget
