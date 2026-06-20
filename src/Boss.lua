local Player = require('Sprites/Player')
local World = require('World')
local Interface = require('Interface')

function Boss()
    local boss = {
        interface = Interface(boss),
        running = true
    }
    boss.world = World(boss)

    function boss.load()
        boss.player = Player(boss, 4, 4)
    end

    function boss.draw()
        boss.world.draw()
        boss.player.draw()
        if not boss.running then
            boss.interface.draw()
        end
    end

    function boss.update(dt)
        boss.world.update(dt)
        if boss.running then
            boss.player.update(dt)
        else
            boss.interface.update(dt)
        end
    end

    function boss.keypressed(key, scancode, isrepeat)
        if key == 'i' then
            boss.running = not boss.running
        end

        if boss.running then
            boss.player.keypressed(key, scancode, isrepeat)
        else
            boss.interface.keypressed(key, scancode, isrepeat)
        end
    end

    return boss
end

return Boss
