local Sprite = require('Sprite')
local World = require('World')

function Boss()
    local boss = {
        world = World()
    }

    function boss:load()
        boss.player = Sprite(boss, 0, 0)
    end

    function boss:draw()
        boss.world.draw()
        boss.player.draw()
    end

    function boss:keypressed(key, scancode, isrepeat)
        if key == 'w' then
            boss.player.y = boss.player.y + 1
        elseif key == 'a' then
            boss.player.x = boss.player.x - 1
        elseif key == 's' then
            boss.player.y = boss.player.y - 1
        elseif key == 'd' then
            boss.player.x = boss.player.x + 1
        end
    end

    return boss
end

return Boss