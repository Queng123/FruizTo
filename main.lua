ballTypes = require 'balls'

require "Load"
require "HandleKeyPressed"
require "Update"
require "Init"
require "Draw"

balls = {}
score = 0

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

function spawnNewBall(ballType, x, y)
    local ball = {
        size = ballType.size, 
        points = ballType.points, 
        texturePath = ballType.texturePath
    }
    ball.body = love.physics.newBody(world, x, y, 'dynamic')
    ball.shape = love.physics.newCircleShape(ball.size)
    ball.fixture = love.physics.newFixture(ball.body, ball.shape, 1)
    ball.fixture:setRestitution(0.4)
    ball.texture = love.graphics.newImage(ball.texturePath)
    table.insert(balls, ball)
end

function love.load()
    Load.loadMenu()
    Load.loadGame()
    Load.loadSounds()
end

function love.update(dt)
    Update.update(dt)
end

function love.draw()
    love.graphics.draw(background, 0, 0, 0, backgroundWidth / background:getWidth(), backgroundHeight / background:getHeight())

    if (currentState == GameState.GAME) then
        Draw.drawGame()
    elseif (currentState == GameState.MENU) then
        Draw.drawMenu()
    end
end
