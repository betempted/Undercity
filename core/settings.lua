local gui = require "gui"

local settings = {
    enabled = false,
    -- path_angle = gui.elements.path_angle_slider:get(),
    path_angle = 10,
    elites_only = gui.elements.elite_only_toggle:get(),
    melee_logic = gui.elements.melee_logic:get(),
    explorer_grid_size = gui.elements.explorer_grid_size_slider:get(),
    enticement_slider = gui.elements.enticement_slider:get(),
    cheat_death = false,
    escape_percentage = 40
}

function settings:update_settings()
    settings.enabled = gui.elements.main_toggle:get()
    -- settings.path_angle = gui.elements.path_angle_slider:get()
    settings.elites_only = gui.elements.elite_only_toggle:get()
    settings.melee_logic = gui.elements.melee_logic:get()
    settings.explorer_grid_size = gui.elements.explorer_grid_size_slider:get()
    settings.enticement_slider = gui.elements.enticement_slider:get()
    -- cheat death
    settings.cheat_death = gui.elements.cheat_death:get()
    settings.escape_percentage = gui.elements.escape_percentage:get()
    -- movement spell
    settings.movement_spell_in_explorer = gui.elements.movement_spell_in_explorer:get()
    settings.use_evade_as_movement_spell = gui.elements.use_evade_as_movement_spell:get()
    settings.use_teleport = gui.elements.use_teleport:get()
    settings.use_teleport_enchanted = gui.elements.use_teleport_enchanted:get()
    settings.use_dash = gui.elements.use_dash:get()
    settings.use_shadow_step = gui.elements.use_shadow_step:get()
    settings.use_the_hunter = gui.elements.use_the_hunter:get()
    settings.use_soar = gui.elements.use_soar:get()
    settings.use_rushing_claw = gui.elements.use_rushing_claw:get()
    settings.use_leap = gui.elements.use_leap:get()
    
end

return settings