Load = {}

local sound = love.audio.newSource("Echoes.wav", "static")

function Load.loadSounds()
    love.audio.play(sound)
end

function Load.loadGame()
    Init.createBackground()
    Init.initMap()
    Init.initCursor()
end

function Load.loadMenu()
    --nothing
end
