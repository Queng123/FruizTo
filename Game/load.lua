LoadGame = {}

function LoadGame.loadMusic()
    game_music = love.audio.newSource("assets/Echoes.wav", "static")
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
    left_wall.shape = love.physics.newRectangleShape(160, 300 + 70, 20, 400)
    left_wall.fixture = love.physics.newFixture(left_wall.body, left_wall.shape)

    right_wall = {}
    right_wall.body = love.physics.newBody(world, 0, 0, 'static')
    right_wall.shape = love.physics.newRectangleShape(640, 300 + 70, 20, 400)
    right_wall.fixture = love.physics.newFixture(right_wall.body, right_wall.shape)

    floor = {}
    floor.body = love.physics.newBody(world, 0, 0, 'static')
    floor.shape = love.physics.newRectangleShape(400, 470 + 70, 600, 20)
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
    gameAreaY = (love.graphics.getHeight() - gameAreaHeight) / 2 + 70
end

function LoadGame.loadGame()
    math.randomseed(os.time())
    math.random(); math.random(); math.random()
    LoadGame.createBackground()
    LoadGame.initMap()
    LoadGame.initCursor()
    LoadGame.loadMusic()

    UpdateGame.handleBallQueue(UpdateGame.getRandomBallType())
    UpdateGame.handleBallQueue(UpdateGame.getRandomBallType())
    triangleVertices = {
        cursorX, cursorY,
        cursorX - 10, cursorY - 20,
        cursorX + 10, cursorY - 20
    }
end
