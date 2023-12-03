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

-- Définir la séquence de fusion
BallTypes.mergeSequence = {
    BallTypes.Forretress,
    BallTypes.Jigglypuff,
    BallTypes.Mareep,
    BallTypes.Solrock,
    BallTypes.Whirlipede,
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
