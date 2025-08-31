-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

--Decompiled by Medal, I take no credit I only Made The dumper and I I.. I iron man
local v1 = {}
local v_u_2 = require(game.ReplicatedStorage.Item_Module)
function v1.Calculate_Weight(p3, p4)
	-- upvalues: (copy) v_u_2
	math.randomseed(p3)
	local v5 = v_u_2.Return_Data(p4)
	if v5 then
		local v6 = math.random(700, 1400) * 0.001
		if math.random(1, v5[4]) == 1 then
			v6 = v6 * math.random(3, 4)
		end
		return v5[2] * v6, v6
	end
end
return v1
