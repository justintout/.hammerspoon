-- hyper key is all the modifiers 
local hyper = { "cmd", "alt", "ctrl", "shift" }

-- reload hammerspoon
-- hyper + f15 (pause)
hs.hotkey.bind(hyper, "f15", function()
    hs.reload()
end)
hs.notify.new({title="Hammerspoon", informativeText="Confid reloaded"}):send()

_teams = require('teams')
hs.hotkey.bind(hyper, "pad0", teams.toggleMute)
teams.watch()

_outlook = require("outlook")
outlook.watch()


window = require('window')
-- Hotkeys 
--  S1       S2
-- Q W E   R T Y 
-- A S D   F G H
-- Z X C   V B N
local WINDOWBINDS = {
    w = function() moveFocused(SCREEN.LEFT, GRID.N) end,
    e = function() moveFocused(SCREEN.LEFT, GRID.NE) end,
    d = function() moveFocused(SCREEN.LEFT, GRID.E) end,
    c = function() moveFocused(SCREEN.LEFT, GRID.SE) end,
    x = function() moveFocused(SCREEN.LEFT, GRID.S) end,
    z = function() moveFocused(SCREEN.LEFT, GRID.SW) end,
    a = function() moveFocused(SCREEN.LEFT, GRID.W) end,
    q = function() moveFocused(SCREEN.LEFT, GRID.NW) end,
    s = function() moveFocused(SCREEN.LEFT, GRID.M) end,

    t = function() moveFocused(SCREEN.RIGHT, GRID.N) end,
    y = function() moveFocused(SCREEN.RIGHT, GRID.NE) end,
    h = function() moveFocused(SCREEN.RIGHT, GRID.E) end,
    n = function() moveFocused(SCREEN.RIGHT, GRID.SE) end,
    b = function() moveFocused(SCREEN.RIGHT, GRID.S) end,
    v = function() moveFocused(SCREEN.RIGHT, GRID.SW) end,
    f = function() moveFocused(SCREEN.RIGHT, GRID.W) end,
    r = function() moveFocused(SCREEN.RIGHT, GRID.NW) end,
    g = function() moveFocused(SCREEN.RIGHT, GRID.M) end,
}
for k in pairs(WINDOWBINDS) do hs.hotkey.bind(hyper, k, WINDOWBINDS[k]) end

-- hints 
-- hyper + tab
hs.hotkey.bind(hyper, "tab", hs.hints.windowHints)

-- highlight mouse
-- hyper + scroll lock
function highlightMouse()
    if circle then circle:delete() end
    if rect then rect:delete() end
    size = 100
    local point = hs.mouse.absolutePosition()
    local circle = hs.drawing.circle(hs.geometry.rect(point.x - (size / 2), point.y - (size / 2), size, size))
    local rect = hs.drawing.rectangle(hs.mouse.getCurrentScreen():frame())
    local color = {hue=0.89,saturation=1,brightness=1,alpha=0.9}
    circle:setStrokeColor(color)
    rect:setStrokeColor(color)
    circle:setStrokeWidth(5)
    rect:setStrokeWidth(25)
    circle:setFill(false)
    rect:setFill(false)
    rect:show()
    local s = true
    local blinkTimer = hs.timer.doEvery(0.1, function() if s then circle:show() s = false else circle:hide() s = true end end)
    local showTimer = hs.timer.doAfter(0.5, function() circle:show() blinkTimer:stop() end)
    local stopTimer = hs.timer.doAfter(1.5, function() circle:delete() rect:delete() blinkTimer:stop() showTimer:stop() end)
end
hs.hotkey.bind(hyper, "f14", highlightMouse)
