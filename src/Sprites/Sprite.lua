local Inventory = require("Inventory")

function Sprite(boss, x, y, color)
    local sprite = {
        boss = boss,
        x = x,
        y = y,
        color = color,
        inventory = Inventory()
    }

    function sprite.draw()
        if sprite.color == 'white' then 
            love.graphics.setColor(1,1,1)
        elseif sprite.color == 'blue' then
            love.graphics.setColor(0,0,1)
        elseif sprite.color == 'red' then
            love.graphics.setColor(1,0,0)
        elseif sprite.color == 'gray' then
            love.graphics.setColor(0.5,0.5,0.5)
        end
        love.graphics.rectangle('fill', sprite.x*config.TILE_SIZE, sprite.y*config.TILE_SIZE, config.TILE_SIZE, config.TILE_SIZE)
    end

    function sprite.pickup_item()
        local item = sprite.boss.world.remove_item(sprite.x, sprite.y)
        if item then
            sprite.inventory.add(item)
        end
        return item
    end

    function sprite.update(dt)
    end

    function sprite.print()
        return "Sprite ("..sprite.x.." "..sprite.y..")"
    end

    return sprite
end

return Sprite
