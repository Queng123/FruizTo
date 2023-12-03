UpdateGame = {}

newBalls = {}

require "Game/load"

function UpdateGame.getRandomBallType()
    local randomIndex = math.random(1, 3) -- Obtient un indice aléatoire
    return ballTypesList[randomIndex] -- Retourne le type de balle à cet indice
end

function UpdateGame.handleBallQueue(newBallType)
    if #ballQueue == 2 then
        table.remove(ballQueue, 1)
    end
    table.insert(ballQueue, newBallType)
end

function UpdateGame.UpdateCursor(dt)
    cursorX = cursorX + cursorDirection * cursorSpeed * dt

    if cursorX <= gameAreaX + 80 then
        cursorX = gameAreaX + 80
        cursorDirection = 1
    elseif cursorX >= gameAreaX + gameAreaWidth - 80 then
        cursorX = gameAreaX + gameAreaWidth - 80
        cursorDirection = -1
    end
    
    triangleVertices = {
        cursorX, cursorY,
        cursorX - 10, cursorY - 20,
        cursorX + 10, cursorY - 20
    }
end

function UpdateGame.mergedBall(ball1, ball2, x, y)
    local ballMergedType = BallTypes.Forretress

    if ball1.name == ball2.name then
        if ball1.name == "Forretress" then
            ballMergedType = BallTypes.Jigglypuff
        elseif ball1.name == "Jigglypuff" then
            ballMergedType = BallTypes.Mareep
        elseif ball1.name == "Mareep" then
            ballMergedType = BallTypes.Solrock
        elseif ball1.name == "Solrock" then
            ballMergedType = BallTypes.Whirlipede
        elseif ball1.name == "Whirlipede" then
            ballMergedType = BallTypes.Forretress
        end
    end

    local text = ball1.name .. " + " .. ball2.name .. " = " .. ballMergedType.texturePath
    love.window.setTitle(text)
    -- LoadGame.spawnNewBall(ballMergedType, x, y)
end

function UpdateGame.RemoveBalls()
    local markedForRemoval2 = {}

    for i, ball1 in ipairs(newBalls) do
        for j, ball2 in ipairs(newBalls) do
            if i ~= j and areBallsTouching(ball1, ball2) and ball1.name == ball2.name then
                UpdateGame.mergedBall(ball1, ball1, (ball1.body:getX() + ball2.body:getX()) / 2, (ball1.body:getY() + ball2.body:getY()) / 2)
                markedForRemoval2[i] = true
                markedForRemoval2[j] = true
            end
        end
    end

    for i = #newBalls, 1, -1 do
        if markedForRemoval2[i] then
            local ball = table.remove(newBalls, i)
            if ball then
                ball.body:destroy()
            end
        end
    end
end

function UpdateGame.updateGame(dt)
    UpdateGame.UpdateCursor(dt)
    UpdateGame.RemoveBalls()
    world:update(dt)
end

function areBallsTouching(ball1, ball2)
    local distance = math.sqrt((ball1.body:getX() - ball2.body:getX())^2 + (ball1.body:getY() - ball2.body:getY())^2)
    return distance < ball1.size + ball2.size
end
