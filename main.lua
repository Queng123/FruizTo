require "Game/ballTypes"
require "Game/load"
require "Game/update"
require "Game/draw"
require "Game/key"

require "Menu/load"
require "Menu/update"
require "Menu/draw"
require "Menu/key"

world = love.physics.newWorld(0, 9.81*64, true)
balls = {}
score = 0

GameState = {
    MENU = 1,
    GAME = 2
}

ballQueue = {}

ballTypesList = {
    BallTypes.Forretress,
    BallTypes.Jigglypuff,
    BallTypes.Mareep,
}

colors = {
    Green = {0.1, 0.8, 0.1, 0.9},
    backgroundColor = {0.2, 0.2, 0.2, 1.0},
    Red = {1.0, 0.0, 0.0, 1.0},
}

currentState = GameState.MENU

function love.load()
    LoadMenu.loadMenu()
    LoadGame.loadGame()
end

function love.keypressed(key)
    if (key == 'escape') then
        love.event.quit()
    end
    if (currentState == GameState.GAME) then
        KeyGame.handleInputGame(key)
    elseif (currentState == GameState.MENU) then
        KeyMenu.handleInputMenu(key)
    end
end

function love.update(dt)
    if (currentState == GameState.GAME) then
        UpdateGame.updateGame(dt)
    elseif (currentState == GameState.MENU) then
        UpdateMenu.updateMenu(dt)
    end
end

function love.draw()
    love.graphics.draw(background, 0, 0, 0, backgroundWidth / background:getWidth(), backgroundHeight / background:getHeight())

    if (currentState == GameState.GAME) then
        DrawGame.drawGame()
    elseif (currentState == GameState.MENU) then
        DrawMenu.drawMenu()
    end
end
