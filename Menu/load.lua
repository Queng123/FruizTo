LoadMenu = {}

function LoadMenu.loadMenu()
    wheel = love.graphics.newImage("assets/wheel.png")
    wheelX = 200
    wheelY = 340
    wheelAngle = 0

    triangle = love.graphics.newImage("assets/menu_triangle.png")
    triangleX = 174
    triangleY = 145

    join = love.graphics.newImage("assets/join.png")
    joinX = 200
    joinY = 400

    pharmacie = love.graphics.newImage("assets/pharmacie.png")
    pharmacieX = -90
    pharmacieY = 0

    rondoudou = love.graphics.newImage("assets/rondoudou.png")
    rondoudouX = 400
    rondoudouY = 200

    smoke = love.graphics.newImage("assets/smoke.png")
    smokeX = -400
    smokeY = -400

    menu_music = love.audio.newSource("assets/menu.wav", "static")
    love.audio.play(menu_music)

    forretress = love.graphics.newImage("assets/forretress.png")
    jigglypuff = love.graphics.newImage("assets/jigglypuff.png")
    mareep = love.graphics.newImage("assets/mareep.png")
    solrock = love.graphics.newImage("assets/solrock.png")
    whirlipede = love.graphics.newImage("assets/whirlipede.png")

    start_drug_animation = false
    state = 0
    animation_state = 0
end