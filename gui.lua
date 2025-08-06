local gui = {}
local developer_id = "TesXter"
local script_name = "Undercity"
local code_name = get_hash(developer_id .. "_" .. script_name)
local version = "1.0.1 (HC)"

local function create_checkbox(key)
    return checkbox:new(false, get_hash(code_name .. "_" .. key))
end

gui.elements = {
    main_tree = tree_node:new(0),
    main_toggle = create_checkbox("main_toggle"),
    settings_tree = tree_node:new(1),
    melee_logic = create_checkbox("melee_logic"),
    elite_only_toggle = create_checkbox("elite_only"),
    enticement_slider = slider_int:new(0, 3, 2, get_hash("enticement_slider")),
    -- path_angle_slider = slider_int:new(0, 360, 10, get_hash("path_angle_slider")),
    explorer_grid_size_slider = slider_int:new(10, 20, 15, get_hash("explorer_grid_size_slider")),
    cheat_death = create_checkbox("cheat_death"),
    escape_percentage = slider_int:new(10, 100, 40, get_hash("escape_percentage")),
    -- use movement spell
    movement_tree = tree_node:new(2),
    movement_spell_in_explorer = create_checkbox("movement_spell_in_explorer"),
    use_evade_as_movement_spell = create_checkbox("use_evade_as_movement_spell"),
    use_teleport = create_checkbox("use_teleport"),
    use_teleport_enchanted = create_checkbox("use_teleport_enchanted"),
    use_dash = create_checkbox("use_dash"),
    use_shadow_step = create_checkbox("use_shadow_step"),
    use_the_hunter = create_checkbox("use_the_hunter"),
    use_soar = create_checkbox("use_soar"),
    use_rushing_claw = create_checkbox("use_rushing_claw"),
    use_leap = create_checkbox("use_leap")
}

function gui.render()
    if not gui.elements.main_tree:push(script_name .. " | " .. developer_id .. " | V" .. version) then return end

    gui.elements.main_toggle:render("Enable", "Enable the bot")
    
    if gui.elements.settings_tree:push("Settings") then
        gui.elements.melee_logic:render("Melee", "Do we need to move into Melee?")
        gui.elements.elite_only_toggle:render("Elite Only", "Do we only want to seek out elites in the Pit?")
        gui.elements.enticement_slider:render("Enticement", "How many at least enticements you want to activate before go next floor?")
        -- gui.elements.path_angle_slider:render("Path Angle", "Adjust the angle for path filtering (0-360 degrees)")
        gui.elements.explorer_grid_size_slider:render("Explorer Grid Size", "Adjust the grid size for exploration (1.0-2.0)")
        gui.elements.cheat_death:render("Enable Hardcore cheat death", "Enable Hardcore cheat death")
        if gui.elements.cheat_death:get() then
            gui.elements.escape_percentage:render("Health %%", "%% health to immediately leave pit")
        end
        gui.elements.movement_spell_in_explorer:render("Use movement spell while exploring", "Will attempt to use movement spell while exploring")
        if gui.elements.movement_spell_in_explorer:get() then
            if gui.elements.movement_tree:push("Movement Spells") then
                gui.elements.use_evade_as_movement_spell:render("Default Evade", "Will attempt to use evade as movement spell")
                gui.elements.use_teleport:render("Sorceror Teleport", "Will attempt to use Sorceror Teleport as movement spell")
                gui.elements.use_teleport_enchanted:render("Sorceror Teleport Enchanted", "Will attempt to use Sorceror Teleport Enchanted as movement spell")
                gui.elements.use_dash:render("Rogue Dash", "Will attempt to use Rogue Dash as movement spell")
                gui.elements.use_shadow_step:render("Rogue Shadow Step", "Will attempt to use Rogue Shadow Step as movement spell")
                gui.elements.use_the_hunter:render("Spiritborn The Hunter", "Will attempt to use Spiritborn The Hunter as movement spell")
                gui.elements.use_soar:render("Spiritborn Soar", "Will attempt to use Spiritborn Soar as movement spell")
                gui.elements.use_rushing_claw:render("Spiritborn Rushing Claw", "Will attempt to use Spiritborn Rushing Claw as movement spell")
                gui.elements.use_leap:render("Barbarian Leap", "Will attempt to use Barbarian Leap as movement spell")
                gui.elements.movement_tree:pop()
            end
        end
        gui.elements.settings_tree:pop()
    end

    gui.elements.main_tree:pop()
end

return gui
