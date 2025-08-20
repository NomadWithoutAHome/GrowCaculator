-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = {}
local u2 = require(game.ReplicatedStorage.Item_Module)
function v1.Calculate_Weight(p3, p4) --[[Anonymous function at line 4]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    math.randomseed(p3)
    local v5 = u2.Return_Data(p4)
    if v5 then
        local v6 = math.random(700, 1400) * 0.001
        if math.random(1, v5[4]) == 1 then
            v6 = v6 * math.random(3, 4)
        end
        return v5[2] * v6, v6
    end
end
return v1