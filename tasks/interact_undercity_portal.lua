local utils = require "core.utils"
local explorer = require "core.explorer"
local enums = require "data.enums"
local tracker = require "core.tracker"

local portal_interaction_time = 0

local task = {
    name = "Interact Undercity Portal",
    shouldExecute = function()
        return utils.get_undercity_portal() and utils.player_in_find_zone(enums.zone_names.undercity_zone) and utils.player_on_find_quest(enums.quest_names.undercity_quest)
    end,
    Execute = function()
        local portal = utils.get_undercity_portal()
        if portal then
            if utils.distance_to(portal) < 2 then
                tracker.portal_time = tracker.portal_time + 1
                interact_object(portal)
                console.print("Interacting with portal")
            else
                explorer:clear_path_and_target()
                explorer:set_custom_target(portal:get_position())
                explorer:move_to_target()
                console.print("Moving to portal")
            end
        end
    end
}
return task
