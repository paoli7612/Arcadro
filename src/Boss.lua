local Sprite = require('Sprite')
local World = require('World')

function Boss()
    local boss = {
        world = World()
    }

    function boss:load()
        boss.player = Sprite(boss, 0, 0)
    end

    function boss.draw()
        boss.world.draw()
        boss.player.draw()
        print(boss.player.x)
    end

    return boss
end

return Boss