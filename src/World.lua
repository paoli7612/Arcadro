function World()
    local world = {}

    function conv(x, y)
        local sx = (x - y) * w
        local sy = -(x + y) * h

        return sx + WIDTH / 2, sy + HEIGHT / 2
    end

    function totile(x, y)
        local a, b = conv(x, y)
        return {
            a-w, b,
            a, b+h,
            a+w, b,
            a, b-h
        }
    end

    function world.draw_tile(x, y)
        love.graphics.polygon('line', totile(x, y))
        --local sx, sy =  conv(x, y)
        --love.graphics.print(x.." "..y,sx, sy, 0, 1, 1, 10, 10)
    end

    function world:draw()
        for y=-5, 5, 1 do
            for x=-5, 5, 1 do
                world.draw_tile(x, y)
            end
        end
    end

    return world
end

return World