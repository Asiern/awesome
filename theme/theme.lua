local gears = require("gears")
local fs = require("gears.filesystem")
local themes_path = fs.get_themes_dir()
local theme = dotfile(themes_path .. "default/theme.lua")
-- local assets = require("beautiful.theme_assets")
-- local xresources = require("beautiful.xresources")
-- local dpi = xresources.apply_dpi

--- Fonts
theme.font_name = "Poppins"
theme.font = theme.font_name ..' '.. "Medium 10" 
theme.icon_font = "Material Icons"


-- Wallpaper
theme.wallpaper = gears.surface.load_uncached(fs.get_configuration_dir() .. "theme/assets/light.jpg")

return theme