local tracker = {
    undercity_start_time = 0,
    interacting_beacon = false,
    killing_boss = false,
    exit_undercity = false,
    finish_undercity = false,
    player_in_boss_room = false,
    wait_to_exit = 0,
    enticement_active = 0
}

local last_tick_time = 0

on_update(function()
    local current_time = os.time()

    if current_time > last_tick_time then
        last_tick_time = current_time

        if tracker.wait_to_exit > 0 then
            tracker.wait_to_exit = tracker.wait_to_exit - 1
            if tracker.wait_to_exit == 1 then
                tracker.exit_undercity = true
            end
        end

        -- console.print("Current time: " .. tostring(current_time))
    end
end)

return tracker