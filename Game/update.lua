UpdateGame = {}

function UpdateGame.updateGame(dt)
    cursorX = cursorX + cursorDirection * cursorSpeed * dt

    if cursorX <= gameAreaX + 80 or cursorX >= gameAreaX + gameAreaWidth - 80 then
        cursorDirection = -cursorDirection
    end

    triangleVertices = {
        cursorX, cursorY,
        cursorX - 10,cursorY - 20,
        cursorX + 10,cursorY - 20
    }

    world:update(dt)
end