local gui = require "gui"

local settings = {
    enabled = false,
}

function settings:update_settings()
    settings.enabled = gui.elements.main_toggle:get()
end

return settings