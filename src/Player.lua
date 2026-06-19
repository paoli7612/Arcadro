local Sprite = require('Sprite')

function Player(boss, x, y)
    local player = Sprite(boss, x, y)
    player.moveTimer = 0
    player.moveDelay = 0.12

    function player.move(dx, dy)
        local newX = player.x + dx
        local newY = player.y + dy

        if player.boss.world.empty(newX, newY) then
            player.x = newX
            player.y = newY
            player.pickup_item()
        end
    end

    function player.update(dt)
        player.moveTimer = math.max(0, player.moveTimer - dt)

        if player.moveTimer > 0 then
            return
        end

        if love.keyboard.isDown('up') then
            player.move(0, -1)
        elseif love.keyboard.isDown('down') then
            player.move(0, 1)
        elseif love.keyboard.isDown('left') then
            player.move(-1, 0)
        elseif love.keyboard.isDown('right') then
            player.move(1, 0)
        else
            return
        end

        player.moveTimer = player.moveDelay
    end

    function player.keypressed(key)
        if key == 'up' then
            player.move(0, -1)
        elseif key == 'down' then
            player.move(0, 1)
        elseif key == 'left' then
            player.move(-1, 0)
        elseif key == 'right' then
            player.move(1, 0)
        else
            return
        end

        player.moveTimer = player.moveDelay
    end

    return player
end

return Player
