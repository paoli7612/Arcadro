config = require('config')
local Boss = require('Boss')

function love.load()
    love.window.setMode(config.WINDOW_WIDTH, config.WINDOW_HEIGHT)
    boss = Boss()
    boss.load()
end

function love.update(dt)
    boss.update(dt)
end

function love.draw()
    boss.draw()
end

function love.keypressed( key, scancode, isrepeat )
    boss.keypressed(key, scancode, isrepeat)
end
