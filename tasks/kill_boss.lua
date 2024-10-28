local utils = require "core.utils"
local explorer = require "core.explorer"
local tracker = require "core.tracker"
local enums = require "data.enums"

local task = {
    name = "Kill Boss",
    shouldExecute = function()
        return utils.get_boss() and (utils.player_in_zone(enums.boss_zone.ziggurat) or utils.player_in_zone(enums.boss_zone.bugcave) or utils.player_in_zone(enums.boss_zone.snaketemple))
    end,
    Execute = function()
        local boss = utils.get_boss()
        local boss_pos = boss:get_position()
        explorer:clear_path_and_target()
        explorer:set_custom_target(boss_pos)
        -- explorer:move_to_target()
        tracker.killing_boss = true
        pathfinder.request_move(boss_pos)

        console.print("Killing to boss")
    end
}

return task