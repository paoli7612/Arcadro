W = 64
H = 48
w = W/2
h = H/2
WIDTH = W * 20
HEIGHT = H * 16

local Sprite = require('Sprite')
local World = require('World')

local player, world

function love.load()
    love.window.setMode(WIDTH, HEIGHT)
    player = Sprite(100, 100)
    world = World()
end

function love.update(dt)
    player.update(dt)
end

function love.draw()
    world.draw()
    love.graphics.print(player.print(), 20, 20)
    player.draw()

end

