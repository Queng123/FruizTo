DrawMenu = {}

function DrawMenu.drawMenu()
    love.graphics.draw(logotype, 0, 50, 0, logotypeWidth / logotype:getWidth(), logotypeHeight / logotype:getHeight())
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Press SPACE to start", font, (800 - font:getWidth("Press SPACE to start")) / 2, 500, 0, 1, 1, 0, 0, 0, 0)
    love.graphics.setColor(1, 1, 1)
end
