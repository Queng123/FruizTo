BallTypes = {}

BallTypes.Forretress = {
    name = "Forretress",
    size = 20,
    points = 1,
    texturePath = "assets/forretress.png"
}

BallTypes.Mareep = {
    name = "Mareep",
    size = 30,
    points = 2,
    texturePath = "assets/mareep.png"
}

BallTypes.Solrock = {
    name = "Solrock",
    size = 40,
    points = 4,
    texturePath = "assets/solrock.png"
}

BallTypes.Whirlipede = {
    name = "Whirlipede",
    size = 50,
    points = 8,
    texturePath =  "assets/whirlipede.png"
}

BallTypes.Pikachu = {
    name = "Pikachu",
    size = 30,
    points = 16,
    texturePath = "assets/pikachu.png"
}

BallTypes.Jigglypuff = {
    name = "Jigglypuff",
    size = 30,
    points = 32,
    texturePath = "assets/jigglypuff.png"
}

BallTypes.mergeSequence = {
    BallTypes.Forretress,
    BallTypes.Mareep,
    BallTypes.Solrock,
    BallTypes.Pikachu,
    BallTypes.Jigglypuff,
}

BallTypes.merge = function(ballType1, ballType2)
    if ballType1 == ballType2 then
        local currentIndex 
        for i, ballType in ipairs(BallTypes.mergeSequence) do
            if ballType1 == ballType then
                currentIndex = i
                break
            end
        end
        local nextIndex = (currentIndex % #BallTypes.mergeSequence) + 1
        return BallTypes.mergeSequence[nextIndex]
    end
    return BallTypes.mergeSequence[1]
end
