local awful = require("awful")
local beautiful = require("beautiful")

local utilities = require("utilities")
local shapes = utilities.shapes

local function tooltip()
    return awful.tooltip {
        shape = shapes.rounded_rect(beautiful.border_radius)
    }
end

return tooltip
