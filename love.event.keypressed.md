
All Versions
Page Discussion View source History
love.keypressed
Callback function triggered when a key is pressed.

Function
Available since LÖVE 0.10.0
This variant is not supported in earlier versions.
Synopsis
love.keypressed( key, scancode, isrepeat )
Arguments
KeyConstant key
Character of the pressed key.
Scancode scancode
The scancode representing the pressed key.
boolean isrepeat
Whether this keypress event is a repeat. The delay between key repeats depends on the user's system settings.
Returns
Nothing.

Notes
Scancodes are keyboard layout-independent, so the scancode "w" will be generated if the key in the same place as the "w" key on an American keyboard is pressed, no matter what the key is labelled or what the user's operating system settings are.

Key repeat needs to be enabled with love.keyboard.setKeyRepeat for repeat keypress events to be received. This does not affect love.textinput.

Examples
Exit the game when the player presses the Escape key, using love.event.quit.

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
end
Function
Available since LÖVE 0.9.0 and removed in LÖVE 0.10.0
This variant is not supported in earlier or later versions.
Synopsis
love.keypressed( key, isrepeat )
Arguments
KeyConstant key
Character of the key pressed.
boolean isrepeat
Whether this keypress event is a repeat. The delay between key repeats depends on the user's system settings.
Returns
Nothing.

Notes
Key repeat needs to be enabled with love.keyboard.setKeyRepeat for repeat keypress events to be received.

Function
Removed in LÖVE 0.9.0
Unicode text input is now handled separately via love.textinput.
Synopsis
love.keypressed( key, unicode )
Arguments
KeyConstant key
Character of the key pressed.
number unicode
The unicode number of the key pressed.
Returns
Nothing.

Examples
A movement key input system, where for one step need to press the key once.

function love.keypressed( key, scancode, isrepeat )
   local dx, dy = 0, 0
   if scancode == "d" then -- move right
      dx = 1
   elseif scancode == "a" then -- move left
      dx = -1
   elseif scancode == "s" then -- move down
      dy = 1
   elseif scancode == "w" then -- move up
      dy = -1
   end
   move (dx, dy) -- need to be some function to move the active object
end
Removed in LÖVE 0.9.0
Text input is now handled separately via love.textinput.
Record and print text the user writes (0.8.0 and below.)

function love.load()
    text = "Type away! -- "
end

function love.keypressed(key, unicode)
    -- ignore non-printable characters (see http://www.ascii-code.com/)
    if unicode > 31 and unicode < 127 then
        text = text .. string.char(unicode)
    end
end

function love.draw()
    love.graphics.printf(text, 0, 0, 800)
end
See Also
love
love.keyreleased
love.keyboard.isDown
love.keyboard.isScancodeDown
love.textinput




Other Languages
Dansk – Deutsch – English – Español – Français – Indonesia – Italiano – Lietuviškai – Magyar – Nederlands – Polski – Português – Română – Slovenský – Suomi – Svenska – Türkçe – Česky – Ελληνικά – Български – Русский – Српски – Українська – עברית – ไทย – 日本語 – 正體中文 – 简体中文 – Tiếng Việt – 한국어
More info

Category: Callbacks
Personal tools
Log in
Search
Search LOVE
   
documentation
love
love.audio
love.data
love.event
love.filesystem
love.font
love.graphics
love.image
love.joystick
love.keyboard
love.math
love.mouse
love.physics
love.sound
love.system
love.thread
love.timer
love.touch
love.video
love.window
lua-enet
luasocket
utf8
Navigation
Home
Forums
Issue tracker
wiki navigation
Main page
Recent changes
Random page
Tools
What links here
Related changes
Special pages
Printable version
Permanent link
Page information
Browse properties
GNU Free Documentation License 1.3Powered by MediaWiki Powered by Semantic MediaWiki
This page was last edited on 22 September 2024, at 15:32. Content is available under GNU Free Documentation License 1.3 unless otherwise noted. Privacy policy About LOVE Disclaimers