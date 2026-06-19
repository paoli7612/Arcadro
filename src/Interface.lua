function Interface()
    local interface = {
    }
    function interface.update(dt)

    end

    function interface.draw()
        love.graphics.setColor(1, 1, 1, 0.5)
        love.graphics.rectangle("fill", 100, 100, love.graphics.getWidth()-200, love.graphics.getHeight()-200)
        love.graphics.print("Interface is visible", 10, 10)

        boss.player.inventory.draw(120, 130)
    end

    function interface.keypressed(key, scancode, isrepeat)
    end

    return interface
end

return Interface
