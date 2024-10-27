local enums = require "data.enums"
local utils = {}

function utils.distance_to(target)
    local player_pos = get_player_position()
    local target_pos = target:get_position()
    return player_pos:dist_to_ignore_z(target_pos)
end

function utils.get_undercity_portal()
    local actors = actors_manager:get_all_actors()
    for _, actor in pairs(actors) do
        local name = actor:get_skin_name()
        if name == enums.portal_names.undercity_portal then
            return actor
        end
    end
    return nil
end

function utils.player_in_zone(zone_name)
    return get_current_world():get_current_zone_name() == zone_name
end

return utils
