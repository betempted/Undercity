local tracker = require "core.tracker"

local task = {
    name = "Exit Undercity",
    shouldExecute = function()
        return tracker.exit_undercity
    end,
    Execute = function()
        tracker.exit_undercity = false
        reset_all_dungeons()
    end
}
return task
