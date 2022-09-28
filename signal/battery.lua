local upower_widget = require("modules.awesome-battery_widget")
local listener = upower_widget({
    device_path = "/",
    instant_update = true,
})

listener:connect_signal("upower::update", function(_, device)
    awesome.emmit_signal("signal::battery", device.percentage, device.state)
end)
