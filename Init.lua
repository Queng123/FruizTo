Init = {}

function Init.initMap()
    platformY = gameAreaY + gameAreaHeight - 20
    platformHeight = 20

    secondPlatformX = gameAreaX + 50
    secondPlatformWidth = 20

    thirdPlatformX = gameAreaX + gameAreaWidth - 140
    thirdPlatformWidth = 20
end

function Init.initCursor()
    cursorX = gameAreaX + gameAreaWidth / 2
    cursorY = gameAreaY + 30
    cursorSpeed = 100
    cursorDirection = 1
end

function Init.createBackground()
    background = love.graphics.newImage("assets/game_background.png")
    backgroundWidth = 800
    backgroundHeight = 600

    gameAreaWidth = 600
    gameAreaHeight = 400
    gameAreaX = (love.graphics.getWidth() - gameAreaWidth) / 2
    gameAreaY = (love.graphics.getHeight() - gameAreaHeight) / 2
end
