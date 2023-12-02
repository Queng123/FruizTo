ballTypes = require 'balls'

local world = love.physics.newWorld(0, 9.81*64, true)
local balls = {}

-- Create balls
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

spawnNewBall(ballTypes.forretress, 100, 200)
spawnNewBall(ballTypes.jigglypuff, 200, 200)
spawnNewBall(ballTypes.mareep, 320, 200)
spawnNewBall(ballTypes.solrock, 460, 200)
spawnNewBall(ballTypes.whirlipede, 620, 200)

-- Create walls and floor
local walls = {}
for i=1,3 do
    walls[i] = {}
    walls[i].body = love.physics.newBody(world, 0, 0, 'static')
    if i == 1 then
        -- floor
        walls[i].shape = love.physics.newRectangleShape(400, 575, 800, 50)
    elseif i == 2 then
        -- left wall
        walls[i].shape = love.physics.newRectangleShape(25, 300, 50, 600)
    else
        -- right wall
        walls[i].shape = love.physics.newRectangleShape(775, 300, 50, 600)
    end
    walls[i].fixture = love.physics.newFixture(walls[i].body, walls[i].shape)
end

-- Draw the ball and walls
function love.draw()
    for i=1,3 do
        love.graphics.polygon('line', walls[i].body:getWorldPoints(walls[i].shape:getPoints()))
    end
    for i, ball in ipairs(balls) do
        local scaleX = ball.size * 2 / (ball.texture:getWidth() - 30)
        local scaleY = ball.size * 2 / (ball.texture:getHeight() - 30)
        love.graphics.draw(ball.texture, ball.body:getX(), ball.body:getY(), 0, scaleX, scaleY, ball.texture:getWidth()/2, ball.texture:getHeight()/2)
    end
end

-- Update the physics world
function love.update(dt)
    world:update(dt)
end
