local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

return function(content, t, b, l, r)
    return wibox.widget({
        content,
        widget = wibox.container.margin,
        left = dpi(l),
        right = dpi(r),
        top = dpi(t),
        bottom = dpi(b)
    })
end
