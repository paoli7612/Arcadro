function Sprite(boss, x, y)
    local sprite = {
        boss = boss,
        x = x,
        y = y
    }

    function sprite.draw()
        love.graphics.rectangle('fill', sprite.x*config.TILE_SIZE, sprite.y*config.TILE_SIZE, config.TILE_SIZE, config.TILE_SIZE)
    end

    function sprite.pickup_item()
        return sprite.boss.world.remove_item(sprite.x, sprite.y)
    end

    function sprite.update(dt)
    end

    function sprite.print()
        return "Sprite ("..sprite.x.." "..sprite.y..")"
    end

    return sprite
end

return Sprite
