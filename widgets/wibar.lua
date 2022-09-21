local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local utilities = require("utilities")
local shapes = utilities.shapes

awful.screen.connect_for_each_screen(function (s)

    local logo = wibox.widget({
        widget = wibox.widget.imagebox,
        image = beautiful.awesome_logo,
        resize = true,
    })

    s.wibar = awful.wibar({
        type ="dock",
        position = "top",
        screen = s,
        height = dpi(50),
        width = s.geometry.width - dpi(40),
        bg = "#ffffff",
        ontop = true,
        visible = true,
    })

    awful.placement.top(s.wibar, { margins = dpi(20) })

    -- Add widgets to wibar
    s.wibar:setup({
        {
            {
                layout = wibox.layout.align.horizontal,
                expand = "none",
                {
                    logo,
                    nil,
                    spacing = dpi(10),
                    layout = wibox.layout.fixed.horizontal,
                }
            },
            margins = dpi(10),
            widget = wibox.container.margin,
        },
        bg = beautiful.wibar_bg,
        shape = shapes.rounded_rect(beautiful.border_radius),
        widget = wibox.container.background,
    })

end)