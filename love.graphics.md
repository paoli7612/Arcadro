
## love.graphics.line
Draws lines between points.
Function
Synopsis
love.graphics.line( x1, y1, x2, y2, ... )
Arguments
number x1
The position of first point on the x-axis.
number y1
The position of first point on the y-axis.
number x2
The position of second point on the x-axis.
number y2
The position of second point on the y-axis.
number ...
You can continue passing point positions to draw a polyline.
Returns
Nothing.

Function
Synopsis
love.graphics.line( points )
Arguments
table points
A table of point positions, as described above.
Returns
Nothing.

Examples
Draw the outline of a simple trapezoid
function love.draw()
	love.graphics.line(200,50, 400,50, 500,300, 100,300, 200,50)   -- last pair is a repeat to complete the trapezoid
end
Draw a line from the center of the screen to the mouse pointer
function love.draw()
	local mx, my = love.mouse.getPosition()

	local windowWidth, windowHeight = love.graphics.getDimensions()

	love.graphics.line(windowWidth/2, windowHeight/2, mx, my)
end
Draw a zigzag line using a table
local zigzagLine = {100,100, 200,200, 300,100, 400,200}

function love.draw()
	love.graphics.line(zigzagLine)
end
Generate and draw a grid
local cellSize  = 30 -- Width and height of cells.
local gridLines = {}

local windowWidth, windowHeight = love.graphics.getDimensions()

-- Vertical lines.
for x = cellSize, windowWidth, cellSize do
	local line = {x, 0, x, windowHeight}
	table.insert(gridLines, line)
end
-- Horizontal lines.
for y = cellSize, windowHeight, cellSize do
	local line = {0, y, windowWidth, y}
	table.insert(gridLines, line)
end

function love.draw()
	love.graphics.setLineWidth(2)

	for i, line in ipairs(gridLines) do
		love.graphics.line(line)
	end
end


Draw temp line with mouse
tempLine = {}


local function drawLine (line)

end

function love.draw()
--	check if line has 4 coordinates:
	if #tempLine > 3 then
		love.graphics.line (tempLine)
	end
end

function love.mousepressed(x, y)
--	set first point:
	tempLine = {x, y}
end

function love.mousemoved (x, y)
--	update second point:
	tempLine[3] = x
	tempLine[4] = y
end

function love.mousereleased ( x, y)
-- get your temp line coordinates as:
--	local x1, y1 = tempLine[1], tempLine[2]
--	local x2, y2 = tempLine[3], tempLine[4]

-- clean temp line:	
	tempLine = {}
end

## love.graphics.circle


All Versions
Page Discussion View source History
love.graphics.circle
Draws a circle.

Function
Synopsis
love.graphics.circle( mode, x, y, radius )
Arguments
DrawMode mode
How to draw the circle. Has 2 modes: "fill" and "line".
number x
The position of the center along x-axis.
number y
The position of the center along y-axis.
number radius
The radius of the circle.
Returns
Nothing.

Function
Synopsis
love.graphics.circle( mode, x, y, radius, segments )
Arguments
DrawMode mode
How to draw the circle.
number x
The position of the center along x-axis.
number y
The position of the center along y-axis.
number radius
The radius of the circle.
number segments
The number of segments used for drawing the circle. Note: The default variable for the segments parameter varies between different versions of LÖVE.
Returns
Nothing.

Examples
```lua
The effect of the segment argument
function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", 300, 300, 50, 100) -- Draw white circle with 100 segments.
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", 300, 300, 50, 5)   -- Draw red circle with five segments.
end
```


## love.graphics.polygon

Draws a polygon. Following the mode argument, this function can accept multiple numeric arguments or a single table of numeric arguments. In either case the arguments are interpreted as alternating x and y coordinates of the polygon's vertices. When in fill mode, the polygon must be convex and simple or rendering artifacts may occur. 


```lua  
    -- mode: How to draw the polygon.
    -- ...: The vertices of the polygon.
    -- Returns Nothing.
    love.graphics.polygon( mode, ... )
```

### Examples
Two ways of drawing the same triangle drawn using love.graphics.polygon
This example shows how to give the coordinates explicitly and how to pass a table argument.

```lua
-- Giving the coordinates directly.
love.graphics.polygon("fill", 100,100, 200,100, 150,200)

-- Defining a table with the coordinates.
-- This table could be built incrementally too.
local vertices = {100,100, 200,100, 150,200}

-- Passing the table to the function as a second argument.
love.graphics.polygon("fill", vertices)
```
Draw concave polygon
```lua
local vertices  = {100,100, 200,100, 200,200, 300,200, 300,300, 100,300} -- Concave "L" shape.
local triangles = love.math.triangulate(vertices)

for i, triangle in ipairs(triangles) do
    love.graphics.polygon("fill", triangle)
end
```
Draw rotated rectangle
This is one way to draw a rotated rectangle.

