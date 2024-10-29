local utils = require "core.utils"
local explorer = require "core.explorer"
local tracker = require "core.tracker"

local task = {
    name = "Interact Enticement",
    shouldExecute = function()
        local enticement = utils.get_enticement()
        return enticement and enticement:is_interactable()
    end,
    Execute = function()
        local enticement = utils.get_enticement()
        if enticement then
            if enticement:is_interactable() then
                explorer:clear_path_and_target()
                explorer:set_custom_target(enticement:get_position())
                if utils.distance_to(enticement) < 2 then
                    interact_object(enticement)
                    console.print("Interacting with enticement")
                else
                    explorer:move_to_target()

                    console.print("Moving to enticement")
                end
            end
        else
            console.print("Found but not interactable")
        end
    end
}
return task
