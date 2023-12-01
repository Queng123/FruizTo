wf = require 'windfield'

fruits = {}
score = 0

function love.load()
    world = wf.newWorld(0, 800, true)
    world:setGravity(0, 512)

    box = world:newRectangleCollider(400 - 50/2, 0, 50, 50)
    box:setRestitution(0.4)
    box:applyAngularImpulse(5000)

    ground = world:newRectangleCollider(0, 550, 800, 50)
    wall_left = world:newRectangleCollider(0, 0, 50, 600)
    wall_right = world:newRectangleCollider(750, 0, 50, 600)

    ground:setType('static')
    wall_left:setType('static')
    wall_right:setType('static')

    generateRandomRectangles()
end

function generateRandomRectangles()
    local x = love.math.random(0, 750)
    local y = 0
    local width = love.math.random(20, 50)
    local height = love.math.random(20, 50)

    local randomRect = world:newRectangleCollider(x, y, width, height)
    randomRect:setRestitution(0.4)

    table.insert(fruits, randomRect)
end

function love.update(dt)
    world:update(dt)

    if love.timer.getTime() % 1 == 0 then
        generateRandomRectangles()
    end
end

function love.draw()
    world:draw()



    love.graphics.print("Score: " .. score, 10, 10)
end
