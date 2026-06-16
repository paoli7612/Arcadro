local Sprite = require('Sprite')
local World = require('World')

function Boss()
    local boss = {
        world = World()
    }

    function boss:load()
        boss.player = Sprite(boss, 1, 0)
    end

    function boss:draw()
        boss.world.draw()
        boss.player.draw()
    end

    function boss:keypressed(key, scancode, isrepeat)
        local x = boss.player.x
        local y = boss.player.y
        if key == 'up' then y = y + 1
        elseif key == 'down' then y = y - 1
        elseif key == 'left' then x = x - 1
        elseif key == 'right' then x = x + 1 end
        if boss.world.empty(1, x, y) then
            boss.player.x = x
            boss.player.y = y
        end
    end

    return boss
end

return Boss