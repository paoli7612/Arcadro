function Sprite(x, y)
    local sprite = {
        x = x,
        y = y
    }

    function sprite:draw()
        love.graphics.polygon('fill', {x-30, y, x, y+10, x+30, y, x, y-10})
    end

    function sprite.update()
        
    end

    return sprite
end

return Sprite