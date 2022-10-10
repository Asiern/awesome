-- Awsome library
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")

-- DPI
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Utilities
local utilities = require("utilities")
local shapes = utilities.shapes

-- Widgets
local sysinfo = require("widgets.wibar.components.sysinfo")
local power = require("widgets.wibar.components.power")
local clock = require("widgets.wibar.components.clock")
local taglist = require("widgets.wibar.components.taglist")
local logo = require("widgets.wibar.components.logo")
local notifications = require("widgets.wibar.components.notifications")

awful.screen.connect_for_each_screen(function(s)

    s.wibar = awful.wibar({
        type = "dock",
        position = "top",
        screen = s,
        height = dpi(50),
        width = s.geometry.width - dpi(40),
        bg = beautiful.wibar_bg,
        ontop = true,
        visible = true,
        shape = shapes.rounded_rect(beautiful.border_radius)
    })

    awful.placement.top(s.wibar, {
        margins = dpi(20)
    })

    -- Add widgets to wibar
    s.wibar:setup({ -- Margin container
        {
            {
                -- Logo
                logo,
                -- Clock
                clock,
                -- Notifications & Layout selector
                notifications,
                layout = wibox.layout.fixed.horizontal,
                spacing = dpi(5)
            },
            {
                -- Taglist
                taglist(s),
                widget = wibox.container.background,
                bg = beautiful.wibar_bg
            },
            {
                -- System info
                sysinfo,
                -- Power
                power,
                layout = wibox.layout.fixed.horizontal,
                spacing = dpi(5)
            },
            layout = wibox.layout.align.horizontal
        },
        widget = wibox.container.margin,
        margins = dpi(10)
    })

    -- Show bar on full screen
    local function show_bar(c)
        if c.fullscreen or c.maximized then
            c.screen.wibar.visible = true
        end
    end

    client.connect_signal("property::unmanage", show_bar)

    -- Hide bar on full screen
    local function hide_bar(c)
        if c.fullscreen or c.maximized then
            c.screen.wibar.visible = false
        else
            c.screen.wibar.visible = true
        end
    end

    client.connect_signal("property::fullscreen", hide_bar)

end)
