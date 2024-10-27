local utils = require "core.utils"
local explorer = require "core.explorer"
local enums = require "data.enums"

local portal_interaction_time = 0

local task = {
    name = "Interact Undercity Portal",
    shouldExecute = function()
        return explorer.is_task_running and utils.get_undercity_portal() and utils.player_in_find_zone(enums.zone_names.undercity_zone) and utils.player_on_find_quest(enums.quest_names.undercity_quest)
    end,
    Execute = function()
        local portal = utils.get_undercity_portal()
        if portal then
            if utils.distance_to(portal) < 2 then
                interact_object(portal)
                portal_interaction_time = get_time_since_inject()

                -- Add the 5-second timer check
                local current_time = get_time_since_inject()
                if portal_interaction_time > 0 and current_time - portal_interaction_time < 5 then
                    console.print("Waiting for 5 seconds after portal interaction...")
                    return
                else
                    portal_interaction_time = 0
                end
            else
                explorer.set_custom_target(portal:get_position())
                console.print("Moving to portal")
            end
        end
    end
}
return task
