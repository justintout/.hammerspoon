_window = require("window")
teams = {}

-- mute/unmute teams 
-- hyper + numpad0
teams.toggleMute = function()
    if not teams.app then 
        if not hs.application.find("^Microsoft Teams$") then return end
        teams.app = hs.application.find("^Microsoft Teams$")
    end
    hs.eventtap.keyStroke({"cmd", "shift"}, "m", 0, teams.app)
end

teams.arrange = function()
    if not teams.app then return end
    if #teams.app:visibleWindows() == 1 then
        move(teams.parentWindow(), SCREEN.RIGHT, GRID.W)
        teams.parentWindow():focus()
        return
    end
    for _, w in ipairs(teams.app:visibleWindows()) do
        if w:id() == teams.parentWindow():id() then
            move(w, SCREEN.RIGHT, GRID.SW)
        else 
            move (w, SCREEN.RIGHT, GRID.NW)
            w:focus()
        end
    end
end

teams.watcherCallback = function()
    if #teams.app:allWindows() ~= teams.nWindows then
        teams.arrange()
        teams.nWindows = #teams.app:allWindows()
    end
end

teams.watch = function() 
    if teams.watcher then
        teams.stop()
    end
    teams.app = hs.application.find("^Microsoft Teams$")
    teams.nWindows = #teams.app:allWindows()
    teams.watcher = teams.app:newWatcher(teams.watcherCallback)
    teams.watcher:start({hs.uielement.watcher.mainWindowChanged})
    teams.arrange()
end


teams.stop = function()
    teams.watcher:stop()
    teams.watcher = nil
    teams.app = nil
    teams.nWindows = 0
end

-- todo: for this and outlook it would make more sense to cache
-- the parent window ID on startup and reference that.
teams.parentWindow = function()
    if teams.app:findWindow("%[QSP%]") then
        return teams.app:findWindow("%[QSP%]")
    end
    hs.application.open("Microsoft Teams.app")
    return teams.parentWindow()
end
