local Sprite = require('Sprite')
local player

function love.load()
    player = Sprite(100, 100)
end

function love.update(dt)
    player.update(dt)
end

function love.draw()
    love.graphics.print("Ciao mondo", 23, 230)
    player.draw()
end