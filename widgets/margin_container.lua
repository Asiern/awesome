local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

return function(content)
    return {
        content,
        widget = wibox.container.margin,
        left = dpi(10),
        right = dpi(10),
        top = dpi(5),
        bottom = dpi(5)
    }
end
