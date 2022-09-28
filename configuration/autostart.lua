local awful = require("awful")
local gears = require("gears")
local gfs = gears.filesystem
local config_path = gfs.get_configuration_dir()

local function autostart()
    -- Run picom at startup
    awful.spawn("picom --experimental-backends --config " .. config_path .. "configuration/picom.conf", false)

end

autostart()
