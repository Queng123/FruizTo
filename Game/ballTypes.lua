BallTypes = {}

BallTypes.Forretress = {
    name = "Forretress",
    size = 20,
    points = 1,
    texturePath = "assets/forretress.png"
}

BallTypes.Jigglypuff = {
    name = "Jigglypuff",
    size = 30,
    points = 2,
    texturePath = "assets/jigglypuff.png"
}

BallTypes.Mareep = {
    name = "Mareep",
    size = 40,
    points = 4,
    texturePath = "assets/mareep.png"
}

BallTypes.Solrock = {
    name = "Solrock",
    size = 50,
    points = 8,
    texturePath = "assets/solrock.png"
}

BallTypes.Whirlipede = {
    name = "Whirlipede",
    size = 60,
    points = 16,
    texturePath =  "assets/whirlipede.png"
}

BallTypes.merge = function(ballType1, ballType2)
    if ballType1 == BallTypes.Forretress and ballType2 == BallTypes.Forretress then
        return BallTypes.Jigglypuff
    elseif ballType1 == BallTypes.Jigglypuff and ballType2 == BallTypes.Jigglypuff then
        return BallTypes.Mareep
    elseif ballType1 == BallTypes.Mareep and ballType2 == BallTypes.Mareep then
        return BallTypes.Solrock
    elseif ballType1 == BallTypes.Solrock and ballType2 == BallTypes.Solrock then
        return BallTypes.Whirlipede
    else
        return BallTypes.Forretress
    end
end
