wf = require 'windfield'

fruits = {}
score = 0
collisionDetected = false
local sound = love.audio.newSource("Echoes.wav", "static")

function love.load()
    -- Création du monde
    world = wf.newWorld(0, 512, true)
    world:addCollisionClass('Platform')
    world:addCollisionClass('Player')
    
    -- Création des éléments du jeu
    createGround()
    createPlatform()
    createPlayer()

    -- Définition de la fonction de pré-solve pour la plateforme
    player:setPreSolve(playerPlatformPreSolve)

    -- Lancement de la musique
    love.audio.play(sound)
end

function love.keypressed(key)
    -- Gestion des touches pressées
    if key == 'space' then
        player:applyLinearImpulse(0, -1000)
    elseif key == 'r' then
        resetPlayerPosition()
    elseif key == 'escape' then
        love.event.quit()
    elseif key == 'q' then
        player:applyLinearImpulse(-200, 0)
    elseif key == 'd' then
        player:applyLinearImpulse(200, 0)
    end
end

function love.update(dt)
    -- Mise à jour du monde
    world:update(dt)

    -- Génération de fruits aléatoires
    if love.timer.getTime() % 1 == 0 then
        generateRandomRectangles()
    end

    -- Gestion des collisions avec les fruits
    handleFruitCollisions()

    -- Mise à jour du score et destruction des fruits touchant le sol
    updateScoreAndDestroyFruits()
end

function love.draw()
    -- Affichage du monde et du score
    world:draw()
    love.graphics.print("Score: " .. score, 10, 10)
end

-- Fonctions utilitaires

function createGround()
    ground = world:newRectangleCollider(100, 500, 600, 50)
    ground:setType('static')
end

function createPlatform()
    platform = world:newRectangleCollider(350, 400, 100, 20)
    platform:setType('static')
    platform:setCollisionClass('Platform')
end

function createPlayer()
    player = world:newRectangleCollider(390, 450, 20, 40)
    player:setCollisionClass('Player')
end

function playerPlatformPreSolve(collider_1, collider_2, contact)
    if collider_1.collision_class == 'Player' and collider_2.collision_class == 'Platform' then
        local px, py = collider_1:getPosition()
        local pw, ph = 20, 40
        local tx, ty = collider_2:getPosition()
        local tw, th = 100, 20
        if py + ph/2 > ty - th/2 then contact:setEnabled(false) end
    end
end

function resetPlayerPosition()
    player:setPosition(390, 450)
    player:setLinearVelocity(0, 0)
end

function generateRandomRectangles()
    -- Implementation de la génération aléatoire des rectangles (à compléter selon votre logique)
end

function handleFruitCollisions()
    -- Gestion des collisions avec les fruits (à compléter selon votre logique)
end

function updateScoreAndDestroyFruits()
    -- Mise à jour du score et destruction des fruits touchant le sol (à compléter selon votre logique)
end
