local Sprite = require('Sprites/Sprite')

function Wall(boss, x, y)
    local sprite = Sprite(boss, x, y,   'gray')

    return sprite
end

return Wall
