-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("ReplicatedStorage")
local u2 = require(v1.Item_Module)
local u3 = require(v1.Modules.MutationHandler)
local u4 = require(v1.Data.EnumRegistry.InventoryServiceEnums)
local function u18(p5, p6, p7, p8, p9) --[[Anonymous function at line 7]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v10 = u2.Return_Data(p5)
    if not v10 or #v10 < 3 then
        warn("CalculatePlantValueFromData | ItemData is invalid for plant:", p5)
        return 0
    end
    local v11 = v10[3]
    local v12 = v10[2]
    local v13 = u2.Return_Variant_Multiplier(p6)
    local v14 = v11 * p8 * v13
    local v15 = p7 / v12
    local v16 = math.clamp(v15, 0.95, 100000000)
    local v17 = v14 * (v16 * v16)
    if (p9 or 0) >= 1 then
        v17 = math.min(v17, 1000000000000)
    end
    return math.round(v17)
end
local function u26(p19) --[[Anonymous function at line 37]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u18
    --]]
    local v20 = p19:FindFirstChild("Item_String")
    local v21 = v20 and v20.Value or p19.Name
    local v22 = p19:FindFirstChild("Variant")
    if not v22 then
        return 0
    end
    local v23 = p19:FindFirstChild("Weight")
    if not v23 then
        return 0
    end
    local v24 = u3:CalcValueMulti(p19)
    local v25 = p19:GetAttribute(u4.FruitVersion) or 0
    return u18(v21, v22.Value, v23.Value, v24, v25)
end
return function(p27) --[[Function name: CalculatePlantValue, line 53]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u18
    --]]
    if not p27 then
        warn("No plant or Values given!")
        return 0
    end
    if typeof(p27) == "Instance" then
        return u26(p27)
    end
    if typeof(p27) == "table" then
        return u18(p27.name, p27.variant, p27.weight, p27.mutationMultiplier, p27.fruitVersion)
    end
    warn((("CalculatePlantValue | Invalid plant/value type: %*"):format((typeof(p27)))))
    return 0
end