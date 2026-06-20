local Item = require('Item')

function World()
    local world = {}
    world.matrix = {}
    world.items = {}

    function world.load()
        for y=0, config.WORLD_HEIGHT_TILES - 1, 1 do
            world.matrix[y] = {}
            world.items[y] = {}
            for x=0, config.WORLD_WIDTH_TILES - 1, 1 do
                world.matrix[y][x] = 0
            end
        end
        world.new_item('a001', love.math.random(0, config.WORLD_WIDTH_TILES - 1), love.math.random(0, config.WORLD_HEIGHT_TILES - 1))
    end

    function world.new_item(code, x, y)
        if not world.items[y] then
            world.items[y] = {}
        end
        world.items[y][x] = Item(code, x, y)
    end

    function world.draw()
        love.graphics.setColor(1,1,1)
        for y=0, config.WORLD_HEIGHT_TILES - 1, 1 do
            love.graphics.line(0, y*config.TILE_SIZE, config.WORLD_WIDTH_TILES*config.TILE_SIZE, y*config.TILE_SIZE)
        end
        for x=0, config.WORLD_WIDTH_TILES - 1, 1 do
            love.graphics.line(x*config.TILE_SIZE, 0, x*config.TILE_SIZE, config.WORLD_HEIGHT_TILES*config.TILE_SIZE)
        end
        for _, row in pairs(world.items) do
            for _, item in pairs(row) do
                item.draw()
            end
        end
    end

    function world.empty(x, y)
        print("Checking if tile is empty at. ", x, y)
        if x < 0 or x >= config.WORLD_WIDTH_TILES or
           y < 0 or y >= config.WORLD_HEIGHT_TILES then
            return false
        end
        return world.matrix[y][x] == 0
    end

    function world.item(x, y)
        if world.items[y] then
            return world.items[y][x]
        end
        return nil
    end

    function world.remove_item(x, y)
        if not world.items[y] then
            return nil
        end

        local item = world.items[y][x]
        world.items[y][x] = nil
        return item
    end

    world.load()
    return world
end

return World
