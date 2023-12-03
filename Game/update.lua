UpdateGame = {}

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

function UpdateGame.updateGame(dt)
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

    world:update(dt)
end