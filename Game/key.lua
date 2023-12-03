KeyGame = {}

function KeyGame.handleInputGame(key)
    if key == 'x' then
        local ballToSpawn = ballQueue[1]
        UpdateGame.spawnNewBall(ballToSpawn, cursorX, cursorY)
        local randomBallType = UpdateGame.getRandomBallType()
        UpdateGame.handleBallQueue(randomBallType)
    end
end
