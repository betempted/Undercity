local gui = require "gui"

local settings = {
    enabled = false,
    path_angle = gui.elements.path_angle_slider:get(),
    elites_only = gui.elements.elite_only_toggle:get(),
    melee_logic = gui.elements.melee_logic:get(),
    explorer_grid_size = gui.elements.explorer_grid_size_slider:get(),
}

function settings:update_settings()
    settings.enabled = gui.elements.main_toggle:get()
end

return settings