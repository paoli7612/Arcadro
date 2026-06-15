function Sprite(x, y)
    local sprite = {
        x = x,
        y = y
    }

    function sprite:draw()
        love.graphics.polygon('fill', {x-30, y, x, y+10, x+30, y, x, y-10})
        --love.graphics.circle('fill', x, y, 40)
    end

    function sprite:update()
        
    end

    function sprite:print()
        return "Sprite ("..sprite.x.." "..sprite.y..")"
    end


    return sprite
end

return Sprite