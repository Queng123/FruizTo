UpdateGame = {}
newBalls = {}
score = 0

require "Game/load"

function UpdateGame.spawnNewBall(ballType, x, y)
    local ball = {
        name = ballType.name,
        size = ballType.size,
        points = ballType.points,
        texturePath = ballType.texturePath
    }
    ball.body = love.physics.newBody(world, x, y, 'dynamic')
    ball.shape = love.physics.newCircleShape(ball.size)
    ball.fixture = love.physics.newFixture(ball.body, ball.shape, 1)
    ball.fixture:setRestitution(0.4)
    ball.texture = love.graphics.newImage(ball.texturePath)
    table.insert(newBalls, ball)
end

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
            ballMergedType = BallTypes.Pikachu
        elseif ball1.name == "Solrock" then
            ballMergedType = BallTypes.Whirlipede
        elseif ball1.name == "Pikachu" then
            ballMergedType = BallTypes.Solrock
        end
    end
    return ballMergedType
end

function UpdateGame.RemoveBalls()
    local markedForRemoval2 = {}
    local ballMergedTypeTest
    local test = false
    local grosX
    local grosY

    for i, ball1 in ipairs(newBalls) do
        for j, ball2 in ipairs(newBalls) do
            if i ~= j and areBallsTouching(ball1, ball2) and ball1.name == ball2.name and ball1.name ~= "Whirlipede" and ball2.name ~= "Whirlipede" then
                ballMergedTypeTest = UpdateGame.mergedBall(ball1, ball2, ball1.body:getX(), ball1.body:getY())
                grosX = ball1.body:getX()
                grosY = ball1.body:getY()
                test = true
                score = score + ball1.points
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
    if test == true then
        UpdateGame.spawnNewBall(ballMergedTypeTest, grosX, grosY)
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