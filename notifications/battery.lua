local naughty = require("naughty")

awesome.connect_signal("signal::battery", function(percentage, status)
    if value <= 15 and state == 2 then
        naughty.notification({
            title = "Battery Status",
            text = "Running low " .. math.floor(percentage) .. "%",
            app_name = "AwesomeWM",
        })
    end
end)
