local itemsJson = love.filesystem.read('items.json')
local loadedImages = {}

local function loadItemImage(code)
    local codePosition = itemsJson:find('"' .. code .. '"', 1, true)
    if not codePosition then
        error('Item code not found in items.json: ' .. code)
    end

    local imageName = itemsJson:match('"image"%s*:%s*"([^"]+)"', codePosition)
    if not imageName then
        error('Image not found for item: ' .. code)
    end

    if not loadedImages[imageName] then
        loadedImages[imageName] = love.graphics.newImage('img/' .. imageName .. '.png')
    end

    return loadedImages[imageName]
end

function Item(code, x, y)
    local item = {}
    item.code = code
    item.x = x
    item.y = y
    item.image = loadItemImage(code)

    function item.draw()
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(
            item.image,
            item.x * config.TILE_SIZE,
            item.y * config.TILE_SIZE,
            0,
            config.TILE_SIZE / item.image:getWidth(),
            config.TILE_SIZE / item.image:getHeight()
        )
    end

    return item
end

return Item
