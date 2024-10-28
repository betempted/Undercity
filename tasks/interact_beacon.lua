local utils = require "core.utils"
local explorer = require "core.explorer"
local tracker = require "core.tracker"

local task = {
    name = "Interact Beacon",
    shouldExecute = function()
        local beacon = utils.get_beacon()
        return beacon and beacon:is_interactable()
    end,
    Execute = function()
        local beacon = utils.get_beacon()
        if beacon then
            if beacon:is_interactable() then
                tracker.interacting_beacon = true
                if utils.distance_to(beacon) < 6 then
                    interact_object(beacon)
                    console.print("Interacting with beacon")
                else
                    explorer:clear_path_and_target()
                    explorer:set_custom_target(beacon:get_position())
                    explorer:move_to_target()

                    console.print("Moving to beacon")
                end
            end
        else
            console.print("Found but not interactable")
        end
    end
}
return task
