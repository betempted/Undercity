local utils = require "core.utils"
local explorer = require "core.explorer"
local tracker = require "core.tracker"

local task = {
    name = "Kill Boss",
    shouldExecute = function()
        return utils.get_boss()
    end,
    Execute = function()
        local boss = utils.get_boss()
        explorer:clear_path_and_target()
        explorer:set_custom_target(boss:get_position())
        explorer:move_to_target()
        tracker.killing_boss = true

        console.print("Killing to boss")
    end
}

return task