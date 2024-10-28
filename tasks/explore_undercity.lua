local utils = require "core.utils"
local enums = require "data.enums"
local tracker = require "core.tracker"

local task  = {
    name = "Explore Undercity",
    shouldExecute = function()
        return utils.player_in_find_zone(enums.zone_names.undercity_zone) and utils.player_on_find_quest(enums.quest_names.undercity_quest)
    end,
    Execute = function()
        if tracker.killing_boss then
            if not utils.get_boss() then
                tracker.killing_boss = false
            end
        end
    end
}
return task
