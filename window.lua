-- window management
hs.window.animationDuration = 0
hs.grid.GRIDWIDTH = 2
hs.grid.GRIDHEIGHT = 2
GRID = {
    N =  {0, 0, 2, 1},
    NE = {1, 0, 1, 0},
    E =  {1, 0, 1, 2},
    SE = {1, 1, 1, 1},
    S =  {0, 1, 2, 1},
    SW = {0, 1, 1, 1},
    W =  {0, 0, 1, 2},
    NW = {0, 0, 1, 1},
    M =  {0, 0, 2, 2}, -- middle is always fullscreen
}
SCREEN = {
    LEFT =  hs.screen'-1,0',
    RIGHT = hs.screen'0,0',
}

function move(w, s, g) hs.grid.set(w, g, s) w:focus() end
function moveFocused(s, g) move(hs.window.focusedWindow(), s, g) end

