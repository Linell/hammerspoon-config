local alert_sound = hs.sound.getByFile("alert.wav")
local tink_sound  = hs.sound.getByName("Tink") -- Not actually used, just as a nice example.
                                               -- More sounds in /System/Library/Sounds

-- Set up hotkey combinations
local mash      = {"cmd", "alt", "ctrl"}
local mashshift = {"cmd", "alt", "shift"}
local funkymash = {"cmd", "ctrl", "shift"}

-- Set grid size.
hs.grid.GRIDWIDTH  = 12
hs.grid.GRIDHEIGHT = 12
hs.grid.MARGINX    = 0
hs.grid.MARGINY    = 0
-- Set window animation off. It's much smoother.
hs.window.animationDuration = 0
-- Set volume increments
local volumeIncrement = 5

hs.hotkey.bind(mash, ';', function() hs.grid.snap(hs.window.focusedWindow()) end)
hs.hotkey.bind(mash, "'", function() hs.fnutils.map(hs.window.visibleWindows(), hs.grid.snap) end)

hs.hotkey.bind(mash,      '=', function() hs.grid.adjustWidth(1)   end)
hs.hotkey.bind(mash,      '-', function() hs.grid.adjustWidth(-1)  end)
hs.hotkey.bind(mashshift, '=', function() hs.grid.adjustHeight(1)  end)
hs.hotkey.bind(mashshift, '-', function() hs.grid.adjustHeight(-1) end)

hs.hotkey.bind(mashshift, 'left',  function() hs.window.focusedWindow():focusWindowWest()  end)
hs.hotkey.bind(mashshift, 'right', function() hs.window.focusedWindow():focusWindowEast()  end)
hs.hotkey.bind(mashshift, 'up',    function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(mashshift, 'down',  function() hs.window.focusedWindow():focusWindowSouth() end)

hs.hotkey.bind(mash, 'M', hs.grid.maximizeWindow)

hs.hotkey.bind(mash, 'F', function() hs.window.focusedWindow():toggleFullScreen() end)

hs.hotkey.bind(mash, 'N', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mash, 'P', hs.grid.pushWindowPrevScreen)

hs.hotkey.bind(mash, 'J', hs.grid.pushWindowDown)
hs.hotkey.bind(mash, 'K', hs.grid.pushWindowUp)
hs.hotkey.bind(mash, 'H', hs.grid.pushWindowLeft)
hs.hotkey.bind(mash, 'L', hs.grid.pushWindowRight)

hs.hotkey.bind(mash, 'U', hs.grid.resizeWindowTaller)
hs.hotkey.bind(mash, 'O', hs.grid.resizeWindowWider)
hs.hotkey.bind(mash, 'I', hs.grid.resizeWindowThinner)
hs.hotkey.bind(mash, 'Y', hs.grid.resizeWindowShorter)

hs.hotkey.bind(mashshift, 'space', hs.spotify.displayCurrentTrack)
hs.hotkey.bind(mashshift, 'P',     hs.spotify.play)
hs.hotkey.bind(mashshift, 'O',     hs.spotify.pause)
hs.hotkey.bind(mashshift, 'N',     hs.spotify.next)
hs.hotkey.bind(mashshift, 'I',     hs.spotify.previous)

hs.hotkey.bind(funkymash, 'space', hs.itunes.displayCurrentTrack)
hs.hotkey.bind(funkymash, 'P',     hs.itunes.play)
hs.hotkey.bind(funkymash, 'O',     hs.itunes.pause)
hs.hotkey.bind(funkymash, 'N',     hs.itunes.next)
hs.hotkey.bind(funkymash, 'I',     hs.itunes.previous)

hs.hotkey.bind(mashshift, 'T', function() hs.alert.show(os.date("%A %b %d, %Y - %I:%M%p"), 4) end)

hs.hotkey.bind(mashshift, ']', function() hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.current().volume + 5) end)
hs.hotkey.bind(mashshift, '[', function() hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.current().volume - 5) end)

alert_sound:play()
hs.alert.show("Hammerspoon, at your service.", 3)
