---------------------------
------ awesome theme ------
---------------------------
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local default_themes_path = gfs.get_themes_dir()
local themes_path = gfs.get_configuration_dir() .. "/theme"

local theme = {}

-- Logo
theme.logo_path = themes_path .. "/assets/logo.png"

-- Icons
theme.icons_path = themes_path .. "/assets/icons"
theme.bell_path = theme.icons_path .. "/bell.svg"
theme.bell_off_path = theme.icons_path .. "/bell-off.svg"
theme.battery_path = theme.icons_path .. "/battery.svg"
theme.battery_charging_path = theme.icons_path .. "/battery-charging.svg"
theme.clock_path = theme.icons_path .. "/clock.svg"
theme.globe_path = theme.icons_path .. "/globe.svg"
theme.layout_path = theme.icons_path .. "/layout.svg"
theme.log_out_path = theme.icons_path .. "/log-out.svg"
theme.moon_path = theme.icons_path .. "/moon.svg"
theme.power_path = theme.icons_path .. "/power.svg"
theme.wifi_off_path = theme.icons_path .. "/wifi-off.svg"
theme.wifi_path = theme.icons_path .. "/wifi.svg"
theme.bluetooth_path = theme.icons_path .. "/bluetooth.svg"
theme.refresh_cc2_path = theme.icons_path .. "/refresh-ccw.svg"
theme.lock_path = theme.icons_path .. "/lock.svg"
theme.x_path = theme.icons_path .. "/x.svg"

-- Font
theme.font_name = "Poppins"
theme.font_size = "12"
theme.font = theme.font_name .. " " .. theme.font_size

-- Colors
theme.wibar_bg = "#E4E4E7" -- Wibar background
theme.hover = "#F2F2F2"
theme.wibar_fg = "#000000" -- Wibar foreground
theme.wibar_wbg = "#FFFFFF" -- Wibar widget background

-- Spacing/Shapes
theme.useless_gap = dpi(0)
theme.border_radius = dpi(5)
theme.widget_spacing = dpi(5)

-- Tooltips
theme.tooltip_bg = theme.wibar_wbg
theme.tooltip_fg = theme.wibar_fg
theme.titlebar_enabled = true

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = default_themes_path .. "default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
-- theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = default_themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus = default_themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = default_themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = default_themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = default_themes_path .. "default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = default_themes_path .. "default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = default_themes_path .. "default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = default_themes_path .. "default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = default_themes_path .. "default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = default_themes_path .. "default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = default_themes_path .. "default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = default_themes_path .. "default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = default_themes_path .. "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = default_themes_path .. "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = default_themes_path .. "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = default_themes_path .. "default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = default_themes_path ..
    "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = default_themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = default_themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = default_themes_path .. "default/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path .. "/assets/dark.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = default_themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv = default_themes_path .. "default/layouts/fairvw.png"
theme.layout_floating = default_themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier = default_themes_path .. "default/layouts/magnifierw.png"
theme.layout_max = default_themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = default_themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = default_themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft = default_themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile = default_themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop = default_themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral = default_themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle = default_themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw = default_themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne = default_themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw = default_themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse = default_themes_path .. "default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule = {
            urgency = 'critical'
        },
        properties = {
            bg = '#ff0000',
            fg = '#ffffff'
        }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
