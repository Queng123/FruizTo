DrawGame = {}

function LoadTextures()
    for _, ballType in pairs(ballTypesList) do
        ballType.texture = love.graphics.newImage(ballType.texturePath)
    end
end

function DrawGame.displayBallTypesInQueue()
    local image_x = 0
    for i, ballType in ipairs(ballQueue) do
        local image = love.graphics.newImage(ballType.texturePath)
        love.graphics.draw(image, 120 + image_x, 50, 0, 0.13, 0.13)
        image_x = 120
    end
end

function DrawGame.drawGame()
    love.graphics.setColor(0.1, 0.1, 0.1, 0.9)
    love.graphics.rectangle("fill", gameAreaX, 20, 220, 120)
    love.graphics.rectangle("fill", gameAreaX, gameAreaY, gameAreaWidth, gameAreaHeight)
    love.graphics.rectangle("fill", 480, 20, 220, 120)

    love.graphics.setColor(colors.Green)
    love.graphics.rectangle("fill", gameAreaX + 50, platformY - 20, gameAreaWidth - 100, platformHeight)
    love.graphics.rectangle("fill", secondPlatformX, gameAreaY + 60, secondPlatformWidth, gameAreaHeight - 100)
    love.graphics.rectangle("fill", thirdPlatformX + 70, gameAreaY + 60, thirdPlatformWidth, gameAreaHeight - 100)

    love.graphics.setColor(colors.Red)
    love.graphics.polygon("fill", triangleVertices)

    love.graphics.setColor(1, 1, 1)

    for i, newBall in ipairs(newBalls) do
        local scaleX = newBall.size * 2 / (newBall.texture:getWidth() - 30)
        local scaleY = newBall.size * 2 / (newBall.texture:getHeight() - 30)
        love.graphics.draw(newBall.texture, newBall.body:getX(), newBall.body:getY(), 0, scaleX, scaleY, newBall.texture:getWidth()/2, newBall.texture:getHeight()/2)
    end

    love.graphics.print("Score: " .. score, scoreFont, 500, 60, 0, 1, 1, 0, 0, 0, 0)

    DrawGame.displayBallTypesInQueue()
end