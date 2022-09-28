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
local margin = require("widgets.margin_container")

-- Widgets
local sysinfo = require("widgets.sysinfo")
local power = require("widgets.power")
local clock = require("widgets.clock")
local logo = require("widgets.logo")

local taglist_buttons = gears.table.join(awful.button({}, 1, function(t)
    t:view_only()
end), awful.button({ modkey }, 1, function(t)
    if client.focus then
        client.focus:move_to_tag(t)
    end
end), awful.button({}, 3, awful.tag.viewtoggle), awful.button({ modkey }, 3, function(t)
    if client.focus then
        client.focus:toggle_tag(t)
    end
end), awful.button({}, 4, function(t)
    awful.tag.viewnext(t.screen)
end), awful.button({}, 5, function(t)
    awful.tag.viewprev(t.screen)
end))

awful.screen.connect_for_each_screen(function(s)

    local notifications = wibox.widget({
        margin(
            {
                {
                    {
                        widget = wibox.widget.imagebox,
                        image = beautiful.bell_path,
                        resize = true
                    },
                    widget = wibox.container.margin,
                    right = dpi(5)
                },
                {
                    {
                        widget = wibox.widget.imagebox,
                        image = beautiful.layout_path,
                        resize = true
                    },
                    widget = wibox.container.margin
                },
                widget = wibox.layout.fixed.horizontal
            }
        ),
        widget = wibox.container.background,
        bg = beautiful.wibar_wbg,
        shape = shapes.rounded_rect(beautiful.border_radius)
    })

    local taglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }


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
            { -- Layout container

                {
                    -- Logo
                    logo,
                    -- Clock
                    clock,
                    -- Layout selector
                    notifications,
                    layout = wibox.layout.fixed.horizontal
                },
                -- Taglist
                taglist,
                {
                    -- System info
                    sysinfo,
                    -- Power
                    power,
                    layout = wibox.layout.fixed.horizontal
                },
                layout = wibox.layout.flex.horizontal
            },
            widget = wibox.container.background
            -- bg = "#FF00FF"
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
