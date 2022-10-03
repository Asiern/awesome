local wibox = require("wibox")
local capi = {
    mouse = mouse
}

return function(w)

    local original_cursor = "left_ptr"

    w:connect_signal("mouse::enter", function()
        local widget = capi.mouse.current_wibox
        if widget then
            widget.cursor = "hand1"
        end
    end)

    w:connect_signal("mouse::leave", function()
        local widget = capi.mouse.current_wibox
        if widget then
            widget.cursor = original_cursor
        end
    end)
end
