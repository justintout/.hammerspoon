# Justin's Hammerspoon Config

Keyboard mappings (using [Karabiner-Elements](https://github.com/pqrs-org/Karabiner-Elements)): 
- <kbd>hyper</kbd> is <kbd>⌘</kbd>+<kbd>⌃</kbd>+<kbd>⌥</kbd>+<kbd>⇧</kbd> 
- <kbd>F15</kbd> is <kbd>Pause</kbd>
- <kbd>F14</kbd> is <kbd>ScrLk</kbd>

## Grid-based window management

Two screens (right and left) are configured.  

The screen is split to a 2x2 grid.
Each section is given an ordinal direction (NW, SW, NE, SE).
Each combination 1x2 sections is given a cardinal direction (N, W, E, W).
Fullscreen (4x4) is called middle (M).

Move focused window to direction with corresponding keyboard keys + `hyper`.

```
Screen 1     Screen 2
 Q  W  E     R  T  Y
 A  S  D     F  G  H
 Z  X  C     V  B  N
```

## Microsoft Teams 

### Mute toggle

<kbd>hyper</kbd>+<kbd>Pad0</kbd> toggles Teams mute during a meeting.

### Watcher

Watches the Teams application for window changes. 
Keeps the main Teams window on the right screen to the west.
Arranges new meetings to the northwest on the right screen when opened, sending the main window to the southwest.  

I have Teams set to stay in Desktop 1 in my 2-space right-side display.


## Microsoft Outlook for Mac

### Watcher

Watches the Teams application for window changes.
Keeps the main Outlook window on the right screen to the east.
Arranges new Outlook windows to the northeast on the right screen when opened, sending the main window to the southwest.  

I have Teams set to stay in Desktop 1 in my 2-space right-side display.

## Mouse locator

<kbd>hyper</kbd>+<kbd>F14</kbd> circles the position of the mouse pointer and outlines the screen the pointer is on.

## Window Hints

<kbd>hyper</kbd>+<kbd>Tab</kbd> opens default [Hammerspoon hs.hints](https://www.hammerspoon.org/docs/hs.hints.html).