```lua
function drawRotatedRectangle(mode, x, y, width, height, angle)
	local cosa, sina = math.cos(angle), math.sin(angle)

	local dx1, dy1 = width*cosa,   width*sina
	local dx2, dy2 = -height*sina, height*cosa

	local px1, py1 = x,         y
	local px2, py2 = x+dx1,     y+dy1
	local px3, py3 = x+dx1+dx2, y+dy1+dy2
	local px4, py4 = x+dx2,     y+dy2
	
	love.graphics.polygon(mode, px1,py1, px2,py2, px3,py3, px4,py4)
end
```
Draw rotated boid (directed triangle)

Triangle drawn using love.graphics.polygon
```lua
function drawBoid (mode, x, y, length, width , angle) -- position, length, width and angle
    love.graphics.push()
    love.graphics.translate(x, y)
    love.graphics.rotate( angle )
    love.graphics.polygon(mode, -length/2, -width /2, -length/2, width /2, length/2, 0)
    love.graphics.pop() 
end
x, y, angle = 200, 100, math.pi/4
drawBoid ("fill", x, y, 20, 10 , angle)
```
Pixel-perfect Hexadecagon

Hexadecagon using love.graphics.polygon
For better result it can be used with "rough" line style and "nearest" canvas filter.
```lua
function hexadecagon (mode, x, y, radius) -- same as love.graphics.circle
	local w1 = math.atan(2/5) -- ratio of two integers, 21.8 degrees 
	local w2 = math.atan(5/5) -- ratio of two integers, 45 degrees 
	local k1 = (w1+w2)/2
	local k2 = math.cos((w2-w1)/2)
	local a = radius
	local b = radius*math.tan (w1 / 2)
	local c = radius*math.cos (k1) / k2
	local d = radius*math.sin (k1) / k2
	local vertices = {
		 a, b,  c, d,  d, c,  b, a, 
		-b, a, -d, c, -c, d, -a, b, 
		-a,-b, -c,-d, -d,-c, -b,-a, 
		 b,-a,  d,-c,  c,-d,  a,-b}
	love.graphics.translate (x+0.5, y+0.5)
	love.graphics.polygon (mode, vertices)
	love.graphics.translate (-x-0.5, -y-0.5)
end

canvas = love.graphics.newCanvas(width, height)
canvas:setFilter("nearest", "nearest")
love.graphics.setLineStyle("rough")
love.graphics.setCanvas (canvas)
	love.graphics.setColor (0,1,0)
	hexadecagon ("line", 200, 100, 60)
love.graphics.setCanvas ()

function love.draw()
	love.graphics.setColor (1,1,1)
	love.graphics.draw (canvas)
end
```




## love.graphic.print


All Versions
Page Discussion View source History
love.graphics.print
Draws text on screen. If no Font is set, one will be created and set (once) if needed.

As of LOVE 0.7.1, when using translation and scaling functions while drawing text, this function assumes the scale occurs first. If you don't script with this in mind, the text won't be in the right position, or possibly even on screen.

love.graphics.print and love.graphics.printf both support UTF-8 encoding. You'll also need a proper Font for special characters.

In versions prior to 11.0, color and byte component values were within the range of 0 to 255 instead of 0 to 1.

O.png	Text may appear blurry if it's rendered at non-integer pixel locations.	 


Function
Synopsis
love.graphics.print( text, x, y, r, sx, sy, ox, oy, kx, ky )
Arguments
string text
The text to draw.
number x (0)
The position to draw the object (x-axis).
number y (0)
The position to draw the object (y-axis).
number r (0)
Orientation (radians).
number sx (1)
Scale factor (x-axis).
number sy (sx)
Scale factor (y-axis).
number ox (0)
Origin offset (x-axis).
number oy (0)
Origin offset (y-axis).
Available since LÖVE 0.8.0
number kx (0)
Shearing factor (x-axis).
number ky (0)
Shearing factor (y-axis).
Returns
Nothing.

Function
Available since LÖVE 11.0
This variant is not supported in earlier versions.
Synopsis
love.graphics.print( text, font, x, y, r, sx, sy, ox, oy, kx, ky )
Arguments
string text
The text to draw.
Font font
The Font object to use.
number x (0)
The position of the text on the x-axis.
number y (0)
The position of the text on the y-axis.
number angle (0)
The orientation of the text in radians.
number sx (1)
Scale factor on the x-axis.
number sy (sx)
Scale factor on the y-axis.
number ox (0)
Origin offset on the x-axis.
number oy (0)
Origin offset on the y-axis.
number kx (0)
Shearing / skew factor on the x-axis.
number ky (0)
Shearing / skew factor on the y-axis.
Returns
Nothing.

