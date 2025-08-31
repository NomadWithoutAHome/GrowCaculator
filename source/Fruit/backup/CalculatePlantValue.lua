-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

--Decompiled by Medal, I take no credit I only Made The dumper and I I.. I iron man
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Item_Module)
local v_u_3 = require(v1.Modules.MutationHandler)
local v_u_4 = require(v1.Data.EnumRegistry.InventoryServiceEnums)
local function v_u_18(p5, p6, p7, p8, p9)
	-- upvalues: (copy) v_u_2
	local v10 = v_u_2.Return_Data(p5)
	if not v10 or #v10 < 3 then
		warn("CalculatePlantValueFromData | ItemData is invalid for plant:", p5)
		return 0
	end
	local v11 = v10[3]
	local v12 = v10[2]
	local v13 = v_u_2.Return_Variant_Multiplier(p6)
	local v14 = v11 * p8 * v13
	local v15 = p7 / v12
	local v16 = math.clamp(v15, 0.95, 100000000)
	local v17 = v14 * (v16 * v16)
	if (p9 or 0) >= 1 then
		v17 = math.min(v17, 1000000000000)
	end
	return math.round(v17)
end
local function v_u_26(p19)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_18
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
	local v24 = v_u_3:CalcValueMulti(p19)
	local v25 = p19:GetAttribute(v_u_4.FruitVersion) or 0
	return v_u_18(v21, v22.Value, v23.Value, v24, v25)
end
return function(p27)
	-- upvalues: (copy) v_u_26, (copy) v_u_18
	if not p27 then
		warn("No plant or Values given!")
		return 0
	end
	if typeof(p27) == "Instance" then
		return v_u_26(p27)
	end
	if typeof(p27) == "table" then
		return v_u_18(p27.name, p27.variant, p27.weight, p27.mutationMultiplier, p27.fruitVersion)
	end
	warn((("CalculatePlantValue | Invalid plant/value type: %*"):format((typeof(p27)))))
	return 0
end
