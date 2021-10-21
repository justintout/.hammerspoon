-- outlook layout - use right screen
-- mostly just fill east
window = require("window")
outlook = {}

outlook.arrange = function()
    if outlook.app == nil then return end
    if #outlook.app:visibleWindows() == 1 then
        move(outlook.parentWindow(), SCREEN.RIGHT, GRID.E)
        outlook.parentWindow():focus()
        return
    end
    for _, w in ipairs(outlook.app:visibleWindows()) do
        if w:id() == outlook.parentWindow():id() then 
            move(w, SCREEN.RIGHT, GRID.SE) 
        else 
            move (w, SCREEN.RIGHT, GRID.NE)
            w:focus()
        end
    end
end

outlook.watcherCallback = function(a, b, c)
    if #outlook.app:allWindows() ~= outlook.nWindows then
        outlook.arrange()
        outlook.nWindows = #outlook.app:allWindows()
    end
end

outlook.parentWindow = function()
        -- TODO: is there a better way to find the base app window? 
        if outlook.app:findWindow("^Inbox • [%w_%.]+@[%w_%.]+%.[%w]+$") then 
            return outlook.app:findWindow("^Inbox • [%w_%.]+@[%w_%.]+%.[%w]+")
        elseif outlook.app:findWindow("^Calendar$") then 
            return outlook.app:findWindow("^Calendar$")
        elseif outlook.app:findWindow("^Contacts • [%w_%.]+@[%w_%.]+%.[%w]+$") then
            return outlook.app:findWindow("^Contacts • [%w_%.]+@[%w_%.]+%.[%w]+$") 
        else
            outlook.app:selectMenuItem({"File","New","Main Window"}) 
            return outlook.parentWindow()
        end
end

outlook.watch = function()
    if not outlook.watcher then
        outlook.app = hs.application.find("^Microsoft Outlook$")
        outlook.nWindows = #outlook.app:allWindows()
        outlook.watcher = outlook.app:newWatcher(outlook.watcherCallback)
    end
    outlook.watcher:start({hs.uielement.watcher.mainWindowChanged})
    outlook.arrange()
end

outlook.stop = function()
    if outlook.watcher then outlook.watcher.stop() end
end


