wf = require 'windfield'

fruits = {}
score = 0
collisionDetected = false
local sound = love.audio.newSource("Echoes.wav", "static")

GameState = {
    MENU = 1,
    GAME = 2
}

local colors = {
    Green = {0.1, 0.8, 0.1, 0.9},
    backgroundColor = {0.2, 0.2, 0.2, 1.0},
    Red = {1.0, 0.0, 0.0, 1.0},
}

currentState = GameState.MENU

function createBackground()
    background = love.graphics.newImage("assets/game_background.png")
    backgroundWidth = 800
    backgroundHeight = 600

    gameAreaWidth = 600
    gameAreaHeight = 400
    gameAreaX = (love.graphics.getWidth() - gameAreaWidth) / 2
    gameAreaY = (love.graphics.getHeight() - gameAreaHeight) / 2
end

function initMap()
    platformY = gameAreaY + gameAreaHeight - 20
    platformHeight = 20

    secondPlatformX = gameAreaX + 50
    secondPlatformWidth = 20

    thirdPlatformX = gameAreaX + gameAreaWidth - 140
    thirdPlatformWidth = 20
end

function initCursor()
    cursorX = gameAreaX + gameAreaWidth / 2
    cursorY = gameAreaY + 30
    cursorSpeed = 100
    cursorDirection = 1
end

function loadGame()
    createBackground()
    initMap()
    initCursor()
end

function loadMenu()
    --nothing
end

function loadSounds()
    -- Lancement de la musique
    love.audio.play(sound)
end

function love.load()
    loadMenu()
    loadGame()
    loadSounds()
end

function handleInputGame(key)
    -- nothing for the moment
end

function handleInputMenu(key)
    if key == 'space' then
        currentState = GameState.GAME
    end
end

function love.keypressed(key)
    if (currentState == GameState.GAME) then
        handleInputGame(key)
    elseif (currentState == GameState.MENU) then
        handleInputMenu(key)
    end
end

function updateGame(dt)
    cursorX = cursorX + cursorDirection * cursorSpeed * dt

    if cursorX <= gameAreaX + 80 or cursorX >= gameAreaX + gameAreaWidth - 80 then
        cursorDirection = -cursorDirection
    end

    triangleVertices = {
        cursorX, cursorY,
        cursorX - 10,cursorY - 20,
        cursorX + 10,cursorY - 20
    }
end

function updateMenu(dt)
    -- For the moment nothing to update
end

function love.update(dt)
    if (currentState == GameState.GAME) then
        updateGame(dt)
    elseif (currentState == GameState.MENU) then
        updateMenu(dt)
    end
end

function drawGame()
    love.graphics.setColor(0.1, 0.1, 0.1, 0.9)
    love.graphics.rectangle("fill", gameAreaX, gameAreaY, gameAreaWidth, gameAreaHeight)

    love.graphics.setColor(colors.Green)
    love.graphics.rectangle("fill", gameAreaX + 50, platformY - 20, gameAreaWidth - 100, platformHeight)
    love.graphics.rectangle("fill", secondPlatformX, gameAreaY + 60, secondPlatformWidth, gameAreaHeight - 100)
    love.graphics.rectangle("fill", thirdPlatformX + 70, gameAreaY + 60, thirdPlatformWidth, gameAreaHeight - 100)

    love.graphics.setColor(colors.Red)
    love.graphics.polygon("fill", triangleVertices)

    love.graphics.setColor(1, 1, 1, 0.8)
end

function drawMenu()
    -- nothing
end

function love.draw()
    love.graphics.draw(background, 0, 0, 0, backgroundWidth / background:getWidth(), backgroundHeight / background:getHeight())

    if (currentState == GameState.GAME) then
        drawGame()
    elseif (currentState == GameState.MENU) then
        drawMenu()
    end
end