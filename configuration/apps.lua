local gfs = require("gears").filesystem
local config_dir = gfs.get_configuration_dir()

return {
    terminal = "kitty",
    web_browser = "firefox",
    code_editor = "code",
    text_editor = "code",
    app_launcher = "rofi -no-lazy-grab -show drun -modi drun -theme " .. config_dir .. "configuration/rofi.rasi",
    file_manager = "nautilus",
}
