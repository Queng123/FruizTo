UpdateGame = {}

newBalls = {}

require "Game/load"

local mergeTable = {
    Forretress = {
        Forretress = BallTypes.Jigglypuff,
    },
    Jigglypuff = {
        Jigglypuff = BallTypes.Mareep,
    },
    Mareep = {
        Mareep = BallTypes.Solrock,
    },
    Solrock = {
        Solrock = BallTypes.Whirlipede,
    },
}


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

function getMergedType(ballType1, ballType2)
    return mergeTable[ballType1.name] and mergeTable[ballType1.name][ballType2.name]
end

function UpdateGame.mergedBall(ball1, ball2, x, y)
    local ballMerged = getMergedType(ball1, ball2)

    local text = "Boule fusionnée: " .. ball1.name .. " + " .. ball2.name .. " = " .. (ballMerged and ballMerged.name or "")
    love.window.setTitle(text)

    if ballMerged then
        local ball = {
            name = ballMerged.name,
            size = ballMerged.size,
            points = ballMerged.points,
            texturePath = ballMerged.texturePath,
        }
        ball.body = love.physics.newBody(world, x, y, 'dynamic')
        ball.shape = love.physics.newCircleShape(ball.size)
        ball.fixture = love.physics.newFixture(ball.body, ball.shape, 1)
        ball.fixture:setRestitution(0.4)
        ball.texture = love.graphics.newImage(ball.texturePath)
        table.insert(newBalls, ball)
    end
end

function UpdateGame.RemoveBalls()
    local markedForRemoval = {}

    for i, ball1 in ipairs(balls) do
        for j, ball2 in ipairs(balls) do
            if i ~= j and areBallsTouching(ball1, ball2) and ball1.name == ball2.name then
                UpdateGame.mergedBall(ball1, ball1, (ball1.body:getX() + ball2.body:getX()) / 2, (ball1.body:getY() + ball2.body:getY()) / 2)
                markedForRemoval[i] = true
                markedForRemoval[j] = true
            end
        end
    end

    for i = #balls, 1, -1 do
        if markedForRemoval[i] then
            local ball = table.remove(balls, i)
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
