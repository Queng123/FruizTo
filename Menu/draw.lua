DrawMenu = {}

function DrawMenu.drawMenu()
    love.graphics.setFont(love.graphics.newFont(25))
    love.graphics.draw(pharmacie, pharmacieX, pharmacieY, 0, 0.45, 0.45)
    love.graphics.draw(wheel, wheelX, wheelY, wheelAngle, 1, 1, wheel:getWidth()/2, wheel:getHeight()/2)
    love.graphics.draw(triangle, triangleX, triangleY, 0, 0.04, 0.04)
    love.graphics.draw(rondoudou, rondoudouX, rondoudouY)
    color = {0 / 255, 0 / 255, 0 / 255}
    if state == 0 then
        love.graphics.setColor(color)
        love.graphics.print("Appuie sur \"espace\" pour continuer...", 10, 550)
        love.graphics.setColor(1, 1, 1)
    end
    if state == 1 then
        love.graphics.setColor(color)
        love.graphics.print("Wesh ici rondoudou, bienvenue dans ma pharmacie gros", 10, 550)
        love.graphics.setColor(1, 1, 1)
    end
    if state == 2 then
        love.graphics.setColor(color)
        love.graphics.print("Ici tu peux acheter des trucs cool mon reuf", 10, 550)
        love.graphics.setColor(1, 1, 1)
    end
    if state == 3 then
        love.graphics.setColor(color)
        love.graphics.print("Appuie sur \"espace\" pour faire tourner la roue", 10, 550)
        love.graphics.setColor(1, 1, 1)
    end
    if state == 4 then
        love.graphics.setColor(color)
        love.graphics.print("Wow pas trop vite mon reuf, zen", 10, 550)
        love.graphics.setColor(1, 1, 1)
    end
    if state == 6 then
        love.graphics.setColor(color)
        love.graphics.print("Bravo, t'as gagné le pilon de la maison", 10, 550)
        love.graphics.setColor(1, 1, 1)
    end
    if state == 7 then
        love.graphics.setColor(color)
        love.graphics.print("Vient on va s'le fumer ensemble, ça va nous mettre biengg", 10, 550)
        love.graphics.setColor(1, 1, 1)
    end
    if state == 8 then
        love.graphics.setColor(color)
        love.graphics.print("Appuie sur \"espace\" planer encore plus loin", 10, 550)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(smoke, smokeX, smokeY, 0, 0.5, 0.5)
    end
    if state == 9 then
        if animation_state >= 0 then
            love.graphics.draw(forretress, 10, 10, 0, 0.5, 0.5)
        end
        if animation_state >= 1 then
            love.graphics.draw(jigglypuff, 50, 350, 0, 0.5, 0.5)
        end
        if animation_state >= 2 then
            love.graphics.draw(mareep, 270, 100, 0, 0.5, 0.5)
        end
        if animation_state >= 3 then
            love.graphics.draw(solrock, 195, 300, 0, 0.5, 0.5)
        end
        if animation_state >= 4 then
            love.graphics.draw(whirlipede, 372, 200, 0, 0.5, 0.5)
        end
        if animation_state >= 5 then
            love.graphics.draw(forretress, 400, 100, 0, 0.5, 0.5)
        end
        if animation_state >= 6 then
            love.graphics.draw(jigglypuff, 451, 200, 0, 0.5, 0.5)
        end
        if animation_state >= 7 then
            love.graphics.draw(mareep, 600, 250, 0, 0.5, 0.5)
        end
        if animation_state >= 8 then
            love.graphics.draw(solrock, 400, 42, 0, 0.5, 0.5)
        end
        if animation_state >= 9 then
            love.graphics.draw(whirlipede, 650, 320, 0, 0.5, 0.5)
        end
        if animation_state >= 10 then
            love.graphics.draw(forretress, 400, 400, 0, 0.5, 0.5)
        end
        if animation_state >= 11 then
            love.graphics.draw(jigglypuff, 200, 300, 0, 0.5, 0.5)
        end
        if animation_state >= 12 then
            love.graphics.draw(mareep, 0, 400, 0, 0.5, 0.5)
        end
        if animation_state >= 13 then
            love.graphics.draw(solrock, 400, 0, 0, 0.5, 0.5)
        end
        if animation_state >= 14 then
            love.graphics.draw(whirlipede, 730, 10, 0, 0.5, 0.5)
        end
        love.graphics.setColor(1,0,0)
        love.graphics.print("Appuie sur \"espace\" pour commencer la partie", 10, 550)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(smoke, smokeX, smokeY, 0, 0.5, 0.5)
    end
end
