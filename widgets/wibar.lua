local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local theme = beautiful.get()
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local utilities = require("utilities")
local shapes = utilities.shapes

local taglist_buttons = gears.table.join(awful.button({}, 1, function(t)
    t:view_only()
end), awful.button({modkey}, 1, function(t)
    if client.focus then
        client.focus:move_to_tag(t)
    end
end), awful.button({}, 3, awful.tag.viewtoggle), awful.button({modkey}, 3, function(t)
    if client.focus then
        client.focus:toggle_tag(t)
    end
end), awful.button({}, 4, function(t)
    awful.tag.viewnext(t.screen)
end), awful.button({}, 5, function(t)
    awful.tag.viewprev(t.screen)
end))

awful.screen.connect_for_each_screen(function(s)

    local logo = wibox.widget({
        widget = wibox.widget.imagebox,
        image = beautiful.logo_path,
        resize = true
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
        height = dpi(60),
        width = s.geometry.width - dpi(40),
        bg = theme.wibar_bg,
        ontop = true,
        visible = true,
        shape = shapes.rounded_rect(theme.border_radius)
    })

    awful.placement.top(s.wibar, {
        margins = dpi(20)
    })

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
                    layout = wibox.layout.fixed.horizontal
                },
                {
                    taglist,
                    nil,
                    layout = wibox.layout.fixed.horizontal
                }
            },
            margins = dpi(10),
            widget = wibox.container.margin
        },
        bg = theme.wibar_bg,
        widget = wibox.container.background
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
