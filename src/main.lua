local Sprite = require('Sprite')
local player

function love.load()
    player = Sprite(100, 100)
end

function love.update(dt)
    player.update(dt)
end

function love.draw()
    love.graphics.print(player.print(), 20, 20)
    player.draw()
end