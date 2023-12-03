UpdateMenu = {}

local rotationSpeed = 395
local slowdownFactor = 0.9

function UpdateMenu.updateWheel(dt)
    wheelAngle = wheelAngle + rotationSpeed

    rotationSpeed = rotationSpeed * slowdownFactor

    if rotationSpeed < 0.9 then
        rotationSpeed = 0
        state = 6
    end
end

function UpdateMenu.updateSmoke(dt)
    smokeX = smokeX + 1
    smokeY = smokeY + 1
    if smokeX > 400 then
        smokeX = -400
    end
    if smokeY > 400 then
        smokeY = -400
    end
end

local timer = 0
local update_interval = 0.5

function UpdateMenu.updateAnimation(dt)
    timer = timer + dt

    if timer >= update_interval then
        animation_state = animation_state + 1

        timer = timer - update_interval
    end
end

function UpdateMenu.updateMenu(dt)
    if state == 5 then
        UpdateMenu.updateWheel(dt)
    end
    if state >= 8 then
        UpdateMenu.updateSmoke(dt)
    end
    if state >= 6 then
        wheelAngle = 3941.2368016239
    end
    if state == 9 then
        love.audio.stop(menu_music)
        love.audio.play(game_music)
        UpdateMenu.updateAnimation(dt)
    end
    if state == 10 then
        currentState = GameState.GAME
    end
end