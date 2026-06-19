function Inventory()
    local inventory = {}
    local items = {}

    function inventory.add(item)
        table.insert(items, item)
    end

    function inventory.draw(x, y)
        local slotSize = config.TILE_SIZE * 2
        local spacing = 8
        local columns = 8

        for i, item in ipairs(items) do
            local index = i - 1
            local column = index % columns
            local row = math.floor(index / columns)
            local slotX = x + column * (slotSize + spacing)
            local slotY = y + row * (slotSize + spacing)

            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", slotX, slotY, slotSize, slotSize)

            love.graphics.setColor(1, 1, 1)
            love.graphics.draw(
                item.image,
                slotX,
                slotY,
                0,
                slotSize / item.image:getWidth(),
                slotSize / item.image:getHeight()
            )
        end
    end

    return inventory
end

return Inventory
