KeyMenu = {}

function KeyMenu.handleInputMenu(key)
    if key == 'space' then
        currentState = GameState.GAME
        spawnNewBall(BallTypes.Jigglypuff, 200, 200)
        spawnNewBall(BallTypes.Jigglypuff, 220, 100)
    end
end
