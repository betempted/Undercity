local utils = require "core.utils"
local enums = require "data.enums"
local tracker = require "core.tracker"

local task  = {
    name = "Explore Undercity",
    shouldExecute = function()
        return utils.player_in_find_zone(enums.zone_names.undercity_zone) and not tracker.exit_undercity
    end,
    Execute = function()
        if tracker.killing_boss and tracker.player_in_boss_room then
            if not utils.get_boss() then
                tracker.killing_boss = false
                tracker.finish_undercity = true
                tracker.wait_to_exit = 20
                console.print("Boss has been killed!")
                console.print("Wait to exit: " .. tostring(tracker.wait_to_exit))
            end
        end

        if utils.player_in_boss_room() then
            tracker.player_in_boss_room = true
        end
    end
}
return task
