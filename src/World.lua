local Item = require('Item')
local Wall = require('Sprites/Wall')
local Npc = require('Sprites/Npc')

function World(boss)
    local world = {}
    world.matrix = {}
    world.items = {}
    world.walls = {}
    world.npcs = {}

    function world.load()
        for y=0, config.WORLD_HEIGHT_TILES - 1, 1 do
            world.matrix[y] = {}
            world.items[y] = {}
            for x=0, config.WORLD_WIDTH_TILES - 1, 1 do
                world.matrix[y][x] = 0
            end
        end
        -- new item
        world.new_item('a001', love.math.random(0, config.WORLD_WIDTH_TILES - 1), love.math.random(0, config.WORLD_HEIGHT_TILES - 1))
        -- new walls
        for i=1, 10, 1 do
            local x = love.math.random(3, config.WORLD_WIDTH_TILES - 9)
            local y = love.math.random(3, (config.WORLD_HEIGHT_TILES - 3)/2)*2
            for j = 1, 6, 1 do
                world.walls[#world.walls + 1] = Wall(boss, x, y)
                x = x + 1
            end
        end
        -- new NPCs
        for i=1, 5, 1 do
            local x = love.math.random(0, config.WORLD_WIDTH_TILES - 1)
            local y = love.math.random(0, config.WORLD_HEIGHT_TILES - 1)
            if world.empty(x, y) then
                world.npcs[#world.npcs + 1] = Npc(boss, x, y, true)
            end
        end
    end

    function world.new_item(code, x, y)
        if not world.items[y] then
            world.items[y] = {}
        end
        world.items[y][x] = Item(code, x, y)
    end

    function world.update(dt)
        for _, npc in pairs(world.npcs) do
            npc.update(dt)
        end
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
        for _, wall in pairs(world.walls) do
            wall.draw()
        end
        for _, npc in pairs(world.npcs) do
            npc.draw()
        end
    end

    function world.empty(x, y)
        if x < 0 or x >= config.WORLD_WIDTH_TILES or
           y < 0 or y >= config.WORLD_HEIGHT_TILES then
            return false
        end

        for _, wall in pairs(world.walls) do
            if wall.x == x and wall.y == y then
                return false
            end
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
