LoadGame = {}

local music = love.audio.newSource("assets/Echoes.wav", "static")

function LoadGame.loadMusic()
    love.audio.play(music)
end

function LoadGame.spawnNewBall(ballType, x, y)
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

function LoadGame.initMap()
    platformY = gameAreaY + gameAreaHeight - 20
    platformHeight = 20

    secondPlatformX = gameAreaX + 50
    secondPlatformWidth = 20

    thirdPlatformX = gameAreaX + gameAreaWidth - 140
    thirdPlatformWidth = 20

    left_wall = {}
    left_wall.body = love.physics.newBody(world, 0, 0, 'static')
    left_wall.shape = love.physics.newRectangleShape(160, 300, 20, 400)
    left_wall.fixture = love.physics.newFixture(left_wall.body, left_wall.shape)

    right_wall = {}
    right_wall.body = love.physics.newBody(world, 0, 0, 'static')
    right_wall.shape = love.physics.newRectangleShape(640, 300, 20, 400)
    right_wall.fixture = love.physics.newFixture(right_wall.body, right_wall.shape)

    floor = {}
    floor.body = love.physics.newBody(world, 0, 0, 'static')
    floor.shape = love.physics.newRectangleShape(400, 470, 600, 20)
    floor.fixture = love.physics.newFixture(floor.body, floor.shape)
end

function LoadGame.initCursor()
    cursorX = gameAreaX + gameAreaWidth / 2
    cursorY = gameAreaY + 30
    cursorSpeed = 100
    cursorDirection = 1
end

function LoadGame.createBackground()
    background = love.graphics.newImage("assets/background.png")
    backgroundWidth = 800
    backgroundHeight = 600

    gameAreaWidth = 600
    gameAreaHeight = 400
    gameAreaX = (love.graphics.getWidth() - gameAreaWidth) / 2
    gameAreaY = (love.graphics.getHeight() - gameAreaHeight) / 2
end

function LoadGame.loadGame()
    LoadGame.spawnNewBall(BallTypes.Jigglypuff, 200, 200)
    LoadGame.spawnNewBall(BallTypes.Jigglypuff, 220, 100)
    LoadGame.createBackground()
    LoadGame.initMap()
    LoadGame.initCursor()
    LoadGame.loadMusic()
end
