UpdateGame = {}

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