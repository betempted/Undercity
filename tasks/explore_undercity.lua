local utils = require "core.utils"
local enums = require "data.enums"
local tracker = require "core.tracker"
local explorer = require "core.explorer"

local task  = {
    name = "Explore Undercity (E: " .. tostring(tracker.enticement_active) .. ")",
    shouldExecute = function()
        return utils.player_in_find_zone(enums.zone_names.undercity_zone) and not tracker.exit_undercity
    end,
    Execute = function()
        if utils.player_in_boss_room() then
            tracker.player_in_boss_room = true
        end

        if tracker.killing_boss and tracker.player_in_boss_room then
            if not utils.get_boss() then
                tracker.killing_boss = false
                tracker.finish_undercity = true
                console.print("Boss has been killed!")
            end
        end

        if tracker.finish_undercity then
            if utils.check_if_there_is_a_stash() then
                local have_item, item_pos = utils.find_nearby_items()
                if have_item then
                    console.print("Move near items")
                    pathfinder.request_move(item_pos)
                else
                    if tracker.wait_to_exit == 0 and tracker.player_in_boss_room and utils.player_in_find_zone(enums.zone_names.undercity_zone) then
                        tracker.wait_to_exit = 5
                        console.print("Wait to exit: " .. tostring(tracker.wait_to_exit))
                    end
                end
            end
        end
    end
}
return task
