local wibox = require("wibox")
local beautiful = require("beautiful")

return wibox.widget({
    widget = wibox.widget.imagebox,
    image = beautiful.logo_path,
    resize = true
})
