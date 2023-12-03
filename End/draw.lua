DrawEnd = {}

function DrawEnd.drawEnd()
    love.graphics.setColor(0.1, 0.1, 0.1, 0.9)
    love.graphics.rectangle("fill", (love.graphics.getWidth() / 2) - 125, (love.graphics.getHeight() / 2) - 50, 250, 100)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(logotype, 200, 50, 0, 0.5, 0.5)

    love.graphics.print("Score: " .. score, scoreFont, 310, 285, 0, 1, 1, 0, 0, 0, 0)

    love.graphics.print("Appuyez sur ESPACE pour quitter le jeu.", scoreFont, 150, 400, 0, 1, 1, 0, 0, 0, 0)
end
