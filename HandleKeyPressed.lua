HandleKeyPressed = {}

function HandleKeyPressed.handleInputGame(key)
    -- nothing for the moment
end

function HandleKeyPressed.handleInputMenu(key)
    if key == 'space' then
        currentState = GameState.GAME
        spawnNewBall(BallTypes.Forretress, 200, 200)
    end
end

function love.keypressed(key)
    if (key == 'escape') then
        love.event.quit()
    end
    if (currentState == GameState.GAME) then
        HandleKeyPressed.handleInputGame(key)
    elseif (currentState == GameState.MENU) then
        HandleKeyPressed.handleInputMenu(key)
    end
end
