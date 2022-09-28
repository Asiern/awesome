-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local gfs = gears.filesystem
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Declarative object management
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Themes
local themes = { "light", -- 1
    "dark" -- 2
}
-- Set theme
local theme = themes[2]

-- Load selected theme
beautiful.init(gfs.get_configuration_dir() .. "theme/" .. theme .. ".lua")

-- Utilities
require("utilities")

-- Configurations
require("configuration")

-- Notifications
require("notifications")

-- Modules
require("modules")

-- UI
require("widgets")

-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({ awful.layout.suit.floating, awful.layout.suit.tile,
        awful.layout.suit.tile.left, awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top, awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal, awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle, awful.layout.suit.max,
        awful.layout.suit.max.fullscreen, awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw })
end)
-- }}}

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
        screen = s,
        widget = {
            {
                image = beautiful.wallpaper,
                upscale = true,
                downscale = true,
                widget = wibox.widget.imagebox
            },
            valign = "center",
            halign = "center",
            tiled = false,
            widget = wibox.container.tile
        }
    }
end)
-- }}}


-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate {
        context = "mouse_enter",
        raise = false
    }
end)

--- Enable for lower memory consumption
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
gears.timer({
    timeout = 5,
    autostart = true,
    call_now = true,
    callback = function()
        collectgarbage("collect")
    end,
})
