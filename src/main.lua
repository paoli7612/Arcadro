W = 64
H = 48
w = W/2
h = H/2
WIDTH = W * 20
HEIGHT = H * 16
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

