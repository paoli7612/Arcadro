W = 48
H = 32
w = W/2
h = H/2
WIDTH = W * 20
HEIGHT = H * 18
local Boss = require('Boss')

function love.load()
    love.window.setMode(WIDTH, HEIGHT)
    boss = Boss()
    boss.load()
end

function love.update(dt)
end

function love.draw()
    boss.draw()
    boss.player.print()
end


function love.keypressed( key, scancode, isrepeat )
    boss.keypressed(key, scancode, isrepeat)
end
