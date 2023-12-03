KeyGame = {}

require 'Game/load'

function KeyGame.handleInputGame(key)
    if key == 'x' then
        LoadGame.spawnNewBall(BallTypes.Forretress, cursorX, cursorY)
    end
end
