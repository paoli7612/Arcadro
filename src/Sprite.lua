function Sprite(boss, x, y)
    local sprite = {
        x = x,
        y = y
    }

    function sprite:draw()
        love.graphics.polygon('fill', totile(sprite.x, sprite.y))
    end

    function sprite:update()
        
    end

    function sprite:print()
        return "Sprite ("..sprite.x.." "..sprite.y..")"
    end


    return sprite
end

return Sprite