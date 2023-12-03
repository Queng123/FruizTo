DrawGame = {}

function DrawGame.drawGame()
    love.graphics.setColor(0.1, 0.1, 0.1, 0.9)
    love.graphics.rectangle("fill", gameAreaX, gameAreaY, gameAreaWidth, gameAreaHeight)

    love.graphics.setColor(colors.Green)
    love.graphics.rectangle("fill", gameAreaX + 50, platformY - 20, gameAreaWidth - 100, platformHeight)
    love.graphics.rectangle("fill", secondPlatformX, gameAreaY + 60, secondPlatformWidth, gameAreaHeight - 100)
    love.graphics.rectangle("fill", thirdPlatformX + 70, gameAreaY + 60, thirdPlatformWidth, gameAreaHeight - 100)

    love.graphics.setColor(colors.Red)
    love.graphics.polygon("fill", triangleVertices)

    love.graphics.setColor(1, 1, 1)
    for i, ball in ipairs(balls) do
        local scaleX = ball.size * 2 / (ball.texture:getWidth() - 30)
        local scaleY = ball.size * 2 / (ball.texture:getHeight() - 30)
        love.graphics.draw(ball.texture, ball.body:getX(), ball.body:getY(), 0, scaleX, scaleY, ball.texture:getWidth()/2, ball.texture:getHeight()/2)
    end
end