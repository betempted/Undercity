local gui = require("gui")
local Explore = require("dungeon.explore")

local local_player = get_local_player()
if not local_player then
    return
end

local enabled = false

local function PlayerInUndercity()
    local zone_name = world.get_current_world():get_current_zone_name()
    return zone_name:find("X1_Undercity")
end

local function PlayerHaveUndercityQuest()
    local quests = get_quests()
    for _, quest in pairs(quests) do
        if quest:get_name():find("X1_Undercity_Trackers") then
            return true
        end
    end

    return false
end

local function checkPlayerValidToRun()
    return PlayerInUndercity() and PlayerHaveUndercityQuest()
end

on_update(function()
    enabled = gui.elements.main_toggle:get()

    if enabled then
        if checkPlayerValidToRun() then
            -- console.print("Player is in Undercity")
            Explore.run()
        end
    end
end)

on_render_menu(gui.render)
