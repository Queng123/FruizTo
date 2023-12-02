Update = {}

function Update.updateGame(dt)
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

function Update.updateMenu(dt)
    -- For the moment nothing to update
end

function Update.update(dt)
    if (currentState == GameState.GAME) then
        Update.updateGame(dt)
    elseif (currentState == GameState.MENU) then
        Update.updateMenu(dt)
    end
end