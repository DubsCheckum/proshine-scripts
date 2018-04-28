name = "Exp_SeafoamB4F"
author = "DubsCheckum"

local pf = require("Pathfinder/MoveToApp")

function onPathAction()
    if pf.mapName() == "Seafoam B4F_D" then
        if getPokemonHealthPercent(getTeamSize()) < 50 then
            return talkToNpc("Nurse Joy")
        else
            return moveToNormalGround()
        end
    else
        return pf.moveTo("Seafoam B4F_D")
    end
end

function onBattleAction()
    if isWildBattle() then
        if isOpponentShiny() or getOpponentForm() ~= 0 then
            return useItem("Ultra Ball") 
                or useItem("Great Ball") 
                or useItem("Pokeball") 
                or playSound("Assets/message.wav")
        else
            return attack() or sendAnyPokemon() or run()
        end
    end
end