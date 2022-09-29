local awful = require("awful")
local beautiful = require("beautiful")

local utilities = require("utilities")
local shapes = utilities.shapes

return function()
    return awful.tooltip {
        shape = shapes.rounded_rect(beautiful.border_radius)
    }
end
