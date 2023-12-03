DrawStart = {}

function DrawStart.drawStart()
    love.graphics.draw(logotype, 0, 50, 0, logotypeWidth / logotype:getWidth(), logotypeHeight / logotype:getHeight())
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Appuyez sur ESPACE pour commencer", welcomeFont, (800 - welcomeFont:getWidth("Appuyez sur ESPACE pour commencer")) / 2, 500, 0, 1, 1, 0, 0, 0, 0)
    love.graphics.setColor(1, 1, 1)
end