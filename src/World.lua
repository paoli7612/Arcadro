function totile(x, y)
    local a, b = conv(x, y)
    return {
        a-w+1, b,
        a+1, b+h,
        a+w, b+1,
        a, b-h+1
    }
end

function World()
    local world = {}
    world.matrix = {}

    local size = 11 -- deve essere dispari
    local min = -10
    local max = 10

    -- riempi tutto di muri
    for i = min, max do
        world.matrix[i] = {}
        for j = min, max do
            world.matrix[i][j] = 1
        end
    end

    local dirs = {
        { 2, 0 },
        { -2, 0 },
        { 0, 2 },
        { 0, -2 }
    }

    local function shuffle(t)
        for i = #t, 2, -1 do
            local r = love.math.random(i)
            t[i], t[r] = t[r], t[i]
        end
    end

    local function carve(x, y)
        world.matrix[x][y] = 0

        shuffle(dirs)

        for _, d in ipairs(dirs) do
            local nx = x + d[1]
            local ny = y + d[2]

            if nx > min and nx < max and ny > min and ny < max then
                if world.matrix[nx][ny] == 1 then
                    -- apre il muro tra cella attuale e prossima
                    world.matrix[x + d[1] / 2][y + d[2] / 2] = 0
                    carve(nx, ny)
                end
            end
        end
    end

    carve(-9, -9)

    function conv(x, y)
        local sx = (x - y) * w
        local sy = -(x + y) * h

        return sx + WIDTH / 2, sy + HEIGHT / 2
    end


    function world.draw_tile(x, y)
        love.graphics.polygon('line', totile(x, y))
        --local sx, sy =  conv(x, y)
        --love.graphics.print(x.." "..y,sx, sy, 0, 1, 1, 10, 10)
    end

    function world:draw()
        love.graphics.setColor(1,1,1)
        for y=-10, 10, 1 do
            for x=-10, 10, 1 do
                world.draw_tile(x, y)
                if world.matrix[y][x] == 1 then
                    love.graphics.polygon('fill', totile(x, y))
                end
            end
        end
    end

    function world:empty(x, y)
        print(y, x)
        return world.matrix[y][x] == 0
    end

    return world
end

return World