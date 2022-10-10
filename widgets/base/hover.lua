local wibox = require("wibox")
local beautiful = require("beautiful")
local capi = {
    mouse = mouse
}

return function(w)

    local original_cursor = "left_ptr"
    local widget = wibox.widget({
        w,
        widget = wibox.container.background,
        bg = beautiful.hover
    })

    w:connect_signal("mouse::enter", function()
        local wid = capi.mouse.current_wibox
        if wid then
            wid.cursor = "hand1"
        end
    end)

    w:connect_signal("mouse::leave", function()
        local wid = capi.mouse.current_wibox
        if wid then
            wid.cursor = original_cursor
        end
    end)

    return wibox.widget

end