Function
Available since LÖVE 0.10.0
This variant is not supported in earlier versions.
Synopsis
love.graphics.print( coloredtext, x, y, angle, sx, sy, ox, oy, kx, ky )
Arguments
table coloredtext
A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.
table color1
A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.
string string1
A string of text which has a color specified by the previous color.
table color2
A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.
string string2
A string of text which has a color specified by the previous color.
tables and strings ...
Additional colors and strings.
number x (0)
The position of the text on the x-axis.
number y (0)
The position of the text on the y-axis.
number angle (0)
The orientation of the text in radians.
number sx (1)
Scale factor on the x-axis.
number sy (sx)
Scale factor on the y-axis.
number ox (0)
Origin offset on the x-axis.
number oy (0)
Origin offset on the y-axis.
number kx (0)
Shearing / skew factor on the x-axis.
number ky (0)
Shearing / skew factor on the y-axis.
Returns
Nothing.

Notes
The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.

Function
Available since LÖVE 11.0
This variant is not supported in earlier versions.
Synopsis
love.graphics.print( coloredtext, font, x, y, angle, sx, sy, ox, oy, kx, ky )
Arguments
table coloredtext
A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.
table color1
A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.
string string1
A string of text which has a color specified by the previous color.
table color2
A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.
string string2
A string of text which has a color specified by the previous color.
tables and strings ...
Additional colors and strings.
Font font
The Font object to use.
number x (0)
The position of the text on the x-axis.
number y (0)
The position of the text on the y-axis.
number angle (0)
The orientation of the text in radians.
number sx (1)
Scale factor on the x-axis.
number sy (sx)
Scale factor on the y-axis.
number ox (0)
Origin offset on the x-axis.
number oy (0)
Origin offset on the y-axis.
number kx (0)
Shearing / skew factor on the x-axis.
number ky (0)
Shearing / skew factor on the y-axis.
Returns
Nothing.

Notes
The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.

Function
Available since LÖVE 11.0
This variant is not supported in earlier versions.
Synopsis
love.graphics.print( text, transform )
Arguments
string text
The text to draw.
Transform transform
Transformation object.
Returns
Nothing.

Function
Available since LÖVE 11.0
This variant is not supported in earlier versions.
Synopsis
love.graphics.print( text, font, transform )
Arguments
string text
The text to draw.
Font font
The Font object to use.
Transform transform
Transformation object.
Returns
Nothing.

Function
Available since LÖVE 11.0
This variant is not supported in earlier versions.
Synopsis
love.graphics.print( coloredtext, transform )
Arguments
table coloredtext
A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.
table color1
A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.
string string1
A string of text which has a color specified by the previous color.
table color2
A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.
string string2
A string of text which has a color specified by the previous color.
tables and strings ...
Additional colors and strings.
Transform transform
Transformation object.
Returns
Nothing.

Notes
The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.

Function
Available since LÖVE 11.0
This variant is not supported in earlier versions.
Synopsis
love.graphics.print( coloredtext, font, transform )
Arguments
table coloredtext
A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.
table color1
A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.
string string1
A string of text which has a color specified by the previous color.
table color2
A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.
string string2
A string of text which has a color specified by the previous color.
tables and strings ...
Additional colors and strings.
Font font
The Font object to use.
Transform transform
Transformation object.
Returns
Nothing.

Notes
The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.

Examples
A lame example
function love.draw()
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print("This is a pretty lame example.", 10, 200)
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.print("This lame example is twice as big.", 10, 250, 0, 2, 2)
    love.graphics.setColor(0, 0, 1, 1)
    love.graphics.print("This example is lamely vertical.", 300, 30, math.pi/2)
end
Draw centered text
function drawCenteredText(rectX, rectY, rectWidth, rectHeight, text)
	local font       = love.graphics.getFont()
	local textWidth  = font:getWidth(text)
	local textHeight = font:getHeight()
	love.graphics.print(text, rectX+rectWidth/2, rectY+rectHeight/2, 0, 1, 1, textWidth/2, textHeight/2)
end

function love.draw()
	local x, y = 100, 60
	local w, h = 400, 40
	love.graphics.rectangle("line", x, y, w, h)
	drawCenteredText(x, y, w, h, "I print my LÖVE")
end
Notes
In version 0.8.0 and older, love.graphics.print stops at the first '\0' (null) character. This can bite you if you are appending keystrokes to form your string, as some of those are multi-byte unicode characters which will likely contain null bytes.

See Also
love.graphics
love.graphics.printf
Font
love.graphics.newFont
love.graphics.setFont
love.graphics.getFont




Other Languages
Dansk – Deutsch – English – Español – Français – Indonesia – Italiano – Lietuviškai – Magyar – Nederlands – Polski – Português – Română – Slovenský – Suomi – Svenska – Türkçe – Česky – Ελληνικά – Български – Русский – Српски – Українська – עברית – ไทย – 日本語 – 正體中文 – 简体中文 – Tiếng Việt – 한국어
More info

Category: Functions
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
This page was last edited on 11 August 2021, at 00:02. Content is available under GNU Free Documentation License 1.3 unless otherwise noted. Privacy policy About LOVE Disclaimers