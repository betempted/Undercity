local plugin_label = 'undercity' -- change to your plugin name

local utils = require "core.utils"
local settings = require 'core.settings'
local tracker = require "core.tracker"
local loot_start = get_time_since_inject()
local loot_timeout = 3

local status_enum = {
    IDLE = 'idle',
    WAITING = 'waiting for alfred to complete',
    LOOTING = 'looting stuff on floor'
}
local task = {
    name = 'alfred_running', -- change to your choice of task name
    status = status_enum['IDLE']
}

local function floor_has_loot()
    return loot_manager.any_item_around(get_player_position(), 30, true, true)
end

local function reset()
    PLUGIN_alfred_the_butler.pause(plugin_label)
    -- add more stuff here if you need to do something after alfred is done
    if floor_has_loot() then
        loot_start = get_time_since_inject()
        task.status = status_enum['LOOTING']
    else
        task.status = status_enum['IDLE']
    end
end

function task.shouldExecute()
    if PLUGIN_alfred_the_butler then
        local status = PLUGIN_alfred_the_butler.get_status()
        -- add additional conditions to trigger if required
        if #get_local_player():get_inventory_items() == 33 and
            (status.sell_count > 0 or status.salvage_count > 0) or
            -- boss item
            #get_local_player():get_consumable_items() == 33 or
            -- compass
            #get_local_player():get_dungeon_key_items() == 33 or
            -- eq <= 10% durability
            status.need_repair
        then
            return true
        elseif task.status == status_enum['WAITING'] or
            task.status == status_enum['LOOTING']
        then
            return true
        end
    end
    return false
end

function task.Execute()
    if task.status == status_enum['IDLE'] then
        PLUGIN_alfred_the_butler.resume()
        task.status = status_enum['WAITING']
        PLUGIN_alfred_the_butler.trigger_tasks_with_teleport(plugin_label,reset)
    elseif task.status == status_enum['LOOTING'] and get_time_since_inject() > loot_start + loot_timeout then
        task.status = status_enum['IDLE']
    end
end

return task