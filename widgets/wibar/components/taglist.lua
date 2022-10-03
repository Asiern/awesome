local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local bling = require("modules.bling")

-- DPI
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local shapes = require("utilities.shapes")

-- -- Tag preview
-- bling.widget.tag_preview.enable {
--     show_client_content = false, -- Whether or not to show the client content
--     x = 10, -- The x-coord of the popup
--     y = 10, -- The y-coord of the popup
--     scale = 0.25, -- The scale of the previews compared to the screen
--     honor_padding = false, -- Honor padding when creating widget size
--     honor_workarea = false, -- Honor work area when creating widget size
--     placement_fn = function(c) -- Place the widget using awful.placement (this overrides x & y)
--         awful.placement.top_left(c, {
--             margins = {
--                 top = 30,
--                 left = 30
--             }
--         })
--     end,
--     background_widget = wibox.widget { -- Set a background image (like a wallpaper) for the widget 
--         image = beautiful.wallpaper,
--         horizontal_fit_policy = "fit",
--         vertical_fit_policy = "fit",
--         widget = wibox.widget.imagebox
--     }
-- }

local taglist_buttons = gears.table.join(awful.button({}, 1, function(t)
    t:view_only()
end), awful.button({modkey}, 1, function(t)
    if client.focus then
        client.focus:move_to_tag(t)
    end
end), awful.button({}, 3, awful.tag.viewtoggle), awful.button({modkey}, 3, function(t)
    if client.focus then
        client.focus:toggle_tag(t)
    end
end), awful.button({}, 4, function(t)
    awful.tag.viewnext(t.screen)
end), awful.button({}, 5, function(t)
    awful.tag.viewprev(t.screen)
end))

return function(s)
    return awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        style = {
            shape = shapes.rounded_rect(dpi(2))
        },
        layout = {
            spacing = 10,
            -- spacing_widget = {
            --     color = '#ff00ff',
            --     shape = gears.shape.powerline,
            --     widget = wibox.widget.separator
            -- },
            layout = wibox.layout.fixed.horizontal,
            gap = dpi(20)
        },
        widget_template = {
            {
                {
                    id = 'text_role',
                    widget = wibox.widget.textbox
                },
                widget = wibox.container.margin,
                magins = dpi(4)
            },
            id = 'background_role',
            widget = wibox.container.background,
            bg = beautiful.wibar_wbg
            -- Add support for hover colors and an index label
            -- create_callback = function(self, c3, index, objects) -- luacheck: no unused args
            --     self:get_children_by_id('index_role')[1].markup = '<b> ' .. index .. ' </b>'
            --     self:connect_signal('mouse::enter', function()

            --         -- BLING: Only show widget when there are clients in the tag
            --         if #c3:clients() > 0 then
            --             -- BLING: Update the widget with the new tag
            --             awesome.emit_signal("bling::tag_preview::update", c3)
            --             -- BLING: Show the widget
            --             awesome.emit_signal("bling::tag_preview::visibility", s, true)
            --         end

            --         if self.bg ~= '#ff0000' then
            --             self.backup = self.bg
            --             self.has_backup = true
            --         end
            --         self.bg = '#ff0000'
            --     end)
            --     self:connect_signal('mouse::leave', function()

            --         -- BLING: Turn the widget off
            --         awesome.emit_signal("bling::tag_preview::visibility", s, false)

            --         if self.has_backup then
            --             self.bg = self.backup
            --         end
            --     end)
            -- end,
            -- update_callback = function(self, c3, index, objects) -- luacheck: no unused args
            --     self:get_children_by_id('index_role')[1].markup = '<b> ' .. index .. ' </b>'
            -- end
        }
    }
end
