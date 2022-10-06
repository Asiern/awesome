local beautiful = require("beautiful")
local wibox = require("wibox")
local awful = require("awful")

-- DPI
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local utilities = require("utilities")
local shapes = utilities.shapes
local margin = require("widgets.base.margin_container")
local hover = require("widgets.base.hover")
local margin = require("widgets.base.margin_container")

-- // TODO configure picom to get transparent background

-- Get screen geometry
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

-- Get username
local user = os.getenv("USER")

local button = wibox.widget({
    margin({
        widget = wibox.widget.imagebox,
        image = beautiful.power_path,
        resize = true
    }, 5, 5, 10, 10),
    widget = wibox.container.background,
    bg = beautiful.wibar_wbg,
    shape = shapes.rounded_rect(beautiful.border_radius)
})

-- Add hover effect
hover(button)

-- Options
local menu_option = function(path)
    return wibox.widget({
        margin({
            widget = wibox.widget.imagebox,
            image = path,
            resize = true,
            forced_height = dpi(20),
            forced_width = dpi(20)
        }, 10, 10, 10, 10),
        widget = wibox.container.background,
        bg = beautiful.wibar_wbg,
        fg = beautiful.wibar_fg,
        shape = shapes.rounded_rect(beautiful.border_radius)
    })
end

local poweroff = menu_option(beautiful.power_path)
hover(poweroff)

local restart = menu_option(beautiful.refresh_cc2_path)
hover(restart)

local logout = menu_option(beautiful.log_out_path)
hover(logout)

local back = menu_option(beautiful.x_path)
hover(back)

-- Menu
local menu = wibox({
    x = screen_width / 4,
    y = screen_height / 4,
    visible = false,
    ontop = true,
    type = "dock",
    height = screen_height / 2,
    width = screen_width / 2,
    window = "power_menu"
})

menu:setup({
    {
        {
            {
                widget = wibox.widget.textbox,
                text = "Welcome back, " .. user
            },
            {
                poweroff,
                restart,
                logout,
                back,
                layout = wibox.layout.fixed.horizontal,
                spacing = dpi(5)
            },
            layout = wibox.layout.fixed.vertical,
            spacing = dpi(5)
        },
        expand = "none",
        layout = wibox.layout.align.vertical
    },
    widget = wibox.container.background,
    bg = beautiful.wibar_bg,
    shape = shapes.rounded_rect(beautiful.border_radius)
})

-- Signals

button:connect_signal("button::press", function()
    menu.visible = true
end)

poweroff:connect_signal("button::press", function()
    awful.util.spawn("poweroff")
end)

restart:connect_signal("button::press", function()
    awful.util.spawn("reboot")
end)

logout:connect_signal("button::press", function()
    awesome.quit()
end)

back:connect_signal("button::press", function()
    menu.visible = false
end)

return button
