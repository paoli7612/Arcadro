local Sprite = require('Sprites/Sprite')

function Npc(boss, x, y, hostile)
    local npc = Sprite(boss, x, y, hostile and 'red' or 'white')
    npc.hostile = hostile or false

    local timer = 0
    function npc.update(dt)
        if not npc.hostile then
            return
        end

        -- Gli NPC ostili si muovono verso il giocatore.
        timer = timer + dt
        if timer >= 0.5 then
            timer = 0
            if boss.player.x > npc.x then
                npc.x = npc.x + 1
            elseif boss.player.x < npc.x then
                npc.x = npc.x - 1
            elseif boss.player.y > npc.y then
                npc.y = npc.y + 1
            elseif boss.player.y < npc.y then
                npc.y = npc.y - 1
            end
        end
    end

    function npc.talk()
        if npc.hostile then
            return nil
        end

        return "Ciao!"
    end

    return npc
end

return Npc
