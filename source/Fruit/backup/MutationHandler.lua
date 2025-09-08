-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

--Decompiled by Medal, I take no credit I only Made The dumper and I I.. I iron man
local v1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Players")
local v_u_5 = game.ReplicatedStorage.GameEvents.DiscoSetColor_RE
local v_u_6 = require(game.ReplicatedStorage.Modules.TableUtils)
local v_u_7 = require(game.ReplicatedStorage.Calculate_Weight)
local v_u_8 = require(v_u_2.Modules.GetPlayerFromPlant)
local v_u_9 = require(v_u_2.Data.EnumRegistry.FruitsEnums)
local v_u_10 = require(v_u_2.Data.EnumRegistry.PlantsEnums)
local v_u_11 = {}
local v_u_12 = {}
local v_u_13 = {}
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = {}
local v_u_18 = {
	["Potato"] = CFrame.Angles(1.5707963267948966, 0, 0)
}
local function v_u_96(p19, p20, p21, p22)
	-- upvalues: (copy) v_u_18
	p19:_RemoveFX(p20, p21)
	local v23 = p19.Name
	if v23 then
		local v24 = p19.Color
		if v24 then
			local v25 = {}
			local v26 = p22 or 0.5
			for _, v27 in p20:GetDescendants() do
				if (v27:IsA("BasePart") or (v27:IsA("UnionOperation") or v27:IsA("MeshPart") and v27.Transparency < 1)) and not v27:HasTag("Effect") then
					table.insert(v25, v27)
				end
			end
			if #v25 ~= 0 then
				local v28 = Vector3.new(inf, inf, inf)
				local v29 = Vector3.new(-inf, -inf, -inf)
				for _, v30 in v25 do
					local v31 = v30.CFrame
					local v32 = v30.Size
					local v33 = {}
					local v34 = -v32.X / 2
					local v35 = -v32.Y / 2
					local v36 = -v32.Z / 2
					local v37 = v31 * Vector3.new(v34, v35, v36)
					local v38 = v32.X / 2
					local v39 = -v32.Y / 2
					local v40 = -v32.Z / 2
					local v41 = v31 * Vector3.new(v38, v39, v40)
					local v42 = -v32.X / 2
					local v43 = v32.Y / 2
					local v44 = -v32.Z / 2
					local v45 = v31 * Vector3.new(v42, v43, v44)
					local v46 = v32.X / 2
					local v47 = v32.Y / 2
					local v48 = -v32.Z / 2
					local v49 = v31 * Vector3.new(v46, v47, v48)
					local v50 = -v32.X / 2
					local v51 = -v32.Y / 2
					local v52 = v32.Z / 2
					local v53 = v31 * Vector3.new(v50, v51, v52)
					local v54 = v32.X / 2
					local v55 = -v32.Y / 2
					local v56 = v32.Z / 2
					local v57 = v31 * Vector3.new(v54, v55, v56)
					local v58 = -v32.X / 2
					local v59 = v32.Y / 2
					local v60 = v32.Z / 2
					local v61 = v31 * Vector3.new(v58, v59, v60)
					local v62 = v32.X / 2
					local v63 = v32.Y / 2
					local v64 = v32.Z / 2
					__set_list(v33, 1, {v37, v41, v45, v49, v53, v57, v61, v31 * Vector3.new(v62, v63, v64)})
					for _, v65 in ipairs(v33) do
						local v66 = v28.X
						local v67 = v65.X
						local v68 = math.min(v66, v67)
						local v69 = v28.Y
						local v70 = v65.Y
						local v71 = math.min(v69, v70)
						local v72 = v28.Z
						local v73 = v65.Z
						local v74 = math.min(v72, v73)
						v28 = Vector3.new(v68, v71, v74)
						local v75 = v29.X
						local v76 = v65.X
						local v77 = math.max(v75, v76)
						local v78 = v29.Y
						local v79 = v65.Y
						local v80 = math.max(v78, v79)
						local v81 = v29.Z
						local v82 = v65.Z
						local v83 = math.max(v81, v82)
						v29 = Vector3.new(v77, v80, v83)
					end
				end
				local v84 = v29 - v28 + Vector3.new(0.1, 0.1, 0.1)
				local v85 = (v28 + v29) / 2
				local v86 = p20:GetPivot().Rotation
				local v87 = CFrame.new(v85) * v86
				local v88 = p20.Name
				if p20:IsA("Tool") then
					v88 = p20.Item_String.Value
				end
				if v_u_18[v88] then
					v87 = v87 * v_u_18[v88]
				end
				local v89 = Instance.new("Part")
				v89.Name = ("%*Shell"):format(v23)
				v89.Size = v84
				v89.CFrame = v87
				v89.Anchored = false
				v89.CanCollide = false
				v89.CanQuery = false
				v89.Massless = true
				v89.Transparency = v26
				v89.CastShadow = false
				v89.Color = v24
				v89.Material = Enum.Material.Ice
				v89:AddTag((("Cleanup_%*"):format(v23)))
				v89:AddTag("Effect")
				local v90 = p20.PrimaryPart or (p20:FindFirstChild("Handle") or p20:FindFirstChildOfClass("BasePart"))
				if v90 then
					local v91 = Instance.new("WeldConstraint")
					v91.Part0 = v89
					v91.Part1 = v90
					v91.Parent = v89
					v89.Parent = v90
				else
					v89:Destroy()
				end
				local v92 = game.ServerStorage.Mutation_FX:FindFirstChild(v23)
				if v92 then
					for _, v93 in v92:GetChildren() do
						local v94 = v93:Clone()
						v94.Parent = p21
						v94.Enabled = true
						v94:AddTag((("Cleanup_%*"):format(v23)))
					end
				end
				for _, v95 in p20:GetDescendants() do
					if v95:IsA("BasePart") or v95:IsA("UnionOperation") then
						v95.Reflectance = 0.3
					end
				end
			end
		else
			warn("No Color on Mutation", p19)
			return
		end
	else
		warn("No Name on Mutation", p19)
		return
	end
end
local function v_u_105(p97, p98, p99)
	local v_u_100 = p97.Name
	if v_u_100 then
		local function v103(p101)
			-- upvalues: (copy) v_u_100
			for _, v102 in p101:GetDescendants() do
				if v102:HasTag((("Cleanup_%*"):format(v_u_100))) then
					v102:Destroy()
				end
			end
		end
		if p99 then
			v103(p99)
		end
		if p98 then
			v103(p98)
		end
		for _, v104 in p98:GetDescendants() do
			if v104:IsA("BasePart") or v104:IsA("UnionOperation") then
				v104.Reflectance = 0
			end
		end
	else
		warn("No Name on Mutation", p97)
	end
end
function v_u_11.CanBeMutated(_, p106)
	if p106 then
		return p106:HasTag("Harvestable") or p106:HasTag("FruitTool")
	end
	warn("MutationHandler.CanBeMutated | No plant given!")
	return false
end
local function v_u_112(p107)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	if not p107 then
		warn("MutationHandler.GetFXPart | No plant given!")
		return nil
	end
	if not p107:IsDescendantOf(game) then
		return nil
	end
	local v108 = {}
	if #v108 == 1 then
		return v108[1]
	end
	if #v108 > 1 then
		return v108
	end
	local v109 = p107:IsA("Tool") and p107:WaitForChild("Handle", 0.3)
	if v109 then
		return v109
	end
	if p107.PrimaryPart then
		return p107.PrimaryPart
	end
	local v110
	if v_u_3:IsStudio() then
		for _, v111 in v_u_4:GetPlayers() do
			if v111.Name == "JexSavron" then
				v110 = true
				goto l16
			end
		end
		v110 = false
		goto l16
	else
		v110 = false
		::l16::
		if v110 then
			warn((("MutationHandler.GetFXPart | No valid FX part found for %* of type %*"):format(p107:GetFullName(), p107.ClassName)))
		end
		return nil
	end
end
local function v_u_129(p_u_113)
	-- upvalues: (copy) v_u_11, (copy) v_u_112
	local v_u_114 = {}
	local v_u_115 = {}
	for _, v116 in v_u_11:GetMutations() do
		if not p_u_113:GetAttribute(v116.Name) then
			v_u_115[v116] = v116._RemoveFX
		end
		if p_u_113:GetAttribute(v116.Name) then
			v_u_114[v116] = v116._AddFX
		end
	end
	task.spawn(function()
		-- upvalues: (copy) p_u_113, (ref) v_u_112, (copy) v_u_115, (copy) v_u_114
		local v117 = os.time()
		while os.time() - v117 <= 10 do
			task.wait()
			if p_u_113:HasTag("PlantGenerated") or p_u_113:HasTag("FoodGenerated") then
				break
			end
		end
		local v118 = v_u_112(p_u_113)
		local function v124(p119, p120, p121, p122)
			if typeof(p122) == "table" then
				for _, v123 in ipairs(p122) do
					p119(p120, p121, v123)
				end
			elseif p122 then
				p119(p120, p121, p122)
			end
		end
		for v125, v126 in v_u_115 do
			v124(v126, v125, p_u_113, v118)
		end
		for v127, v128 in v_u_114 do
			v124(v128, v127, p_u_113, v118)
		end
	end)
end
local _ = 0
local v_u_551 = {
	["Shocked"] = {
		["Id"] = "a",
		["Name"] = "Shocked",
		["ValueMulti"] = 100,
		["Color"] = Color3.fromRGB(255, 255, 100),
		["_AddFX"] = function(p130, p131, p132)
			-- upvalues: (copy) v_u_16
			p130:_RemoveFX(p131, p132)
			if p132 then
				for _, v133 in game.ServerStorage.Mutation_FX.Shocked:GetChildren() do
					local v134 = v133:Clone()
					v134.Parent = p132
					v134:AddTag("Cleanup_Shock")
				end
			end
			for _, v135 in p131:GetDescendants() do
				if (v135:IsA("BasePart") or v135:IsA("UnionOperation")) and not v135:HasTag("Effect") then
					v_u_16[v135] = v_u_16[v135] or v135.Material
					v135.Material = Enum.Material.Neon
				end
			end
		end,
		["_RemoveFX"] = function(_, p136, p137)
			-- upvalues: (copy) v_u_16
			if p137 then
				for _, v138 in p137:GetChildren() do
					if v138:HasTag("Cleanup_Shock") then
						v138:Destroy()
					end
				end
			end
			for _, v139 in p136:GetDescendants() do
				if (v139:IsA("BasePart") or v139:IsA("UnionOperation")) and v_u_16[v139] then
					if not v139:HasTag("Effect") then
						v139.Material = v_u_16[v139]
					end
					v_u_16[v139] = nil
				end
			end
		end
	},
	["Windstruck"] = {
		["Id"] = "b",
		["Name"] = "Windstruck",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(162, 185, 209),
		["_AddFX"] = function(p140, p141, p142)
			p140:_RemoveFX(p141, p142)
			if p142 then
				for _, v143 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
					local v144 = v143:Clone()
					v144.Parent = p142
					v144:AddTag("Cleanup_Windstruck")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p145)
			if p145 then
				for _, v146 in p145:GetChildren() do
					if v146:HasTag("Cleanup_Windstruck") then
						v146:Destroy()
					end
				end
			end
		end
	},
	["Dawnbound"] = {
		["Id"] = "c",
		["Name"] = "Dawnbound",
		["ValueMulti"] = 150,
		["Color"] = Color3.fromRGB(255, 213, 0),
		["_AddFX"] = function(p147, p148, p149)
			-- upvalues: (copy) v_u_16
			p147:_RemoveFX(p148, p149)
			if p149 then
				for _, v150 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
					local v151 = v150:Clone()
					v151.Parent = p149
					v151:AddTag("Cleanup_Dawnbound")
				end
			end
			for _, v152 in p148:GetDescendants() do
				if (v152:IsA("BasePart") or v152:IsA("UnionOperation")) and not v152:HasTag("Effect") then
					v_u_16[v152] = v_u_16[v152] or v152.Material
					v152.Material = Enum.Material.Neon
					v152.Reflectance = 0.05
					v152:AddTag("DawnboundVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p153, p154)
			-- upvalues: (copy) v_u_16
			if p154 then
				for _, v155 in p154:GetChildren() do
					if v155:HasTag("Cleanup_Dawnbound") then
						v155:Destroy()
					end
				end
			end
			for _, v156 in p153:GetDescendants() do
				if (v156:IsA("BasePart") or v156:IsA("UnionOperation")) and v156:HasTag("DawnboundVisual") then
					v156.Reflectance = 0
					v156:RemoveTag("DawnboundVisual")
					if v_u_16[v156] then
						v156.Material = v_u_16[v156]
						v_u_16[v156] = nil
					end
				end
			end
		end
	},
	["Beanbound"] = {
		["Id"] = "bb",
		["Name"] = "Beanbound",
		["ValueMulti"] = 100,
		["Color"] = Color3.fromRGB(53, 184, 75),
		["_AddFX"] = function(p157, p158, p159)
			-- upvalues: (copy) v_u_16
			p157:_RemoveFX(p158, p159)
			if p159 then
				for _, v160 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
					local v161 = v160:Clone()
					v161.Parent = p159
					v161:AddTag("Cleanup_Beanbound")
				end
			end
			for _, v162 in p158:GetDescendants() do
				if (v162:IsA("BasePart") or v162:IsA("UnionOperation")) and not v162:HasTag("Effect") then
					v_u_16[v162] = v_u_16[v162] or v162.Material
					v162.Material = Enum.Material.Neon
					v162.Reflectance = 0.05
					v162:AddTag("BeanboundVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p163, p164)
			-- upvalues: (copy) v_u_16
			if p164 then
				for _, v165 in p164:GetChildren() do
					if v165:HasTag("Cleanup_Beanbound") then
						v165:Destroy()
					end
				end
			end
			for _, v166 in p163:GetDescendants() do
				if (v166:IsA("BasePart") or v166:IsA("UnionOperation")) and v166:HasTag("BeanboundVisual") then
					v166.Reflectance = 0
					v166:RemoveTag("BeanboundVisual")
					if v_u_16[v166] then
						v166.Material = v_u_16[v166]
						v_u_16[v166] = nil
					end
				end
			end
		end
	},
	["Twisted"] = {
		["Id"] = "d",
		["Name"] = "Twisted",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(191, 191, 191),
		["_AddFX"] = function(p167, p168, p169)
			p167:_RemoveFX(p168, p169)
			if p169 then
				for _, v170 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
					local v171 = v170:Clone()
					v171.Parent = p169
					v171:AddTag("Cleanup_Twisted")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p172)
			if p172 then
				for _, v173 in p172:GetChildren() do
					if v173:HasTag("Twisted") then
						v173:Destroy()
					end
				end
			end
		end
	},
	["Cloudtouched"] = {
		["Id"] = "e",
		["Name"] = "Cloudtouched",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(225, 255, 255),
		["_AddFX"] = function(p174, p175, p176)
			p174:_RemoveFX(p175, p176)
			if p176 then
				for _, v177 in game.ServerStorage.Mutation_FX.Cloudtouched:GetChildren() do
					local v178 = v177:Clone()
					v178.Parent = p176
					v178:AddTag("Cleanup_Cloudtouched")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p179)
			if p179 then
				for _, v180 in p179:GetChildren() do
					if v180:HasTag("Cleanup_Cloudtouched") then
						v180:Destroy()
					end
				end
			end
		end
	},
	["Voidtouched"] = {
		["Id"] = "f",
		["Name"] = "Voidtouched",
		["ValueMulti"] = 135,
		["Color"] = Color3.fromRGB(225, 0, 255),
		["_AddFX"] = function(p181, p182, p183)
			p181:_RemoveFX(p182, p183)
			if p183 then
				for _, v184 in game.ServerStorage.Mutation_FX.Voidtouched:GetChildren() do
					local v185 = v184:Clone()
					v185.Parent = p183
					v185:AddTag("Cleanup_Voidtouched")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p186)
			if p186 then
				for _, v187 in p186:GetChildren() do
					if v187:HasTag("Cleanup_Voidtouched") then
						v187:Destroy()
					end
				end
			end
		end
	},
	["Wet"] = {
		["Id"] = "g",
		["Name"] = "Wet",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(64, 164, 223),
		["_AddFX"] = function(p188, p189, p190)
			p188:_RemoveFX(p189, p190)
			if p190 then
				for _, v191 in game.ServerStorage.Mutation_FX.Wet:GetChildren() do
					local v192 = v191:Clone()
					v192.Parent = p190
					v192.Enabled = true
					v192:AddTag("Cleanup_Wet")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p193)
			if p193 then
				for _, v194 in p193:GetChildren() do
					if v194:HasTag("Cleanup_Wet") then
						v194:Destroy()
					end
				end
			end
		end
	},
	["Fried"] = {
		["Id"] = "h",
		["Name"] = "Fried",
		["ValueMulti"] = 8,
		["Color"] = Color3.fromRGB(223, 110, 34),
		["_AddFX"] = function(p195, p196, p197)
			p195:_RemoveFX(p196, p197)
			if p197 then
				for _, v198 in game.ServerStorage.Mutation_FX.Fried:GetChildren() do
					local v199 = v198:Clone()
					v199.Parent = p197
					v199.Enabled = true
					v199:AddTag("Cleanup_Fried")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p200)
			if p200 then
				for _, v201 in p200:GetChildren() do
					if v201:HasTag("Cleanup_Fried") then
						v201:Destroy()
					end
				end
			end
		end
	},
	["Molten"] = {
		["Id"] = "i",
		["Name"] = "Molten",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(223, 100, 0),
		["_AddFX"] = function(p202, p203, p204)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p202:_RemoveFX(p203, p204)
			local v205 = {
				"Neon orange",
				"Br. yellowish orange",
				"Bright orange",
				"Bright red",
				"Bright yellow"
			}
			for _, v206 in p203:GetDescendants() do
				if (v206:IsA("BasePart") or v206:IsA("UnionOperation")) and not v206:HasTag("Effect") then
					v_u_13[v206] = v_u_13[v206] or v206.BrickColor.Color
					v206.BrickColor = BrickColor.new(v205[Random.new():NextInteger(1, #v205)])
					v_u_16[v206] = v_u_16[v206] or v206.Material
					v206.Material = Enum.Material.Neon
					v206:AddTag("MoltenVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p207, _)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			for _, v208 in p207:GetDescendants() do
				if (v208:IsA("BasePart") or v208:IsA("UnionOperation")) and v208:HasTag("MoltenVisual") then
					v208.Reflectance = 0
					local v209
					if v_u_13[v208] then
						v209 = BrickColor.new(v_u_13[v208])
					else
						v209 = v208.BrickColor
					end
					v208.BrickColor = v209
					v_u_13[v208] = nil
					v208:RemoveTag("MoltenVisual")
					if v_u_16[v208] then
						v208.Material = v_u_16[v208]
						v_u_16[v208] = nil
					end
				end
			end
		end
	},
	["Sliced"] = {
		["Id"] = "Sl",
		["Name"] = "Sliced",
		["ValueMulti"] = 50,
		["Color"] = Color3.fromRGB(223, 223, 223),
		["_AddFX"] = function(_, p210, _)
			-- upvalues: (copy) v_u_15, (copy) v_u_14
			for _, v211 in p210:GetDescendants() do
				if (v211:IsA("BasePart") or v211:IsA("UnionOperation")) and not v211:HasTag("SlicedVisual") then
					v_u_15[v211] = v_u_15[v211] or v211.Orientation
					v_u_14[v211] = v_u_14[v211] or v211.Position
					local v212 = p210.Item_Seed.Value
					local v213 = Random.new(v212)
					local v214 = v_u_15[v211]
					local v215 = v214.X + v213:NextNumber(-8, 8)
					local v216 = v214.Y + v213:NextNumber(-8, 8)
					local v217 = v214.Z + v213:NextNumber(-8, 8)
					v211.Orientation = Vector3.new(v215, v216, v217)
					local v218 = v211.Size.X
					local v219 = v213:NextNumber(-v218, v218) * 0.25
					local v220 = v213:NextNumber(-v218, v218) * 0.25
					local v221 = v213:NextNumber(-v218, v218) * 0.25
					local v222 = v_u_14[v211]
					local v223 = math.clamp(v219, 0, 1)
					local v224 = math.clamp(v220, 0, 1)
					local v225 = math.clamp(v221, 0, 1)
					v211.Position = v222 + Vector3.new(v223, v224, v225)
					v211:AddTag("SlicedVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p226, _)
			-- upvalues: (copy) v_u_15, (copy) v_u_14
			for _, v227 in p226:GetDescendants() do
				if (v227:IsA("BasePart") or v227:IsA("UnionOperation")) and v227:HasTag("SlicedVisual") then
					local v228
					if v_u_15[v227] then
						v228 = v_u_15[v227]
					else
						v228 = v227.Orientation
					end
					v227.Orientation = v228
					local v229
					if v_u_14[v227] then
						v229 = v_u_14[v227]
					else
						v229 = v227.Position
					end
					v227.Position = v229
					v227:RemoveTag("SlicedVisual")
				end
			end
		end
	},
	["Alienlike"] = {
		["Id"] = "j",
		["Name"] = "Alienlike",
		["ValueMulti"] = 100,
		["Color"] = Color3.fromRGB(0, 223, 197),
		["_AddFX"] = function(p230, p231, p232)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p230:_RemoveFX(p231, p232)
			if p232 then
				for _, v233 in game.ServerStorage.Mutation_FX.Alienlike:GetChildren() do
					local v234 = v233:Clone()
					v234.Parent = p232
					v234.Enabled = true
					v234:AddTag("Cleanup_Alienlike")
				end
			end
			for _, v235 in p231:GetDescendants() do
				if (v235:IsA("BasePart") or v235:IsA("UnionOperation")) and not v235:HasTag("Effect") then
					v_u_13[v235] = v_u_13[v235] or v235.Color
					v235.Color = Color3.fromRGB(0, 255, 217)
					if Random.new():NextInteger(1, 2) == 1 then
						v_u_16[v235] = v_u_16[v235] or v235.Material
						v235.Material = Enum.Material.ForceField
					end
					v235:AddTag("AlienlikeVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p236, p237)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p237 then
				for _, v238 in p237:GetChildren() do
					if v238:HasTag("Cleanup_Alienlike") then
						v238:Destroy()
					end
				end
			end
			for _, v239 in p236:GetDescendants() do
				if (v239:IsA("BasePart") or v239:IsA("UnionOperation")) and v239:HasTag("AlienlikeVisual") then
					v239.Reflectance = 0
					v239.Color = v_u_13[v239] or v239.Color
					v_u_13[v239] = nil
					v239:RemoveTag("AlienlikeVisual")
					if v_u_16[v239] then
						v239.Material = v_u_16[v239]
						v_u_16[v239] = nil
					end
				end
			end
		end
	},
	["Galactic"] = {
		["Id"] = "k",
		["Name"] = "Galactic",
		["ValueMulti"] = 120,
		["Color"] = Color3.fromRGB(243, 148, 255),
		["_AddFX"] = function(p240, p241, p242)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p240:_RemoveFX(p241, p242)
			if p242 then
				for _, v243 in game.ServerStorage.Mutation_FX.Galactic:GetChildren() do
					local v244 = v243:Clone()
					v244.Parent = p242
					v244.Enabled = true
					v244:AddTag("Cleanup_Galactic")
				end
			end
			for _, v245 in p241:GetDescendants() do
				if (v245:IsA("BasePart") or v245:IsA("UnionOperation")) and not v245:HasTag("Effect") then
					v_u_13[v245] = v_u_13[v245] or v245.Color
					v245.Color = Color3.fromRGB(226, 152, 255)
					if Random.new():NextInteger(1, 2) == 1 then
						v_u_16[v245] = v_u_16[v245] or v245.Material
						v245.Material = Enum.Material.Neon
					end
					v245:AddTag("GalacticVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p246, p247)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p247 then
				for _, v248 in p247:GetChildren() do
					if v248:HasTag("Cleanup_Galactic") then
						v248:Destroy()
					end
				end
			end
			for _, v249 in p246:GetDescendants() do
				if (v249:IsA("BasePart") or v249:IsA("UnionOperation")) and v249:HasTag("GalacticVisual") then
					v249.Reflectance = 0
					v249.Color = v_u_13[v249] or v249.Color
					v_u_13[v249] = nil
					v249:RemoveTag("GalacticVisual")
					if v_u_16[v249] then
						v249.Material = v_u_16[v249]
						v_u_16[v249] = nil
					end
				end
			end
		end
	},
	["Drenched"] = {
		["Id"] = "dr",
		["Name"] = "Drenched",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(0, 55, 228),
		["_AddFX"] = function(p250, p251, p252)
			-- upvalues: (copy) v_u_13
			p250:_RemoveFX(p251, p252)
			if p252 then
				for _, v253 in game.ServerStorage.Mutation_FX.Drenched:GetChildren() do
					local v254 = v253:Clone()
					v254.Parent = p252
					v254.Enabled = true
					v254:AddTag("Cleanup_Drenched")
				end
			end
			for _, v255 in p251:GetChildren() do
				if v255:IsA("BasePart") or v255:IsA("UnionOperation") then
					v_u_13[v255] = v_u_13[v255] or v255.Color
					local v256, v257, v258 = v255.Color:ToHSV()
					local v259 = v257 + 0.1
					local v260 = math.clamp(v259, v257, 1)
					local v261 = v258 + 0.05
					local v262 = math.clamp(v261, v258, 1)
					v255.Color = Color3.fromHSV(v256, v260, v262)
				end
			end
		end,
		["_RemoveFX"] = function(_, p263, p264)
			-- upvalues: (copy) v_u_13, (copy) v_u_16, (copy) v_u_17
			if p264 then
				for _, v265 in p264:GetChildren() do
					if v265:HasTag("Cleanup_Drenched") then
						v265:Destroy()
					end
				end
			end
			for _, v266 in p263:GetChildren() do
				if v266:IsA("BasePart") or v266:IsA("UnionOperation") then
					v266.Color = v_u_13[v266] or v266.Color
					v_u_13[v266] = nil
					if v_u_16[v266] then
						v266.Material = v_u_16[v266]
						v_u_16[v266] = nil
					end
					if v_u_17[v266] then
						v266.MaterialVariant = v_u_17[v266]
						v_u_17[v266] = nil
					end
				end
			end
		end
	},
	["Aurora"] = {
		["Id"] = "l",
		["Name"] = "Aurora",
		["ValueMulti"] = 90,
		["Color"] = Color3.fromRGB(99, 89, 175),
		["_AddFX"] = function(p267, p268, p269)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p267:_RemoveFX(p268, p269)
			for v270, v271 in p268:GetDescendants() do
				if v271:IsA("BasePart") or v271:IsA("UnionOperation") then
					if v270 % 5 == 0 then
						local v272 = game.ServerStorage.Mutation_FX.Aurora.Light:Clone()
						v272.Parent = v271
						v272.Enabled = true
						v272:AddTag("Cleanup_Aurora")
					end
					if not v271:HasTag("Effect") then
						local v273 = Random.new():NextInteger(1, 3)
						v_u_13[v271] = v_u_13[v271] or v271.Color
						if v273 == 1 then
							v271.Color = Color3.fromRGB(150, 92, 186)
						elseif v273 == 2 then
							v271.Color = Color3.fromRGB(87, 91, 171)
						elseif v273 == 3 then
							v271.Color = Color3.fromRGB(76, 156, 165)
						end
						v_u_16[v271] = v_u_16[v271] or v271.Material
						v271.Material = Enum.Material.Neon
						v271:AddTag("AuroraVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p274, p275)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p275 then
				for _, v276 in p275:GetChildren() do
					if v276:HasTag("Cleanup_Aurora") then
						v276:Destroy()
					end
				end
			end
			for _, v277 in p274:GetDescendants() do
				if (v277:IsA("BasePart") or v277:IsA("UnionOperation")) and v277:HasTag("GalacticVisual") then
					v277.Reflectance = 0
					v277.Color = v_u_13[v277] or v277.Color
					v_u_13[v277] = nil
					v277:RemoveTag("AuroraVisual")
					if v_u_16[v277] then
						v277.Material = v_u_16[v277]
						v_u_16[v277] = nil
					end
				end
			end
		end
	},
	["Chilled"] = {
		["Id"] = "m",
		["Name"] = "Chilled",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(135, 206, 250),
		["_AddFX"] = function(p278, p279, p280)
			p278:_RemoveFX(p279, p280)
			if p280 then
				for _, v281 in game.ServerStorage.Mutation_FX.Chilled:GetChildren() do
					local v282 = v281:Clone()
					v282.Parent = p280
					v282.Enabled = true
					v282:AddTag("Cleanup_Chilled")
				end
			end
			for _, v283 in p279:GetChildren() do
				if v283:IsA("BasePart") or v283:IsA("UnionOperation") then
					v283.Reflectance = 0.1
				end
			end
		end,
		["_RemoveFX"] = function(_, p284, p285)
			if p285 then
				for _, v286 in p285:GetChildren() do
					if v286:HasTag("Cleanup_Chilled") then
						v286:Destroy()
					end
				end
			end
			for _, v287 in p284:GetChildren() do
				if v287:IsA("BasePart") or v287:IsA("UnionOperation") then
					v287.Reflectance = 0
				end
			end
		end
	},
	["Sundried"] = {
		["Id"] = "n",
		["Name"] = "Sundried",
		["ValueMulti"] = 85,
		["Color"] = Color3.fromRGB(207, 93, 0),
		["_AddFX"] = function(p288, p289, p290)
			-- upvalues: (copy) v_u_13
			p288:_RemoveFX(p289, p290)
			for _, v291 in p289:GetChildren() do
				if v291:IsA("BasePart") or v291:IsA("UnionOperation") then
					v_u_13[v291] = v_u_13[v291] or v291.Color
					v291.Color = Color3.fromRGB(v291.Color.R * 178.5, v291.Color.G * 127.5, v291.Color.B * 127.5)
				end
			end
		end,
		["_RemoveFX"] = function(_, p292, _)
			-- upvalues: (copy) v_u_13
			for _, v293 in p292:GetChildren() do
				if v293:IsA("BasePart") or v293:IsA("UnionOperation") then
					v293.Color = v_u_13[v293] or v293.Color
					v_u_13[v293] = nil
				end
			end
		end
	},
	["Wiltproof"] = {
		["Id"] = "o",
		["Name"] = "Wiltproof",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(0, 222, 155),
		["_AddFX"] = function(p294, p295, p296)
			-- upvalues: (copy) v_u_13
			p294:_RemoveFX(p295, p296)
			for _, v297 in p295:GetChildren() do
				if v297:IsA("BasePart") or v297:IsA("UnionOperation") then
					v_u_13[v297] = v_u_13[v297] or v297.Color
					local v298 = v297.Color
					local v299 = v298.R * 0.3 + v298.G * 0.59 + v298.B * 0.11
					local v300 = Color3.new
					local v301 = v299 + (v298.R - v299) * 3
					local v302 = math.clamp(v301, 0, 1)
					local v303 = v299 + (v298.G - v299) * 4
					local v304 = math.clamp(v303, 0, 1)
					local v305 = v299 + (v298.B - v299) * 3
					v297.Color = v300(v302, v304, (math.clamp(v305, 0, 1)))
				end
			end
		end,
		["_RemoveFX"] = function(_, p306, _)
			-- upvalues: (copy) v_u_13, (copy) v_u_16, (copy) v_u_17
			for _, v307 in p306:GetChildren() do
				if v307:IsA("BasePart") or v307:IsA("UnionOperation") then
					v307.Color = v_u_13[v307] or v307.Color
					v_u_13[v307] = nil
					if v_u_16[v307] then
						v307.Material = v_u_16[v307]
						v_u_16[v307] = nil
					end
					if v_u_17[v307] then
						v307.MaterialVariant = v_u_17[v307]
						v_u_17[v307] = nil
					end
				end
			end
		end
	},
	["Drenched"] = {
		["Id"] = "p",
		["Name"] = "Drenched",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(0, 55, 228),
		["_AddFX"] = function(p308, p309, p310)
			-- upvalues: (copy) v_u_13
			p308:_RemoveFX(p309, p310)
			if p310 then
				for _, v311 in game.ServerStorage.Mutation_FX.Drenched:GetChildren() do
					local v312 = v311:Clone()
					v312.Parent = p310
					v312.Enabled = true
					v312:AddTag("Cleanup_Drenched")
				end
			end
			for _, v313 in p309:GetChildren() do
				if v313:IsA("BasePart") or v313:IsA("UnionOperation") then
					v_u_13[v313] = v_u_13[v313] or v313.Color
					local v314, v315, v316 = v313.Color:ToHSV()
					local v317 = v315 + 0.1
					local v318 = math.clamp(v317, v315, 1)
					local v319 = v316 + 0.05
					local v320 = math.clamp(v319, v316, 1)
					v313.Color = Color3.fromHSV(v314, v318, v320)
				end
			end
		end,
		["_RemoveFX"] = function(_, p321, p322)
			-- upvalues: (copy) v_u_13, (copy) v_u_16, (copy) v_u_17
			if p322 then
				for _, v323 in p322:GetChildren() do
					if v323:HasTag("Cleanup_Drenched") then
						v323:Destroy()
					end
				end
			end
			for _, v324 in p321:GetChildren() do
				if v324:IsA("BasePart") or v324:IsA("UnionOperation") then
					v324.Color = v_u_13[v324] or v324.Color
					v_u_13[v324] = nil
					if v_u_16[v324] then
						v324.Material = v_u_16[v324]
						v_u_16[v324] = nil
					end
					if v_u_17[v324] then
						v324.MaterialVariant = v_u_17[v324]
						v_u_17[v324] = nil
					end
				end
			end
		end
	},
	["Verdant"] = {
		["Id"] = "q",
		["Name"] = "Verdant",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(34, 139, 34),
		["_AddFX"] = function(p325, p326, p327)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p325:_RemoveFX(p326, p327)
			if p327 then
				for _, v328 in game.ServerStorage.Mutation_FX.Verdant:GetChildren() do
					local v329 = v328:Clone()
					v329.Parent = p327
					v329.Enabled = true
					v329:AddTag("Cleanup_Verdant")
				end
			end
			for v330, v331 in p326:GetDescendants() do
				if v331:IsA("BasePart") or v331:IsA("UnionOperation") then
					if v330 % 6 == 0 then
						local v332 = game.ServerStorage.Mutation_FX.Verdant.LeafSwirl:Clone()
						v332.Parent = v331
						v332.Enabled = true
						v332:AddTag("Cleanup_Verdant")
					end
					if not v331:HasTag("Effect") then
						local v333 = v331.Color
						v_u_13[v331] = v_u_13[v331] or v331.Color
						v_u_16[v331] = v_u_16[v331] or v331.Material
						local v334 = Color3.fromRGB
						local v335 = v333.R * 166 * 0.5
						local v336 = v333.G * 255 + 150
						v331.Color = v334(v335, math.clamp(v336, 0, 255) * 0.5, v333.B * 166 * 0.5)
						v331:AddTag("VerdantVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p337, p338)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p338 then
				for _, v339 in p338:GetChildren() do
					if v339:HasTag("Cleanup_Verdant") then
						v339:Destroy()
					end
				end
			end
			for _, v340 in p337:GetDescendants() do
				if (v340:IsA("BasePart") or v340:IsA("UnionOperation")) and v340:HasTag("VerdantVisual") then
					v340:RemoveTag("VerdantVisual")
					v340.Color = v_u_13[v340] or v340.Color
					v_u_13[v340] = nil
					if v_u_16[v340] then
						v340.Material = v_u_16[v340]
						v_u_16[v340] = nil
					end
					v340.Reflectance = 0
				end
			end
		end
	},
	["Paradisal"] = {
		["Id"] = "r",
		["Name"] = "Paradisal",
		["ValueMulti"] = 100,
		["Color"] = Color3.fromRGB(176, 240, 0),
		["_AddFX"] = function(p341, p342, p343)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p341:_RemoveFX(p342, p343)
			if p343 then
				for _, v344 in game.ServerStorage.Mutation_FX.Paradisal:GetChildren() do
					local v345 = v344:Clone()
					v345.Parent = p343
					v345.Enabled = true
					v345:AddTag("Cleanup_Paradisal")
				end
			end
			for v346, v347 in p342:GetDescendants() do
				if v347:IsA("BasePart") or v347:IsA("UnionOperation") then
					if v346 % 6 == 0 then
						local v348 = game.ServerStorage.Mutation_FX.Paradisal.Rays:Clone()
						v348.Parent = v347
						v348.Enabled = true
						v348:AddTag("Cleanup_Paradisal")
					end
					if not v347:HasTag("Effect") then
						v_u_13[v347] = v_u_13[v347] or v347.Color
						v_u_16[v347] = v_u_16[v347] or v347.Material
						v347.Color = Color3.fromRGB(176, 240, 0)
						v347:AddTag("ParadisalVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p349, p350)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p350 then
				for _, v351 in p350:GetChildren() do
					if v351:HasTag("Cleanup_Paradisal") then
						v351:Destroy()
					end
				end
			end
			for _, v352 in p349:GetDescendants() do
				if (v352:IsA("BasePart") or v352:IsA("UnionOperation")) and v352:HasTag("ParadisalVisual") then
					v352:RemoveTag("ParadisalVisual")
					v352.Color = v_u_13[v352] or v352.Color
					v_u_13[v352] = nil
					if v_u_16[v352] then
						v352.Material = v_u_16[v352]
						v_u_16[v352] = nil
					end
					v352.Reflectance = 0
				end
			end
		end
	},
	["Glitched"] = {
		["Id"] = "gli",
		["Name"] = "Glitched",
		["ValueMulti"] = 85,
		["Color"] = Color3.fromRGB(240, 96, 228),
		["_AddFX"] = function(p353, p354, p355)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p353:_RemoveFX(p354, p355)
			if p355 then
				for _, v356 in game.ServerStorage.Mutation_FX.Glitched:GetChildren() do
					local v357 = v356:Clone()
					v357.Parent = p355
					v357.Enabled = true
					v357:AddTag("Cleanup_Glitched")
				end
			end
			local v358 = {
				Color3.fromRGB(240, 96, 228),
				Color3.fromRGB(79, 237, 240),
				Color3.fromRGB(84, 240, 67),
				Color3.fromRGB(217, 217, 217),
				Color3.fromRGB(39, 39, 255)
			}
			for v359, v360 in p354:GetDescendants() do
				if v360:IsA("BasePart") or v360:IsA("UnionOperation") then
					if v359 % 6 == 0 then
						local v361 = game.ServerStorage.Mutation_FX.Glitched.Glitchy:Clone()
						v361.Parent = v360
						v361.Enabled = true
						v361.Rate = math.random(12, 35) / 10
						v361:AddTag("Cleanup_Glitched")
					end
					if not v360:HasTag("Effect") then
						v_u_13[v360] = v_u_13[v360] or v360.Color
						v_u_16[v360] = v_u_16[v360] or v360.Material
						v360.Color = v358[math.random(1, #v358)]
						v360.Material = "ForceField"
						v360:AddTag("GlitchedVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p362, p363)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p363 then
				for _, v364 in p363:GetChildren() do
					if v364:HasTag("Cleanup_Glitched") then
						v364:Destroy()
					end
				end
			end
			for _, v365 in p362:GetDescendants() do
				if (v365:IsA("BasePart") or v365:IsA("UnionOperation")) and v365:HasTag("GlitchedVisual") then
					v365:RemoveTag("GlitchedVisual")
					v365.Color = v_u_13[v365] or v365.Color
					v_u_13[v365] = nil
					if v_u_16[v365] then
						v365.Material = v_u_16[v365]
						v_u_16[v365] = nil
					end
					v365.Reflectance = 0
				end
			end
		end
	},
	["Glimmering"] = {
		["Id"] = "glm",
		["Name"] = "Glimmering",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(255, 135, 245),
		["_AddFX"] = function(p366, p367, p368)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p366:_RemoveFX(p367, p368)
			if p368 then
				for _, v369 in game.ServerStorage.Mutation_FX.Glimmering:GetChildren() do
					local v370 = v369:Clone()
					v370.Parent = p368
					v370.Enabled = true
					v370:AddTag("Cleanup_Enchanment")
				end
			end
			local v371 = { Color3.fromRGB(246, 142, 255), Color3.fromRGB(176, 130, 255), Color3.fromRGB(255, 80, 238) }
			for v372, v373 in p367:GetDescendants() do
				if v373:IsA("BasePart") or v373:IsA("UnionOperation") then
					if v372 % 6 == 0 then
						local v374 = game.ServerStorage.Mutation_FX.Glimmering.Sparkle:Clone()
						v374.Parent = v373
						v374.Enabled = true
						v374.Rate = math.random(8, 25) / 10
						v374:AddTag("Cleanup_Glimmering")
						local v375 = Instance.new("Attachment", v373)
						v375:AddTag("Cleanup_Glimmering")
						local v376 = Instance.new("Attachment", v373)
						v376:AddTag("Cleanup_Glimmering")
						v375.Position = Vector3.new(0, 0.1, 0)
						v376.Position = Vector3.new(0, -0.1, 0)
						local v377 = Instance.new("Trail")
						v377.Color = ColorSequence.new(Color3.fromRGB(105, 30, 255))
						v377.LightInfluence = 0
						v377.Brightness = 3
						v377.Attachment0 = v375
						v377.Attachment1 = v376
						v377.Lifetime = 0.3
						v377.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
						v377.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
						v377.Parent = v373
						v377:AddTag("Cleanup_Glimmering")
					end
					if not v373:HasTag("Effect") then
						v_u_13[v373] = v_u_13[v373] or v373.Color
						v_u_16[v373] = v_u_16[v373] or v373.Material
						if v373.Transparency ~= 1 then
							v373.Color = v371[math.random(1, #v371)]
							v373.Material = "Neon"
							v373:SetAttribute("OTransparency", v373.Transparency)
							v373.Transparency = 0.5
							v373:AddTag("EnchanmentVisual")
						end
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p378, p379)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p379 then
				for _, v380 in p379:GetChildren() do
					if v380:HasTag("Cleanup_Glimmering") then
						v380:Destroy()
					end
				end
			end
			for _, v381 in p378:GetDescendants() do
				if (v381:IsA("BasePart") or v381:IsA("UnionOperation")) and v381:HasTag("EnchamtmentVisual") then
					v381:RemoveTag("EnchamtmentVisual")
					v381.Color = v_u_13[v381] or v381.Color
					v_u_13[v381] = nil
					v381.Transparency = v381:GetAttribute("OTransparency") or 0
					if v_u_16[v381] then
						v381.Material = v_u_16[v381]
						v_u_16[v381] = nil
					end
					v381.Reflectance = 0
				end
			end
		end
	},
	["Enchanted"] = {
		["Id"] = "Enc",
		["Name"] = "Enchanted",
		["ValueMulti"] = 50,
		["Color"] = Color3.fromRGB(255, 214, 89),
		["_AddFX"] = function(p382, p383, p384)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p382:_RemoveFX(p383, p384)
			if p384 then
				for _, v385 in game.ServerStorage.Mutation_FX.Enchanted:GetChildren() do
					local v386 = v385:Clone()
					v386.Parent = p384
					v386.Enabled = true
					v386:AddTag("Cleanup_Enchanment")
				end
			end
			local v387 = { Color3.fromRGB(255, 214, 89), Color3.fromRGB(255, 159, 80), Color3.fromRGB(255, 244, 123) }
			for v388, v389 in p383:GetDescendants() do
				if v389:IsA("BasePart") or v389:IsA("UnionOperation") then
					if v388 % 6 == 0 then
						local v390 = game.ServerStorage.Mutation_FX.Enchanted.Sparkle:Clone()
						v390.Parent = v389
						v390.Enabled = true
						v390.Rate = math.random(8, 25) / 10
						v390:AddTag("Cleanup_Enchanment")
						local v391 = Instance.new("Attachment", v389)
						v391:AddTag("Cleanup_Enchanment")
						local v392 = Instance.new("Attachment", v389)
						v392:AddTag("Cleanup_Enchanment")
						v391.Position = Vector3.new(0, 0.1, 0)
						v392.Position = Vector3.new(0, -0.1, 0)
						local v393 = Instance.new("Trail")
						v393.Color = ColorSequence.new(Color3.fromRGB(255, 214, 89))
						v393.LightInfluence = 0
						v393.Brightness = 3
						v393.Attachment0 = v391
						v393.Attachment1 = v392
						v393.Lifetime = 0.3
						v393.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
						v393.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
						v393.Parent = v389
						v393:AddTag("Cleanup_Enchanment")
					end
					if not v389:HasTag("Effect") then
						v_u_13[v389] = v_u_13[v389] or v389.Color
						v_u_16[v389] = v_u_16[v389] or v389.Material
						if v389.Transparency ~= 1 then
							v389.Color = v387[math.random(1, #v387)]
							v389.Material = "Neon"
							v389:SetAttribute("OTransparency", v389.Transparency)
							v389.Transparency = 0.5
							v389:AddTag("EnchanmentVisual")
						end
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p394, p395)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p395 then
				for _, v396 in p395:GetChildren() do
					if v396:HasTag("Cleanup_Enchantment") then
						v396:Destroy()
					end
				end
			end
			for _, v397 in p394:GetDescendants() do
				if (v397:IsA("BasePart") or v397:IsA("UnionOperation")) and v397:HasTag("EnchamtmentVisual") then
					v397:RemoveTag("EnchamtmentVisual")
					v397.Color = v_u_13[v397] or v397.Color
					v_u_13[v397] = nil
					v397.Transparency = v397:GetAttribute("OTransparency") or 0
					if v_u_16[v397] then
						v397.Material = v_u_16[v397]
						v_u_16[v397] = nil
					end
					v397.Reflectance = 0
				end
			end
		end
	},
	["Frozen"] = {
		["Id"] = "s",
		["Name"] = "Frozen",
		["ValueMulti"] = 10,
		["Color"] = Color3.fromRGB(108, 184, 255),
		["_AddFX"] = function(p398, p399, p400)
			-- upvalues: (copy) v_u_96
			v_u_96(p398, p399, p400, 0.8)
		end,
		["_RemoveFX"] = function(p401, p402, p403)
			-- upvalues: (copy) v_u_105
			v_u_105(p401, p402, p403)
		end
	},
	["Disco"] = {
		["Id"] = "t",
		["Name"] = "Disco",
		["ValueMulti"] = 125,
		["Color"] = Color3.fromRGB(255, 105, 180),
		["_AddFX"] = function(p404, p405, p406)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p404:_RemoveFX(p405, p406)
			local function v_u_409(p407)
				-- upvalues: (ref) v_u_13, (ref) v_u_16, (copy) v_u_409
				for _, v408 in p407:GetChildren() do
					if v408:IsA("BasePart") or v408:IsA("UnionOperation") then
						v_u_13[v408] = v_u_13[v408] or v408.Color
						v_u_16[v408] = v_u_16[v408] or v408.Material
						v408.Material = Enum.Material.Neon
						v408:AddTag("Discofied")
					elseif v408:IsA("Model") then
						v_u_409(v408)
					end
				end
			end
			v_u_409(p405)
		end,
		["_RemoveFX"] = function(_, p410, _)
			-- upvalues: (copy) v_u_13, (copy) v_u_16, (copy) v_u_5
			local v411 = {}
			for _, v412 in p410:GetDescendants() do
				if (v412:IsA("BasePart") or v412:IsA("UnionOperation")) and v412:HasTag("Discofied") then
					v412.Reflectance = 0
					v412:RemoveTag("Discofied")
					v412.Color = v_u_13[v412] or v412.Color
					v_u_13[v412] = nil
					local v413 = {
						["Part"] = v412,
						["Color"] = v412.Color
					}
					table.insert(v411, v413)
					local v414 = v_u_16[v412]
					if v414 then
						v412.Material = v414
						v_u_16[v412] = nil
					end
				end
			end
			v_u_5:FireAllClients(v411)
		end
	},
	["Choc"] = {
		["Id"] = "u",
		["Name"] = "Choc",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(92, 64, 51),
		["_AddFX"] = function(p415, p416, p417)
			-- upvalues: (copy) v_u_12
			p415:_RemoveFX(p416, p417)
			local function v_u_424(p418)
				-- upvalues: (ref) v_u_12, (copy) v_u_424
				for _, v_u_419 in p418:GetChildren() do
					if v_u_419:IsA("BasePart") or v_u_419:IsA("UnionOperation") then
						local v_u_420 = {}
						for _, v421 in game.ServerStorage.Mutation_Textures.Choc:GetChildren() do
							local v422 = v421:Clone()
							v422.Parent = v_u_419
							v422.Transparency = v_u_419.Transparency
							table.insert(v_u_420, v422)
							v422:AddTag("Cleanup_Choc")
						end
						v_u_12[v_u_419] = v_u_419.Changed:Connect(function()
							-- upvalues: (copy) v_u_419, (ref) v_u_12, (copy) v_u_420
							if v_u_419.Transparency == 0 then
								v_u_12[v_u_419]:Disconnect()
								for _, v423 in v_u_420 do
									v423.Transparency = 0
								end
							end
						end)
					elseif v_u_419:IsA("Model") then
						v_u_424(v_u_419)
					end
				end
			end
			v_u_424(p416)
		end,
		["_RemoveFX"] = function(_, p425, _)
			-- upvalues: (copy) v_u_12
			for _, v426 in p425:GetDescendants() do
				if v426:HasTag("Cleanup_Choc") then
					v426:Destroy()
				end
				if v_u_12[v426] then
					v_u_12[v426]:Disconnect()
				end
			end
		end
	},
	["Plasma"] = {
		["Id"] = "v",
		["Name"] = "Plasma",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(208, 43, 137),
		["_AddFX"] = function(p427, p428, p429)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p427:_RemoveFX(p428, p429)
			if p429 then
				for _, v430 in game.ServerStorage.Mutation_FX.Plasma:GetChildren() do
					local v431 = v430:Clone()
					v431.Parent = p429
					v431.Enabled = true
					v431:AddTag("Cleanup_Plasma")
				end
			end
			for _, v432 in p428:GetDescendants() do
				if (v432:IsA("BasePart") or v432:IsA("UnionOperation")) and not v432:HasTag("Effect") then
					v_u_13[v432] = v_u_13[v432] or v432.Color
					v432.Color = Color3.fromRGB(189, 67, 142)
					v_u_16[v432] = v_u_16[v432] or v432.Material
					v432.Material = Enum.Material.Neon
					v432.Reflectance = 0.05
					v432:AddTag("PlasmaVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p433, p434)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			local function v437(p435)
				for _, v436 in p435:GetDescendants() do
					if v436:HasTag("Cleanup_Plasma") then
						v436:Destroy()
					end
				end
			end
			if p434 then
				v437(p434)
			end
			if p433 then
				v437(p433)
			end
			for _, v438 in p433:GetDescendants() do
				if (v438:IsA("BasePart") or v438:IsA("UnionOperation")) and v438:HasTag("PlasmaVisual") then
					v438.Reflectance = 0
					v438.Color = v_u_13[v438] or v438.Color
					v_u_13[v438] = nil
					v438:RemoveTag("PlasmaVisual")
					if v_u_16[v438] then
						v438.Material = v_u_16[v438]
						v_u_16[v438] = nil
					end
				end
			end
		end
	},
	["Heavenly"] = {
		["Id"] = "w",
		["Name"] = "Heavenly",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(255, 249, 160),
		["_AddFX"] = function(p439, p440, p441)
			p439:_RemoveFX(p440, p441)
			if p441 then
				for _, v442 in game.ServerStorage.Mutation_FX.Heavenly:GetChildren() do
					local v443 = v442:Clone()
					v443.Parent = p441
					v443.Enabled = true
					v443:AddTag("Cleanup_Heavenly")
				end
			end
		end,
		["_RemoveFX"] = function(_, p444, p445)
			local function v448(p446)
				for _, v447 in p446:GetDescendants() do
					if v447:HasTag("Cleanup_Heavenly") then
						v447:Destroy()
					end
				end
			end
			if p445 then
				v448(p445)
			end
			if p444 then
				v448(p444)
			end
		end
	},
	["Burnt"] = {
		["Id"] = "x",
		["Name"] = "Burnt",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(40, 40, 40),
		["_AddFX"] = function(p449, p450, p451)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p449:_RemoveFX(p450, p451)
			if p451 then
				for _, v452 in game.ServerStorage.Mutation_FX.Burnt:GetChildren() do
					local v453 = v452:Clone()
					v453.Parent = p451
					v453.Enabled = true
					v453:AddTag("Cleanup_Burnt")
				end
			end
			for _, v454 in p450:GetDescendants() do
				if (v454:IsA("BasePart") or v454:IsA("UnionOperation")) and not v454:HasTag("Effect") then
					v_u_13[v454] = v_u_13[v454] or v454.Color
					v454.Color = Color3.fromRGB(25, 25, 25)
					v_u_16[v454] = v_u_16[v454] or v454.Material
					v454.Material = Enum.Material.Slate
					v454.Reflectance = 0.05
					v454:AddTag("BurntVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p455, p456)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			local function v459(p457)
				for _, v458 in p457:GetDescendants() do
					if v458:HasTag("Cleanup_Burnt") then
						v458:Destroy()
					end
				end
			end
			if p456 then
				v459(p456)
			end
			if p455 then
				v459(p455)
			end
			for _, v460 in p455:GetDescendants() do
				if (v460:IsA("BasePart") or v460:IsA("UnionOperation")) and v460:HasTag("BurntVisual") then
					v460.Reflectance = 0
					v460.Color = v_u_13[v460] or v460.Color
					v_u_13[v460] = nil
					v460:RemoveTag("BurntVisual")
					if v_u_16[v460] then
						v460.Material = v_u_16[v460]
						v_u_16[v460] = nil
					end
				end
			end
		end
	},
	["Cooked"] = {
		["Id"] = "y",
		["Name"] = "Cooked",
		["ValueMulti"] = 10,
		["Color"] = Color3.fromRGB(210, 120, 60),
		["_AddFX"] = function(p461, p462, p463)
			-- upvalues: (copy) v_u_13
			p461:_RemoveFX(p462, p463)
			if p463 then
				for _, v464 in game.ServerStorage.Mutation_FX.Cooked:GetChildren() do
					local v465 = v464:Clone()
					v465.Parent = p463
					v465.Enabled = true
					v465:AddTag("Cleanup_Cooked")
				end
			end
			for _, v466 in p462:GetDescendants() do
				if (v466:IsA("BasePart") or v466:IsA("UnionOperation")) and not v466:HasTag("Effect") then
					v_u_13[v466] = v_u_13[v466] or v466.Color
					v466.Color = Color3.fromRGB(210, 120, 60)
					v466:AddTag("CookedVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p467, p468)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			local function v471(p469)
				for _, v470 in p469:GetDescendants() do
					if v470:HasTag("Cleanup_Cooked") then
						v470:Destroy()
					end
				end
			end
			if p468 then
				v471(p468)
			end
			if p467 then
				v471(p467)
			end
			for _, v472 in p467:GetDescendants() do
				if (v472:IsA("BasePart") or v472:IsA("UnionOperation")) and v472:HasTag("CookedVisual") then
					v472.Reflectance = 0
					v472.Color = v_u_13[v472] or v472.Color
					v_u_13[v472] = nil
					v472:RemoveTag("CookedVisual")
					local v473 = v_u_16[v472]
					if v473 then
						v472.Material = v473
						v_u_16[v472] = nil
					end
				end
			end
		end
	},
	["Moonlit"] = {
		["Id"] = "z",
		["Name"] = "Moonlit",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(153, 141, 255),
		["_AddFX"] = function(p474, p475, p476)
			-- upvalues: (copy) v_u_13
			p474:_RemoveFX(p475, p476)
			if p476 then
				for _, v477 in game.ServerStorage.Mutation_FX.Moonlit:GetChildren() do
					local v478 = v477:Clone()
					v478.Parent = p476
					v478.Enabled = true
					v478:AddTag("Cleanup_Moonlit")
					v478:AddTag("Effect")
				end
			end
			for _, v479 in p475:GetDescendants() do
				if (v479:IsA("BasePart") or v479:IsA("UnionOperation")) and not v479:HasTag("Effect") then
					v_u_13[v479] = v_u_13[v479] or v479.Color
					v479.Color = Color3.fromRGB(62, 56, 86)
					v479.Reflectance = 0.3
					v479:AddTag("MoonlitVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p480, p481)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p481 then
				for _, v482 in p481:GetChildren() do
					if v482:HasTag("Cleanup_Moonlit") then
						v482:Destroy()
					end
				end
			end
			for _, v483 in p480:GetDescendants() do
				if (v483:IsA("BasePart") or v483:IsA("UnionOperation")) and v483:HasTag("MoonlitVisual") then
					v483.Color = v_u_13[v483] or v483.Color
					v_u_13[v483] = nil
					v483.Reflectance = 0
					v483:RemoveTag("MoonlitVisual")
					local v484 = v_u_16[v483]
					if v484 then
						v483.Material = v484
						v_u_16[v483] = nil
					end
				end
			end
		end
	},
	["Bloodlit"] = {
		["Id"] = "A",
		["Name"] = "Bloodlit",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(200, 0, 0),
		["_AddFX"] = function(p485, p486, p487)
			-- upvalues: (copy) v_u_13
			p485:_RemoveFX(p486, p487)
			if p487 then
				for _, v488 in game.ServerStorage.Mutation_FX.Bloodlit:GetChildren() do
					local v489 = v488:Clone()
					v489.Parent = p487
					v489.Enabled = true
					v489:AddTag("Cleanup_Bloodlit")
					v489:AddTag("Effect")
				end
			end
			for _, v490 in p486:GetDescendants() do
				if (v490:IsA("BasePart") or v490:IsA("UnionOperation")) and not v490:HasTag("Effect") then
					v_u_13[v490] = v_u_13[v490] or v490.Color
					v490.Color = Color3.fromRGB(143, 1, 3)
					v490.Reflectance = 0.3
					v490:AddTag("BloodlitVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p491, p492)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p492 then
				for _, v493 in p492:GetChildren() do
					if v493:HasTag("Cleanup_Bloodlit") then
						v493:Destroy()
					end
				end
			end
			for _, v494 in p491:GetDescendants() do
				if (v494:IsA("BasePart") or v494:IsA("UnionOperation")) and v494:HasTag("BloodlitVisual") then
					v494.Reflectance = 0
					v494.Color = v_u_13[v494] or v494.Color
					v_u_13[v494] = nil
					v494:RemoveTag("BloodlitVisual")
					local v495 = v_u_16[v494]
					if v495 then
						v494.Material = v495
						v_u_16[v494] = nil
					end
				end
			end
		end
	},
	["Zombified"] = {
		["Id"] = "B",
		["Name"] = "Zombified",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(128, 199, 127),
		["_AddFX"] = function(p496, p497, p498)
			p496:_RemoveFX(p497, p498)
			if p498 then
				for _, v499 in game.ServerStorage.Mutation_FX.Zombified:GetChildren() do
					local v500 = v499:Clone()
					v500.Parent = p498
					v500.Enabled = true
					v500:AddTag("Cleanup_Zombified")
					v500:AddTag("Effect")
				end
			end
			for _, v501 in p497:GetDescendants() do
				if (v501:IsA("BasePart") or v501:IsA("UnionOperation")) and not v501:HasTag("Effect") then
					v501:AddTag("ZombifiedVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p502, p503)
			-- upvalues: (copy) v_u_16
			if p503 then
				for _, v504 in p503:GetChildren() do
					if v504:HasTag("Cleanup_Zombified") then
						v504:Destroy()
					end
				end
			end
			for _, v505 in p502:GetDescendants() do
				if (v505:IsA("BasePart") or v505:IsA("UnionOperation")) and v505:HasTag("ZombifiedVisual") then
					v505:RemoveTag("ZombifiedVisual")
					local v506 = v_u_16[v505]
					if v506 then
						v505.Material = v506
						v_u_16[v505] = nil
					end
				end
			end
		end
	},
	["Celestial"] = {
		["Id"] = "C",
		["Name"] = "Celestial",
		["ValueMulti"] = 120,
		["Color"] = Color3.fromRGB(255, 0, 255),
		["_AddFX"] = function(p507, p508, p509)
			p507:_RemoveFX(p508, p509)
			if p509 then
				for _, v510 in game.ServerStorage.Mutation_FX.Celestial:GetChildren() do
					local v511 = v510:Clone()
					v511.Parent = p509
					v511.Enabled = true
					v511:AddTag("Cleanup_Celestial")
					v511:AddTag("Effect")
				end
			end
			for _, v512 in p508:GetDescendants() do
				if (v512:IsA("BasePart") or v512:IsA("UnionOperation")) and not v512:HasTag("Effect") then
					v512.Reflectance = 0.5
					v512:AddTag("CelestialVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p513, p514)
			-- upvalues: (copy) v_u_16
			if p514 then
				for _, v515 in p514:GetChildren() do
					if v515:HasTag("Cleanup_Celestial") then
						v515:Destroy()
					end
				end
			end
			for _, v516 in p513:GetDescendants() do
				if (v516:IsA("BasePart") or v516:IsA("UnionOperation")) and v516:HasTag("CelestialVisual") then
					v516.Reflectance = 0
					v516:RemoveTag("CelestialVisual")
					local v517 = v_u_16[v516]
					if v517 then
						v516.Material = v517
						v_u_16[v516] = nil
					end
				end
			end
		end
	},
	["Meteoric"] = {
		["Id"] = "D",
		["Name"] = "Meteoric",
		["ValueMulti"] = 125,
		["Color"] = Color3.fromRGB(73, 29, 193),
		["_AddFX"] = function(p518, p519, p520)
			p518:_RemoveFX(p519, p520)
			if p520 then
				for _, v521 in game.ServerStorage.Mutation_FX.Meteoric:GetChildren() do
					local v522 = v521:Clone()
					v522.Parent = p520
					v522.Enabled = true
					v522:AddTag("Cleanup_Meteoric")
					v522:AddTag("Effect")
				end
			end
			for _, v523 in p519:GetDescendants() do
				if (v523:IsA("BasePart") or v523:IsA("UnionOperation")) and not v523:HasTag("Effect") then
					v523.Reflectance = 0.5
					v523:AddTag("MeteoricVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p524, p525)
			-- upvalues: (copy) v_u_16
			if p525 then
				for _, v526 in p525:GetChildren() do
					if v526:HasTag("Cleanup_Meteoric") then
						v526:Destroy()
					end
				end
			end
			for _, v527 in p524:GetDescendants() do
				if (v527:IsA("BasePart") or v527:IsA("UnionOperation")) and v527:HasTag("MeteoricVisual") then
					v527.Reflectance = 0
					v527:RemoveTag("MeteoricVisual")
					local v528 = v_u_16[v527]
					if v528 then
						v527.Material = v528
						v_u_16[v527] = nil
					end
				end
			end
		end
	},
	["HoneyGlazed"] = {
		["Id"] = "E",
		["Name"] = "HoneyGlazed",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(255, 204, 0),
		["_AddFX"] = function(p529, p530, p531)
			p529:_RemoveFX(p530, p531)
			if p531 then
				for _, v532 in game.ServerStorage.Mutation_FX.Honey:GetChildren() do
					local v533 = v532:Clone()
					v533.Parent = p531
					v533.Enabled = true
					v533:AddTag("Cleanup_Honey")
					v533:AddTag("Effect")
				end
			end
			for _, v534 in p530:GetDescendants() do
				if (v534:IsA("BasePart") or v534:IsA("UnionOperation")) and not v534:HasTag("Effect") then
					v534:AddTag("HoneyVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p535, p536)
			-- upvalues: (copy) v_u_16
			if p536 then
				for _, v537 in p536:GetChildren() do
					if v537:HasTag("Cleanup_Honey") then
						v537:Destroy()
					end
				end
			end
			for _, v538 in p535:GetDescendants() do
				if (v538:IsA("BasePart") or v538:IsA("UnionOperation")) and v538:HasTag("HoneyVisual") then
					v538:RemoveTag("HoneyVisual")
					local v539 = v_u_16[v538]
					if v539 then
						v538.Material = v539
						v_u_16[v538] = nil
					end
				end
			end
		end
	},
	["Pollinated"] = {
		["Id"] = "F",
		["Name"] = "Pollinated",
		["ValueMulti"] = 3,
		["Color"] = Color3.fromRGB(255, 170, 0),
		["_AddFX"] = function(p540, p541, p542)
			-- upvalues: (copy) v_u_13
			p540:_RemoveFX(p541, p542)
			if p542 then
				for _, v543 in game.ServerStorage.Mutation_FX.Pollinated:GetChildren() do
					local v544 = v543:Clone()
					v544.Parent = p542
					v544.Enabled = true
					v544:AddTag("Cleanup_Pollinated")
					v544:AddTag("Effect")
				end
			end
			for _, v545 in p541:GetDescendants() do
				if (v545:IsA("BasePart") or v545:IsA("UnionOperation")) and not v545:HasTag("Effect") then
					v_u_13[v545] = v_u_13[v545] or v545.Color
					v545.Color = Color3.fromRGB(255, 170, 0)
					v545:AddTag("PollinatedlVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p546, p547)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p547 then
				for _, v548 in p547:GetChildren() do
					if v548:HasTag("Cleanup_Pollinated") then
						v548:Destroy()
					end
				end
			end
			for _, v549 in p546:GetDescendants() do
				if (v549:IsA("BasePart") or v549:IsA("UnionOperation")) and v549:HasTag("PollinatedlVisual") then
					v549:RemoveTag("PollinatedVisual")
					v549.Color = v_u_13[v549] or v549.Color
					v_u_13[v549] = nil
					local v550 = v_u_16[v549]
					if v550 then
						v549.Material = v550
						v_u_16[v549] = nil
					end
				end
			end
		end
	}
}
local v558 = {
	["Id"] = "G",
	["Name"] = "Amber",
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(255, 192, 0),
	["TimeData"] = {
		["TimeToChange"] = 86400,
		["AddMutationName"] = "OldAmber"
	},
	["_AddFX"] = function(p552, p553, p554)
		-- upvalues: (copy) v_u_96
		v_u_96(p552, p553, p554, 0.5)
	end,
	["_RemoveFX"] = function(p555, p556, p557)
		-- upvalues: (copy) v_u_105
		v_u_105(p555, p556, p557)
	end
}
v_u_551.Amber = v558
local v565 = {
	["Id"] = "H",
	["Name"] = "OldAmber",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(252, 106, 33),
	["TimeData"] = {
		["TimeToChange"] = 172800,
		["AddMutationName"] = "AncientAmber"
	},
	["_AddFX"] = function(p559, p560, p561)
		-- upvalues: (copy) v_u_96
		v_u_96(p559, p560, p561, 0.5)
	end,
	["_RemoveFX"] = function(p562, p563, p564)
		-- upvalues: (copy) v_u_105
		v_u_105(p562, p563, p564)
	end
}
v_u_551.OldAmber = v565
v_u_551.AncientAmber = {
	["Id"] = "I",
	["Name"] = "AncientAmber",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(204, 68, 0),
	["_AddFX"] = function(p566, p567, p568)
		-- upvalues: (copy) v_u_96
		v_u_96(p566, p567, p568, 0.5)
	end,
	["_RemoveFX"] = function(p569, p570, p571)
		-- upvalues: (copy) v_u_105
		v_u_105(p569, p570, p571)
	end
}
v_u_551.Sandy = {
	["Id"] = "J",
	["Name"] = "Sandy",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(212, 191, 141),
	["_AddFX"] = function(p572, p573, p574)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p572:_RemoveFX(p573, p574)
		if p574 then
			for _, v575 in game.ServerStorage.Mutation_FX.Sandy:GetChildren() do
				local v576 = v575:Clone()
				v576.Parent = p574
				v576.Enabled = true
				v576:AddTag("Cleanup_Sandy")
			end
		end
		for _, v577 in p573:GetDescendants() do
			if (v577:IsA("BasePart") or v577:IsA("UnionOperation")) and not v577:HasTag("Effect") then
				v_u_13[v577] = v_u_13[v577] or v577.Color
				v577.Color = Color3.fromRGB(240, 206, 119)
				v_u_16[v577] = v_u_16[v577] or v577.Material
				v577.Material = Enum.Material.Sand
				v577.Reflectance = 0
				v577:AddTag("SandyVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p578, p579)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v582(p580)
			for _, v581 in p580:GetDescendants() do
				if v581:HasTag("Cleanup_Sandy") then
					v581:Destroy()
				end
			end
		end
		if p579 then
			v582(p579)
		end
		if p578 then
			v582(p578)
		end
		for _, v583 in p578:GetDescendants() do
			if (v583:IsA("BasePart") or v583:IsA("UnionOperation")) and v583:HasTag("SandyVisual") then
				v583.Reflectance = 0
				v583.Color = v_u_13[v583] or v583.Color
				v_u_13[v583] = nil
				v583:RemoveTag("SandyVisual")
				if v_u_16[v583] then
					v583.Material = v_u_16[v583]
					v_u_16[v583] = nil
				end
			end
		end
	end
}
v_u_551.Clay = {
	["Id"] = "K",
	["Name"] = "Clay",
	["ValueMulti"] = 5,
	["Color"] = Color3.fromRGB(147, 129, 122),
	["_AddFX"] = function(p584, p585, p586)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p584:_RemoveFX(p585, p586)
		if p586 then
			for _, v587 in game.ServerStorage.Mutation_FX.Clay:GetChildren() do
				local v588 = v587:Clone()
				v588.Parent = p586
				v588.Enabled = true
				v588:AddTag("Cleanup_Clay")
			end
		end
		for _, v589 in p585:GetDescendants() do
			if (v589:IsA("BasePart") or v589:IsA("UnionOperation")) and not v589:HasTag("Effect") then
				v_u_13[v589] = v_u_13[v589] or v589.Color
				v589.Color = Color3.fromRGB(147, 129, 122)
				v_u_16[v589] = v_u_16[v589] or v589.Material
				v589.Material = Enum.Material.Plaster
				v589.Reflectance = 0.5
				v589:AddTag("ClayVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p590, p591)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v594(p592)
			for _, v593 in p592:GetDescendants() do
				if v593:HasTag("Cleanup_Clay") then
					v593:Destroy()
				end
			end
		end
		if p591 then
			v594(p591)
		end
		if p590 then
			v594(p590)
		end
		for _, v595 in p590:GetDescendants() do
			if (v595:IsA("BasePart") or v595:IsA("UnionOperation")) and v595:HasTag("ClayVisual") then
				v595.Reflectance = 0
				v595.Color = v_u_13[v595] or v595.Color
				v_u_13[v595] = nil
				v595:RemoveTag("ClayVisual")
				if v_u_16[v595] then
					v595.Material = v_u_16[v595]
					v_u_16[v595] = nil
				end
			end
		end
	end
}
v_u_551.Ceramic = {
	["Id"] = "L",
	["Name"] = "Ceramic",
	["ValueMulti"] = 32,
	["Color"] = Color3.fromRGB(234, 184, 146),
	["_AddFX"] = function(p596, p597, p598)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p596:_RemoveFX(p597, p598)
		if p598 then
			for _, v599 in game.ServerStorage.Mutation_FX.Ceramic:GetChildren() do
				local v600 = v599:Clone()
				v600.Parent = p598
				v600.Enabled = true
				v600:AddTag("Cleanup_Ceramic")
			end
		end
		for _, v601 in p597:GetDescendants() do
			if (v601:IsA("BasePart") or v601:IsA("UnionOperation")) and not v601:HasTag("Effect") then
				v_u_13[v601] = v_u_13[v601] or v601.Color
				v601.Color = Color3.fromRGB(234, 184, 146)
				v_u_16[v601] = v_u_16[v601] or v601.Material
				v601.Material = Enum.Material.Concrete
				v601:AddTag("CeramicVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p602, p603)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v606(p604)
			for _, v605 in p604:GetDescendants() do
				if v605:HasTag("Cleanup_Ceramic") then
					v605:Destroy()
				end
			end
		end
		if p603 then
			v606(p603)
		end
		if p602 then
			v606(p602)
		end
		for _, v607 in p602:GetDescendants() do
			if (v607:IsA("BasePart") or v607:IsA("UnionOperation")) and v607:HasTag("CeramicVisual") then
				v607.Reflectance = 0
				v607.Color = v_u_13[v607] or v607.Color
				v_u_13[v607] = nil
				v607:RemoveTag("CeramicVisual")
				if v_u_16[v607] then
					v607.Material = v_u_16[v607]
					v_u_16[v607] = nil
				end
			end
		end
	end
}
v_u_551.Friendbound = {
	["Id"] = "M",
	["Name"] = "Friendbound",
	["ValueMulti"] = 70,
	["Color"] = Color3.fromRGB(255, 0, 127),
	["_AddFX"] = function(p608, p609, p610)
		-- upvalues: (copy) v_u_13
		p608:_RemoveFX(p609, p610)
		if p610 then
			for _, v611 in game.ServerStorage.Mutation_FX.Friendbound:GetChildren() do
				local v612 = v611:Clone()
				v612.Parent = p610
				v612.Enabled = true
				v612:AddTag("Cleanup_Friendbound")
			end
		end
		for _, v613 in p609:GetDescendants() do
			if (v613:IsA("BasePart") or v613:IsA("UnionOperation")) and not v613:HasTag("Effect") then
				v_u_13[v613] = v_u_13[v613] or v613.Color
				v613.Color = v_u_13[v613]:Lerp(Color3.fromRGB(255, 0, 127), 0.4)
				v613:AddTag("FriendboundVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p614, p615)
		-- upvalues: (copy) v_u_13
		local function v618(p616)
			for _, v617 in p616:GetDescendants() do
				if v617:HasTag("Cleanup_Friendbound") then
					v617:Destroy()
				end
			end
		end
		if p615 then
			v618(p615)
		end
		if p614 then
			v618(p614)
		end
		for _, v619 in p614:GetDescendants() do
			if (v619:IsA("BasePart") or v619:IsA("UnionOperation")) and v619:HasTag("FriendboundVisual") then
				v619.Color = v_u_13[v619] or v619.Color
				v_u_13[v619] = nil
				v619:RemoveTag("FriendboundVisual")
			end
		end
	end
}
v_u_551.Tempestuous = {
	["Id"] = "N",
	["Name"] = "Tempestuous",
	["ValueMulti"] = 12,
	["Color"] = Color3.fromRGB(143, 163, 180),
	["_AddFX"] = function(p620, p621, p622)
		p620:_RemoveFX(p621, p622)
		if p622 then
			for _, v623 in { game.ServerStorage.Mutation_FX.Twisted, game.ServerStorage.Mutation_FX.Tempestous } do
				for _, v624 in v623:GetChildren() do
					local v625 = v624:Clone()
					v625.Parent = p622
					v625.Enabled = true
					v625:AddTag("Cleanup_Tempestuous")
				end
			end
		end
		for _, v626 in p621:GetDescendants() do
			if (v626:IsA("BasePart") or v626:IsA("UnionOperation")) and not v626:HasTag("Effect") then
				v626:AddTag("TempestuousVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p627, p628)
		if p628 then
			for _, v629 in p628:GetChildren() do
				if v629:HasTag("Cleanup_Tempestuous") then
					v629:Destroy()
				end
			end
		end
		for _, v630 in p627:GetDescendants() do
			if (v630:IsA("BasePart") or v630:IsA("UnionOperation")) and v630:HasTag("TempestuousVisual") then
				v630:RemoveTag("TempestuousVisual")
			end
		end
	end
}
v_u_551.Infected = {
	["Id"] = "O",
	["Name"] = "Infected",
	["ValueMulti"] = 75,
	["Color"] = Color3.fromRGB(67, 167, 0),
	["_AddFX"] = function(p631, p632, p633)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p631:_RemoveFX(p632, p633)
		if p633 then
			for _, v634 in game.ServerStorage.Mutation_FX.Infected:GetChildren() do
				local v635 = v634:Clone()
				v635.Parent = p633
				v635.Enabled = true
				v635:AddTag("Cleanup_Infected")
			end
		end
		for _, v636 in p632:GetDescendants() do
			if (v636:IsA("BasePart") or v636:IsA("UnionOperation")) and not v636:HasTag("Effect") then
				v_u_13[v636] = v_u_13[v636] or v636.Color
				v636.Color = Color3.fromRGB(65, 175, 0)
				v_u_16[v636] = v_u_16[v636] or v636.Material
				v636:AddTag("InfectedVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p637, p638)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v641(p639)
			for _, v640 in p639:GetDescendants() do
				if v640:HasTag("Cleanup_Infected") then
					v640:Destroy()
				end
			end
		end
		if p638 then
			v641(p638)
		end
		if p637 then
			v641(p637)
		end
		for _, v642 in p637:GetDescendants() do
			if (v642:IsA("BasePart") or v642:IsA("UnionOperation")) and v642:HasTag("InfectedVisual") then
				v642.Reflectance = 0
				v642.Color = v_u_13[v642] or v642.Color
				v_u_13[v642] = nil
				v642:RemoveTag("InfectedVisual")
				if v_u_16[v642] then
					v642.Material = v_u_16[v642]
					v_u_16[v642] = nil
				end
			end
		end
	end
}
v_u_551.Radioactive = {
	["Id"] = "P",
	["Name"] = "Radioactive",
	["ValueMulti"] = 55,
	["Color"] = Color3.fromRGB(98, 255, 0),
	["_AddFX"] = function(p643, p644, p645)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p643:_RemoveFX(p644, p645)
		if p645 then
			for _, v646 in game.ServerStorage.Mutation_FX.Radioactive:GetChildren() do
				local v647 = v646:Clone()
				v647.Parent = p645
				v647.Enabled = true
				v647:AddTag("Cleanup_Radioactive")
			end
		end
		for _, v648 in p644:GetDescendants() do
			if (v648:IsA("BasePart") or v648:IsA("UnionOperation")) and not v648:HasTag("Effect") then
				v_u_13[v648] = v_u_13[v648] or v648.Color
				v648.Color = Color3.fromRGB(65, 175, 0)
				v_u_16[v648] = v_u_16[v648] or v648.Material
				v648.Material = Enum.Material.Neon
				v648:AddTag("RadioactiveVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p649, p650)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v653(p651)
			for _, v652 in p651:GetDescendants() do
				if v652:HasTag("Cleanup_Radioactive") then
					v652:Destroy()
				end
			end
		end
		if p650 then
			v653(p650)
		end
		if p649 then
			v653(p649)
		end
		for _, v654 in p649:GetDescendants() do
			if (v654:IsA("BasePart") or v654:IsA("UnionOperation")) and v654:HasTag("RadioactiveVisual") then
				v654.Reflectance = 0
				v654.Color = v_u_13[v654] or v654.Color
				v_u_13[v654] = nil
				v654:RemoveTag("RadioactiveVisual")
				if v_u_16[v654] then
					v654.Material = v_u_16[v654]
					v_u_16[v654] = nil
				end
			end
		end
	end
}
v_u_551.Chakra = {
	["Id"] = "R",
	["Name"] = "Chakra",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(255, 80, 65),
	["_AddFX"] = function(p655, p656, p657)
		p655:_RemoveFX(p656, p657)
		local v658 = game.ServerStorage.Mutation_FX.Chakra:GetChildren()
		if p657 then
			for _, v659 in v658 do
				local v660 = v659:Clone()
				v660.Parent = p657
				v660.Enabled = true
				v660:AddTag("Cleanup_Chakra")
			end
		end
		local v661 = 0
		for _, v662 in p656:GetDescendants() do
			if v662:IsA("BasePart") and v662 ~= p657 then
				v661 = v661 + 1
				if v661 % 3 == 0 then
					local v663 = v658[math.random(1, #v658)]:Clone()
					v663.Parent = v662
					v663.Enabled = true
					v663:AddTag("Cleanup_Chakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p664, p665)
		local function v668(p666)
			for _, v667 in p666:GetDescendants() do
				if v667:HasTag("Cleanup_Chakra") then
					v667:Destroy()
				end
			end
		end
		if p665 then
			v668(p665)
		end
		if p664 then
			v668(p664)
		end
	end
}
v_u_551.FoxfireChakra = {
	["Id"] = "S",
	["Name"] = "FoxfireChakra",
	["ValueMulti"] = 90,
	["Color"] = Color3.fromRGB(255, 80, 65),
	["_AddFX"] = function(p669, p670, p671)
		p669:_RemoveFX(p670, p671)
		local v672 = game.ServerStorage.Mutation_FX.FoxfireChakra:GetChildren()
		local v673 = nil
		for _, v674 in v672 do
			if v674.Name == "Flames" then
				v673 = v674
				break
			end
		end
		if p671 then
			for _, v675 in v672 do
				local v676 = v675:Clone()
				v676.Parent = p671
				v676.Enabled = true
				v676:AddTag("Cleanup_FoxfireChakra")
			end
		end
		local v677 = 0
		for _, v678 in p670:GetDescendants() do
			if v678:IsA("BasePart") and v678 ~= p671 then
				v677 = v677 + 1
				if v677 % 2 == 0 then
					local v679 = v672[math.random(1, #v672)]:Clone()
					v679.Parent = v678
					v679.Enabled = true
					v679:AddTag("Cleanup_FoxfireChakra")
				end
				if v677 % 3 == 0 and v673 then
					local v680 = v673:Clone()
					v680.Parent = v678
					v680.Enabled = true
					v680:AddTag("Cleanup_FoxfireChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p681, p682)
		local function v685(p683)
			for _, v684 in p683:GetDescendants() do
				if v684:HasTag("Cleanup_FoxfireChakra") then
					v684:Destroy()
				end
			end
		end
		if p682 then
			v685(p682)
		end
		if p681 then
			v685(p681)
		end
	end
}
v_u_551.CorruptChakra = {
	["Id"] = "T",
	["Name"] = "CorruptChakra",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(0, 85, 255),
	["_AddFX"] = function(p686, p687, p688)
		p686:_RemoveFX(p687, p688)
		local v689 = game.ServerStorage.Mutation_FX.CorruptChakra:GetChildren()
		if p688 then
			for _, v690 in v689 do
				local v691 = v690:Clone()
				v691.Parent = p688
				v691.Enabled = true
				v691:AddTag("Cleanup_CorruptChakra")
			end
		end
		local v692 = 0
		for _, v693 in p687:GetDescendants() do
			if v693:IsA("BasePart") and v693 ~= p688 then
				v692 = v692 + 1
				if v692 % 3 == 0 then
					local v694 = v689[math.random(1, #v689)]:Clone()
					v694.Parent = v693
					v694.Enabled = true
					v694:AddTag("Cleanup_CorruptChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p695, p696)
		local function v699(p697)
			for _, v698 in p697:GetDescendants() do
				if v698:HasTag("Cleanup_CorruptChakra") then
					v698:Destroy()
				end
			end
		end
		if p696 then
			v699(p696)
		end
		if p695 then
			v699(p695)
		end
	end
}
v_u_551.CorruptFoxfireChakra = {
	["Id"] = "U",
	["Name"] = "CorruptFoxfireChakra",
	["ValueMulti"] = 90,
	["Color"] = Color3.fromRGB(0, 0, 255),
	["_AddFX"] = function(p700, p701, p702)
		p700:_RemoveFX(p701, p702)
		local v703 = game.ServerStorage.Mutation_FX.CorruptFoxfireChakra:GetChildren()
		local v704 = nil
		for _, v705 in v703 do
			if v705.Name == "Flames" then
				v704 = v705
				break
			end
		end
		if p702 then
			for _, v706 in v703 do
				local v707 = v706:Clone()
				v707.Parent = p702
				v707.Enabled = true
				v707:AddTag("Cleanup_CorruptFoxfireChakra")
			end
		end
		local v708 = 0
		for _, v709 in p701:GetDescendants() do
			if v709:IsA("BasePart") and v709 ~= p702 then
				v708 = v708 + 1
				if v708 % 2 == 0 then
					local v710 = v703[math.random(1, #v703)]:Clone()
					v710.Parent = v709
					v710.Enabled = true
					v710:AddTag("Cleanup_CorruptFoxfireChakra")
				end
				if v708 % 3 == 0 and v704 then
					local v711 = v704:Clone()
					v711.Parent = v709
					v711.Enabled = true
					v711:AddTag("Cleanup_CorruptFoxfireChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p712, p713)
		local function v716(p714)
			for _, v715 in p714:GetDescendants() do
				if v715:HasTag("Cleanup_CorruptFoxfireChakra") then
					v715:Destroy()
				end
			end
		end
		if p713 then
			v716(p713)
		end
		if p712 then
			v716(p712)
		end
	end
}
v_u_551.Static = {
	["Id"] = "V",
	["Name"] = "Static",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p717, p718, p719)
		p717:_RemoveFX(p718, p719)
		if p719 then
			for _, v720 in game.ServerStorage.Mutation_FX.Static:GetChildren() do
				local v721 = v720:Clone()
				v721.Parent = p719
				v721:AddTag("Cleanup_Static")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p722)
		if p722 then
			for _, v723 in p722:GetChildren() do
				if v723:HasTag("Cleanup_Static") then
					v723:Destroy()
				end
			end
		end
	end
}
v_u_551.HarmonisedChakra = {
	["Id"] = "W",
	["Name"] = "HarmonisedChakra",
	["ValueMulti"] = 35,
	["Color"] = Color3.fromRGB(170, 85, 255),
	["_AddFX"] = function(p724, p725, p726)
		p724:_RemoveFX(p725, p726)
		local v727 = game.ServerStorage.Mutation_FX.HarmonisedChakra:GetChildren()
		if p726 then
			for _, v728 in v727 do
				local v729 = v728:Clone()
				v729.Parent = p726
				v729.Enabled = true
				v729:AddTag("Cleanup_HarmonisedChakra")
			end
		end
		local v730 = 0
		for _, v731 in p725:GetDescendants() do
			if v731:IsA("BasePart") and v731 ~= p726 then
				v730 = v730 + 1
				if v730 % 3 == 0 then
					local v732 = v727[math.random(1, #v727)]:Clone()
					v732.Parent = v731
					v732.Enabled = true
					v732:AddTag("Cleanup_HarmonisedChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p733, p734)
		local function v737(p735)
			for _, v736 in p735:GetDescendants() do
				if v736:HasTag("Cleanup_HarmonisedChakra") then
					v736:Destroy()
				end
			end
		end
		if p734 then
			v737(p734)
		end
		if p733 then
			v737(p733)
		end
	end
}
v_u_551.HarmonisedFoxfireChakra = {
	["Id"] = "X",
	["Name"] = "HarmonisedFoxfireChakra",
	["ValueMulti"] = 190,
	["Color"] = Color3.fromRGB(170, 85, 255),
	["_AddFX"] = function(p738, p739, p740)
		p738:_RemoveFX(p739, p740)
		local v741 = game.ServerStorage.Mutation_FX.HarmonisedFoxfireChakra:GetChildren()
		local v742 = nil
		for _, v743 in v741 do
			if v743.Name == "Flames" then
				v742 = v743
				break
			end
		end
		if p740 then
			for _, v744 in v741 do
				local v745 = v744:Clone()
				v745.Parent = p740
				v745.Enabled = true
				v745:AddTag("Cleanup_HarmonisedFoxfireChakra")
			end
		end
		local v746 = 0
		for _, v747 in p739:GetDescendants() do
			if v747:IsA("BasePart") and v747 ~= p740 then
				v746 = v746 + 1
				if v746 % 2 == 0 then
					local v748 = v741[math.random(1, #v741)]:Clone()
					v748.Parent = v747
					v748.Enabled = true
					v748:AddTag("Cleanup_HarmonisedFoxfireChakra")
				end
				if v746 % 3 == 0 and v742 then
					local v749 = v742:Clone()
					v749.Parent = v747
					v749.Enabled = true
					v749:AddTag("Cleanup_HarmonisedFoxfireChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p750, p751)
		local function v754(p752)
			for _, v753 in p752:GetDescendants() do
				if v753:HasTag("Cleanup_HarmonisedFoxfireChakra") then
					v753:Destroy()
				end
			end
		end
		if p751 then
			v754(p751)
		end
		if p750 then
			v754(p750)
		end
	end
}
v_u_551.Pasta = {
	["Id"] = "PA",
	["Name"] = "Pasta",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(255, 223, 128),
	["_AddFX"] = function(p755, p756, p757)
		p755:_RemoveFX(p756, p757)
		local v758 = {}
		for _, v759 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
			if v759.Name == "Pasta" then
				table.insert(v758, v759)
			end
		end
		if p757 then
			for _, v760 in v758 do
				if not p757:FindFirstChild(v760.Name) then
					local v761 = v760:Clone()
					v761.Parent = p757
					v761.Enabled = true
					v761:AddTag("Cleanup_Pasta")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p762, p763)
		local function v766(p764)
			for _, v765 in p764:GetDescendants() do
				if v765:HasTag("Cleanup_Pasta") then
					v765:Destroy()
				end
			end
		end
		if p763 then
			v766(p763)
		end
		if p762 then
			v766(p762)
		end
	end
}
v_u_551.Sauce = {
	["Id"] = "SA",
	["Name"] = "Sauce",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(200, 45, 35),
	["_AddFX"] = function(p767, p768, p769)
		p767:_RemoveFX(p768, p769)
		local v770 = {}
		for _, v771 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
			if v771.Name == "Sauce" then
				table.insert(v770, v771)
			end
		end
		if p769 then
			for _, v772 in v770 do
				if not p769:FindFirstChild(v772.Name) then
					local v773 = v772:Clone()
					v773.Parent = p769
					v773.Enabled = true
					v773:AddTag("Cleanup_Sauce")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p774, p775)
		local function v778(p776)
			for _, v777 in p776:GetDescendants() do
				if v777:HasTag("Cleanup_Sauce") then
					v777:Destroy()
				end
			end
		end
		if p775 then
			v778(p775)
		end
		if p774 then
			v778(p774)
		end
	end
}
v_u_551.Meatball = {
	["Id"] = "MB",
	["Name"] = "Meatball",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(139, 69, 19),
	["_AddFX"] = function(p779, p780, p781)
		p779:_RemoveFX(p780, p781)
		local v782 = {}
		for _, v783 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
			if v783.Name == "Meatball" then
				table.insert(v782, v783)
			end
		end
		if p781 then
			for _, v784 in v782 do
				if not p781:FindFirstChild(v784.Name) then
					local v785 = v784:Clone()
					v785.Parent = p781
					v785.Enabled = true
					v785:AddTag("Cleanup_Meatball")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p786, p787)
		local function v790(p788)
			for _, v789 in p788:GetDescendants() do
				if v789:HasTag("Cleanup_Meatball") then
					v789:Destroy()
				end
			end
		end
		if p787 then
			v790(p787)
		end
		if p786 then
			v790(p786)
		end
	end
}
v_u_551.Spaghetti = {
	["Id"] = "SP",
	["Name"] = "Spaghetti",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(255, 140, 70),
	["_AddFX"] = function(p791, p792, p793)
		p791:_RemoveFX(p792, p793)
		local v794 = game.ServerStorage.Mutation_FX.Spaghetti:GetChildren()
		if p793 then
			for _, v795 in v794 do
				if not p793:FindFirstChild(v795.Name) then
					local v796 = v795:Clone()
					v796.Parent = p793
					v796.Enabled = true
					v796:AddTag("Cleanup_Spaghetti")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p797, p798)
		local function v801(p799)
			for _, v800 in p799:GetDescendants() do
				if v800:HasTag("Cleanup_Spaghetti") then
					v800:Destroy()
				end
			end
		end
		if p798 then
			v801(p798)
		end
		if p797 then
			v801(p797)
		end
	end
}
v_u_551.Eclipsed = {
	["Id"] = "EC",
	["Name"] = "Eclipsed",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(44, 111, 162),
	["_AddFX"] = function(p802, p803, p804)
		-- upvalues: (copy) v_u_13
		p802:_RemoveFX(p803, p804)
		if p804 then
			for _, v805 in game.ServerStorage.Mutation_FX.Eclipsed:GetChildren() do
				local v806 = v805:Clone()
				v806.Parent = p804
				v806.Enabled = true
				v806:AddTag("Cleanup_Eclipsed")
			end
		end
		for _, v807 in p803:GetDescendants() do
			if (v807:IsA("BasePart") or v807:IsA("UnionOperation")) and (not v807:HasTag("Effect") and (not v807.Transparency or v807.Transparency ~= 1)) then
				v_u_13[v807] = v_u_13[v807] or v807.Color
				v807.Color = v807.Color:Lerp(Color3.fromRGB(0, 0, 0), 0.45)
				v807:AddTag("EclipsedVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p808, p809)
		-- upvalues: (copy) v_u_13
		if p809 then
			for _, v810 in p809:GetChildren() do
				if v810:HasTag("Cleanup_Eclipsed") then
					v810:Destroy()
				end
			end
		end
		for _, v811 in p808:GetDescendants() do
			if (v811:IsA("BasePart") or v811:IsA("UnionOperation")) and v811:HasTag("EclipsedVisual") then
				v811.Color = v_u_13[v811] or v811.Color
				v_u_13[v811] = nil
				v811:RemoveTag("EclipsedVisual")
			end
		end
	end
}
v_u_551.Enlightened = {
	["Id"] = "EN",
	["Name"] = "Enlightened",
	["ValueMulti"] = 35,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p812, p813, p814)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p812:_RemoveFX(p813, p814)
		local v815 = Color3.fromRGB(218, 133, 65)
		local v816 = {}
		for _, v817 in p813:GetDescendants() do
			if (v817:IsA("BasePart") or v817:IsA("UnionOperation")) and not v817:HasTag("Effect") then
				local v818 = v817.Color
				v816[v818] = (v816[v818] or 0) + 1
			end
		end
		local v819 = 0
		for v820, v821 in pairs(v816) do
			if v819 <= v821 then
				v815 = v820
				v819 = v821
			end
		end
		for _, v822 in p813:GetDescendants() do
			if (v822:IsA("BasePart") or v822:IsA("UnionOperation")) and (not v822:HasTag("Effect") and (not v822.Transparency or v822.Transparency ~= 1) and v822.Color == v815) then
				v_u_13[v822] = v_u_13[v822] or v822.Color
				v822.Color = Color3.fromRGB(218, 133, 65)
				v_u_16[v822] = v_u_16[v822] or v822.Material
				v822.Material = Enum.Material.Neon
				v822:AddTag("EnlightenedVisual")
			end
		end
		if p814 then
			for _, v823 in game.ServerStorage.Mutation_FX.Enlightened:GetChildren() do
				local v824 = v823:Clone()
				v824.Parent = p814
				v824.Enabled = true
				v824:AddTag("Cleanup_Enlightened")
			end
		end
	end,
	["_RemoveFX"] = function(_, p825, p826)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v829(p827)
			for _, v828 in p827:GetDescendants() do
				if v828:HasTag("Cleanup_Enlightened") then
					v828:Destroy()
				end
			end
		end
		if p826 then
			v829(p826)
		end
		if p825 then
			v829(p825)
		end
		for _, v830 in p825:GetDescendants() do
			if (v830:IsA("BasePart") or v830:IsA("UnionOperation")) and v830:HasTag("EnlightenedVisual") then
				v830.Color = v_u_13[v830] or v830.Color
				v_u_13[v830] = nil
				v830:RemoveTag("EnlightenedVisual")
				if v_u_16[v830] then
					v830.Material = v_u_16[v830]
					v_u_16[v830] = nil
				end
			end
		end
	end
}
v_u_551.Tranquil = {
	["Id"] = "TQ",
	["Name"] = "Tranquil",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p831, p832, p833)
		p831:_RemoveFX(p832, p833)
		local v834 = p832:FindFirstChild("Item_Seed")
		local v835 = not (v834 and v834:IsA("NumberValue")) and 0 or v834.Value
		local v836 = Random.new(v835)
		local v837 = game.ServerStorage.Mutation_FX.Tranquil:GetChildren()
		local v838 = 0
		for _, v839 in p832:GetDescendants() do
			if (v839:IsA("BasePart") or v839:IsA("UnionOperation")) and not v839:HasTag("Effect") then
				v838 = v838 + 1
				if v838 % 5 == 0 or v838 == 1 then
					local v840 = v837[v836:NextInteger(1, #v837)]:Clone()
					v840.Enabled = true
					v840.Rate = v836:NextInteger(30, 50) * 0.01
					v840.Parent = v839
					v840:AddTag("Cleanup_Tranquil")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p841, p842)
		local function v845(p843)
			for _, v844 in p843:GetDescendants() do
				if v844:HasTag("Cleanup_Tranquil") then
					v844:Destroy()
				end
			end
		end
		if p842 then
			v845(p842)
		end
		if p841 then
			v845(p841)
		end
	end
}
v_u_551.Corrupt = {
	["Id"] = "CR",
	["Name"] = "Corrupt",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(176, 23, 26),
	["_AddFX"] = function(p846, p847, p848)
		p846:_RemoveFX(p847, p848)
		if p848 then
			for _, v849 in game.ServerStorage.Mutation_FX.Corrupt:GetChildren() do
				local v850 = v849:Clone()
				v850.Parent = p848
				v850:AddTag("Cleanup_Infected")
				if v850:IsA("ParticleEmitter") then
					v850.Enabled = true
				end
			end
		end
		for _, v851 in p847:GetDescendants() do
			if (v851:IsA("BasePart") or v851:IsA("UnionOperation")) and (not v851:HasTag("Effect") and (not v851.Transparency or v851.Transparency ~= 1)) then
				v851.Color = v851.Color:Lerp(Color3.fromRGB(176, 23, 26), 0.5)
				v851:AddTag("CorruptVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p852, p853)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v856(p854)
			for _, v855 in p854:GetDescendants() do
				if v855:HasTag("Cleanup_Corrupt") then
					v855:Destroy()
				end
			end
		end
		if p853 then
			v856(p853)
		end
		for _, v857 in p852:GetDescendants() do
			if (v857:IsA("BasePart") or v857:IsA("UnionOperation")) and v857:HasTag("CorruptVisual") then
				v857.Color = v_u_13[v857] or v857.Color
				v_u_13[v857] = nil
				v857:RemoveTag("CorruptVisual")
				if v_u_16[v857] then
					v857.Material = v_u_16[v857]
					v_u_16[v857] = nil
				end
			end
		end
	end
}
v_u_551.Toxic = {
	["Id"] = "TX",
	["Name"] = "Toxic",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(85, 255, 0),
	["_AddFX"] = function(p858, p859, p860)
		p858:_RemoveFX(p859, p860)
		if p860 then
			for _, v861 in game.ServerStorage.Mutation_FX.Toxic:GetChildren() do
				local v862 = v861:Clone()
				v862.Parent = p860
				v862.Enabled = true
				v862:AddTag("Cleanup_Toxic")
			end
		end
	end,
	["_RemoveFX"] = function(_, p863, p864)
		local function v867(p865)
			for _, v866 in p865:GetDescendants() do
				if v866:HasTag("Cleanup_Toxic") then
					v866:Destroy()
				end
			end
		end
		if p864 then
			v867(p864)
		end
		if p863 then
			v867(p863)
		end
	end
}
v_u_551.Acidic = {
	["Id"] = "AC",
	["Name"] = "Acidic",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(224, 245, 129),
	["_AddFX"] = function(p868, p869, p870)
		p868:_RemoveFX(p869, p870)
		if p870 then
			for _, v871 in game.ServerStorage.Mutation_FX.Acidic:GetChildren() do
				local v872 = v871:Clone()
				v872.Parent = p870
				v872.Enabled = true
				v872:AddTag("Cleanup_Acidic")
			end
		end
	end,
	["_RemoveFX"] = function(_, p873, p874)
		local function v877(p875)
			for _, v876 in p875:GetDescendants() do
				if v876:HasTag("Cleanup_Acidic") then
					v876:Destroy()
				end
			end
		end
		if p874 then
			v877(p874)
		end
		if p873 then
			v877(p873)
		end
	end
}
v_u_551.Corrosive = {
	["Id"] = "CV",
	["Name"] = "Corrosive",
	["ValueMulti"] = 40,
	["Color"] = Color3.fromRGB(0, 255, 0),
	["_AddFX"] = function(p878, p879, p880)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p878:_RemoveFX(p879, p880)
		local v881 = {}
		for _, v882 in { "Acidic", "Toxic" } do
			for _, v883 in game.ServerStorage.Mutation_FX[v882]:GetChildren() do
				table.insert(v881, v883)
			end
		end
		if p880 then
			for _, v884 in v881 do
				local v885 = v884:Clone()
				v885.Parent = p880
				v885.Enabled = true
				v885:AddTag("Cleanup_Corrosive")
			end
		end
		local v886 = 0
		for _, v887 in p879:GetDescendants() do
			if v887:IsA("BasePart") and v887 ~= p880 then
				v886 = v886 + 1
				if v886 % 2 == 0 and #v881 > 0 then
					local v888 = v881[math.random(1, #v881)]:Clone()
					v888.Parent = v887
					v888.Enabled = true
					v888:AddTag("Cleanup_Corrosive")
				end
				if Random.new():NextNumber() < 0.5 then
					v887:AddTag("CorrosiveVisual")
					v_u_13[v887] = v_u_13[v887] or v887.Color
					v_u_16[v887] = v_u_16[v887] or v887.Material
					v887.Color = Color3.fromRGB(0, 255, 0)
					v887.Material = Enum.Material.Neon
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p889, p890)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v893(p891)
			-- upvalues: (ref) v_u_13, (ref) v_u_16
			for _, v892 in p891:GetDescendants() do
				if v892:HasTag("Cleanup_Corrosive") then
					v892:Destroy()
				elseif v892:HasTag("CorrosiveVisual") then
					v892.Color = v_u_13[v892] or v892.Color
					v892.Material = v_u_16[v892] or v892.Material
					v_u_13[v892] = nil
					v_u_16[v892] = nil
					v892:RemoveTag("CorrosiveVisual")
				end
			end
		end
		if p890 then
			v893(p890)
		end
		if p889 then
			v893(p889)
		end
	end
}
v_u_551.Oil = {
	["Id"] = "OL",
	["Name"] = "Oil",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(52, 52, 77),
	["_AddFX"] = function(p894, p895, p896)
		p894:_RemoveFX(p895, p896)
		if p896 then
			for _, v897 in game.ServerStorage.Mutation_FX.Oil:GetChildren() do
				local v898 = v897:Clone()
				v898.Parent = p896
				v898.Enabled = true
				v898:AddTag("Cleanup_Oil")
				v898:AddTag("Effect")
			end
		end
		for _, v899 in p895:GetDescendants() do
			if (v899:IsA("BasePart") or v899:IsA("UnionOperation")) and not v899:HasTag("Effect") then
				v899:AddTag("OilVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p900, p901)
		-- upvalues: (copy) v_u_16
		if p901 then
			for _, v902 in p901:GetChildren() do
				if v902:HasTag("Cleanup_Oil") then
					v902:Destroy()
				end
			end
		end
		for _, v903 in p900:GetDescendants() do
			if (v903:IsA("BasePart") or v903:IsA("UnionOperation")) and v903:HasTag("OilVisual") then
				v903:RemoveTag("OilVisual")
				local v904 = v_u_16[v903]
				if v904 then
					v903.Material = v904
					v_u_16[v903] = nil
				end
			end
		end
	end
}
v_u_551.Boil = {
	["Id"] = "BOL",
	["Name"] = "Boil",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(150, 178, 225),
	["_AddFX"] = function(p905, p906, p907)
		p905:_RemoveFX(p906, p907)
		if p907 then
			for _, v908 in game.ServerStorage.Mutation_FX.Boil:GetChildren() do
				local v909 = v908:Clone()
				v909.Parent = p907
				v909.Enabled = true
				v909:AddTag("Cleanup_Boil")
				v909:AddTag("Effect")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p910)
		if p910 then
			for _, v911 in p910:GetChildren() do
				if v911:HasTag("Cleanup_Boil") then
					v911:Destroy()
				end
			end
		end
	end
}
v_u_551.Fortune = {
	["Id"] = "FR",
	["Name"] = "Fortune",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(255, 192, 5),
	["_AddFX"] = function(p912, p913, p914)
		p912:_RemoveFX(p913, p914)
		if p914 then
			for _, v915 in game.ServerStorage.Mutation_FX.Fortune:GetChildren() do
				local v916 = v915:Clone()
				v916.Parent = p914
				v916.Enabled = true
				v916:AddTag("Cleanup_Fortune")
				v916:AddTag("Effect")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p917)
		if p917 then
			for _, v918 in p917:GetChildren() do
				if v918:HasTag("Cleanup_Fortune") then
					v918:Destroy()
				end
			end
		end
	end
}
v_u_551.Bloom = {
	["Id"] = "BL",
	["Name"] = "Bloom",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(170, 255, 0),
	["_AddFX"] = function(p919, p920, p921)
		p919:_RemoveFX(p920, p921)
		local v922 = game.ServerStorage.Mutation_FX.Bloom:GetChildren()
		if p921 then
			for _, v923 in v922 do
				if not p921:FindFirstChild(v923.Name) then
					local v924 = v923:Clone()
					v924.Parent = p921
					v924.Enabled = true
					v924:AddTag("Cleanup_Bloom")
					v924:AddTag("Effect")
				end
			end
		end
		local v925 = {}
		for _, v926 in p920:GetDescendants() do
			if v926:IsA("BasePart") and v926 ~= p921 then
				table.insert(v925, v926)
			end
		end
		(function(p927)
			for v928 = #p927, 2, -1 do
				local v929 = math.random(1, v928)
				local v930 = p927[v929]
				local v931 = p927[v928]
				p927[v928] = v930
				p927[v929] = v931
			end
			return p927
		end)(v925)
		local v932 = #v925 * 0.25 + 0.5
		for v933 = 1, math.floor(v932) do
			local v934 = v925[v933]
			local v935 = v922[math.random(1, #v922)]:Clone()
			v935.Parent = v934
			v935.Enabled = true
			v935:AddTag("Cleanup_Bloom")
			v935:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p936, p937)
		local function v940(p938)
			for _, v939 in p938:GetDescendants() do
				if v939:HasTag("Cleanup_Bloom") then
					v939:Destroy()
				end
			end
		end
		if p937 then
			v940(p937)
		end
		if p936 then
			v940(p936)
		end
	end
}
v_u_551.Rot = {
	["Id"] = "RO",
	["Name"] = "Rot",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(85, 0, 127),
	["_AddFX"] = function(p941, p942, p943)
		p941:_RemoveFX(p942, p943)
		local v944 = game.ServerStorage.Mutation_FX.Rot:GetChildren()
		if p943 then
			for _, v945 in v944 do
				if not p943:FindFirstChild(v945.Name) then
					local v946 = v945:Clone()
					v946.Parent = p943
					v946.Enabled = true
					v946:AddTag("Cleanup_Rot")
					v946:AddTag("Effect")
				end
			end
		end
		local v947 = {}
		for _, v948 in p942:GetDescendants() do
			if v948:IsA("BasePart") and v948 ~= p943 then
				table.insert(v947, v948)
			end
		end
		(function(p949)
			for v950 = #p949, 2, -1 do
				local v951 = math.random(1, v950)
				local v952 = p949[v951]
				local v953 = p949[v950]
				p949[v950] = v952
				p949[v951] = v953
			end
			return p949
		end)(v947)
		local v954 = #v947 * 0.25 + 0.5
		for v955 = 1, math.floor(v954) do
			local v956 = v947[v955]
			local v957 = v944[math.random(1, #v944)]:Clone()
			v957.Parent = v956
			v957.Enabled = true
			v957:AddTag("Cleanup_Rot")
			v957:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p958, p959)
		local function v962(p960)
			for _, v961 in p960:GetDescendants() do
				if v961:HasTag("Cleanup_Rot") then
					v961:Destroy()
				end
			end
		end
		if p959 then
			v962(p959)
		end
		if p958 then
			v962(p958)
		end
	end
}
v_u_551.Gloom = {
	["Id"] = "GL",
	["Name"] = "Gloom",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(85, 85, 127),
	["_AddFX"] = function(p963, p964, p965)
		p963:_RemoveFX(p964, p965)
		local v966 = game.ServerStorage.Mutation_FX.Gloom:GetChildren()
		if p965 then
			for _, v967 in v966 do
				if not p965:FindFirstChild(v967.Name) then
					local v968 = v967:Clone()
					v968.Parent = p965
					v968.Enabled = true
					v968:AddTag("Cleanup_Gloom")
					v968:AddTag("Effect")
				end
			end
		end
		local v969 = {}
		for _, v970 in p964:GetDescendants() do
			if v970:IsA("BasePart") and v970 ~= p965 then
				table.insert(v969, v970)
			end
		end
		(function(p971)
			for v972 = #p971, 2, -1 do
				local v973 = math.random(1, v972)
				local v974 = p971[v973]
				local v975 = p971[v972]
				p971[v972] = v974
				p971[v973] = v975
			end
			return p971
		end)(v969)
		local v976 = #v969 * 0.25 + 0.5
		for v977 = 1, math.floor(v976) do
			local v978 = v969[v977]
			local v979 = v966[math.random(1, #v966)]:Clone()
			v979.Parent = v978
			v979.Enabled = true
			v979:AddTag("Cleanup_Gloom")
			v979:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p980, p981)
		local function v984(p982)
			for _, v983 in p982:GetDescendants() do
				if v983:HasTag("Cleanup_Gloom") then
					v983:Destroy()
				end
			end
		end
		if p981 then
			v984(p981)
		end
		if p980 then
			v984(p980)
		end
	end
}
v_u_551.Cyclonic = {
	["Id"] = "CY",
	["Name"] = "Cyclonic",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(130, 230, 255),
	["_AddFX"] = function(p985, p986, p987)
		p985:_RemoveFX(p986, p987)
		local v988 = game.ServerStorage.Mutation_FX.Cyclonic:GetChildren()
		if p987 then
			for _, v989 in v988 do
				if not p987:FindFirstChild(v989.Name) then
					local v990 = v989:Clone()
					v990.Parent = p987
					v990.Enabled = true
					v990:AddTag("Cleanup_Cyclonic")
				end
			end
		end
		local v991 = 0
		for _, v992 in p986:GetDescendants() do
			if v992:IsA("BasePart") and v992 ~= p987 then
				v991 = v991 + 1
				if v991 % 2 == 0 then
					local v993 = v988[math.random(1, #v988)]:Clone()
					v993.Parent = v992
					v993.Enabled = true
					v993:AddTag("Cleanup_Cyclonic")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p994, p995)
		local function v998(p996)
			for _, v997 in p996:GetDescendants() do
				if v997:HasTag("Cleanup_Cyclonic") then
					v997:Destroy()
				end
			end
		end
		if p995 then
			v998(p995)
		end
		if p994 then
			v998(p994)
		end
	end
}
v_u_551.Maelstrom = {
	["Id"] = "MS",
	["Name"] = "Maelstrom",
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(0, 60, 255),
	["_AddFX"] = function(p999, p1000, p1001)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p999:_RemoveFX(p1000, p1001)
		local v1002 = game.ServerStorage.Mutation_FX.Maelstrom:GetChildren()
		local v1003 = {
			["Stars1"] = true
		}
		if p1001 then
			for _, v1004 in v1002 do
				if not p1001:FindFirstChild(v1004.Name) then
					local v1005 = v1004:Clone()
					v1005.Parent = p1001
					v1005.Enabled = true
					v1005:AddTag("Cleanup_Maelstrom")
				end
			end
		end
		local v1006 = {}
		for _, v1007 in p1000:GetDescendants() do
			if v1007:IsA("BasePart") and v1007 ~= p1001 then
				table.insert(v1006, v1007)
				for _, v1008 in v1002 do
					if v1003[v1008.Name] then
						local v1009 = v1008:Clone()
						v1009.Parent = v1007
						v1009.Enabled = true
						v1009:AddTag("Cleanup_Maelstrom")
					end
				end
			end
		end
		for _, v1010 in v1006 do
			if Random.new():NextNumber() < 0.5 then
				v_u_13[v1010] = v_u_13[v1010] or v1010.Color
				v_u_16[v1010] = v_u_16[v1010] or v1010.Material
				v1010.Color = Color3.fromRGB(0, 186, 186)
				v1010.Material = Enum.Material.Neon
				v1010:AddTag("MaelstromVisual")
			end
		end
		local v1011 = {}
		for _, v1012 in v1002 do
			if not v1003[v1012.Name] then
				table.insert(v1011, v1012)
			end
		end
		for v1013, v1014 in v1006 do
			if v1013 % 2 == 0 and #v1011 > 0 then
				local v1015 = v1011[math.random(1, #v1011)]:Clone()
				v1015.Parent = v1014
				v1015.Enabled = true
				v1015:AddTag("Cleanup_Maelstrom")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1016, p1017)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v1020(p1018)
			-- upvalues: (ref) v_u_13, (ref) v_u_16
			for _, v1019 in p1018:GetDescendants() do
				if v1019:HasTag("Cleanup_Maelstrom") then
					v1019:Destroy()
				end
				if v1019:HasTag("MaelstromVisual") then
					v1019.Color = v_u_13[v1019] or v1019.Color
					v_u_13[v1019] = nil
					if v_u_16[v1019] then
						v1019.Material = v_u_16[v1019]
						v_u_16[v1019] = nil
					end
					v1019:RemoveTag("MaelstromVisual")
				end
			end
		end
		if p1017 then
			v1020(p1017)
		end
		if p1016 then
			v1020(p1016)
		end
	end
}
v_u_551.Stormcharged = {
	["Id"] = "SC",
	["Name"] = "Stormcharged",
	["ValueMulti"] = 220,
	["Color"] = Color3.fromRGB(148, 226, 255),
	["_AddFX"] = function(p1021, p1022, p1023)
		p1021:_RemoveFX(p1022, p1023)
		local v1024 = {}
		for _, v1025 in { game.ServerStorage.Mutation_FX.Shocked:GetChildren(), game.ServerStorage.Mutation_FX.Static:GetChildren(), game.ServerStorage.Mutation_FX.Tempestuous:GetChildren() } do
			for _, v1026 in v1025 do
				table.insert(v1024, v1026)
			end
		end
		if p1023 then
			for _, v1027 in v1024 do
				if not p1023:FindFirstChild(v1027.Name) then
					local v1028 = v1027:Clone()
					v1028.Color = ColorSequence.new(Color3.fromRGB(148, 226, 255))
					v1028.Parent = p1023
					v1028.Enabled = true
					v1028:AddTag("Cleanup_Stormcharged")
				end
			end
		end
		local v1029 = {}
		for _, v1030 in p1022:GetDescendants() do
			if v1030:IsA("BasePart") and v1030 ~= p1023 then
				table.insert(v1029, v1030)
			end
		end
		local v1031 = Random.new()
		local v1032 = Color3.fromRGB(255, 255, 100)
		local v1033 = Color3.fromRGB(0, 60, 255)
		for _, v1034 in v1029 do
			if #v1024 > 0 then
				local v1035 = v1024[v1031:NextInteger(1, #v1024)]:Clone()
				v1035.Color = ColorSequence.new(Color3.fromRGB(148, 226, 255))
				v1035.Parent = v1034
				v1035.Enabled = true
				v1035:AddTag("Cleanup_Stormcharged")
			end
			v1034.Color = v1031:NextNumber() < 0.5 and v1032 and v1032 or v1033
			v1034.Material = Enum.Material.Neon
			v1034:AddTag("StormchargedVisual")
		end
	end,
	["_RemoveFX"] = function(_, p1036, p1037)
		local function v1040(p1038)
			for _, v1039 in p1038:GetDescendants() do
				if v1039:HasTag("Cleanup_Stormcharged") then
					v1039:Destroy()
				end
				if v1039:HasTag("StormchargedVisual") then
					v1039:RemoveTag("StormchargedVisual")
					v1039.Material = Enum.Material.Plastic
				end
			end
		end
		if p1037 then
			v1040(p1037)
		end
		if p1036 then
			v1040(p1036)
		end
	end
}
v_u_551.Cosmic = {
	["Id"] = "CS",
	["Name"] = "Cosmic",
	["ValueMulti"] = 210,
	["Color"] = Color3.fromRGB(171, 171, 255),
	["_AddFX"] = function(p1041, p1042, p1043)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p1041:_RemoveFX(p1042, p1043)
		local v1044 = game.ServerStorage.Mutation_FX.Cosmic:GetChildren()
		local v1045 = #v1044
		if p1043 then
			for _, v1046 in v1044 do
				if not p1043:FindFirstChild(v1046.Name) then
					local v1047 = v1046:Clone()
					v1047.Parent = p1043
					v1047.Enabled = true
					v1047:AddTag("Cleanup_Cosmic")
				end
			end
		end
		local v1048 = 0
		for _, v1049 in p1042:GetDescendants() do
			if v1049:IsA("BasePart") and v1049 ~= p1043 then
				v1048 = v1048 + 1
				if v1045 > 0 then
					local v1050 = v1044[math.random(1, v1045)]:Clone()
					v1050.Parent = v1049
					v1050.Enabled = true
					v1050:AddTag("Cleanup_Cosmic")
				end
				if not v1049:HasTag("Effect") then
					v_u_13[v1049] = v_u_13[v1049] or v1049.Color
					v_u_16[v1049] = v_u_16[v1049] or v1049.Material
					if math.random() < 0.5 then
						v1049.Color = Color3.fromRGB(255, 255, 100)
					else
						v1049.Color = Color3.fromRGB(171, 171, 255)
					end
					v1049.Material = Enum.Material.Neon
					v1049:AddTag("CosmicVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1051, p1052)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v1055(p1053)
			for _, v1054 in p1053:GetDescendants() do
				if v1054:HasTag("Cleanup_Cosmic") then
					v1054:Destroy()
				end
			end
		end
		if p1052 then
			v1055(p1052)
		end
		if p1051 then
			v1055(p1051)
		end
		for _, v1056 in p1051:GetDescendants() do
			if (v1056:IsA("BasePart") or v1056:IsA("UnionOperation")) and v1056:HasTag("CosmicVisual") then
				v1056.Color = v_u_13[v1056] or v1056.Color
				v_u_13[v1056] = nil
				v1056.Material = v_u_16[v1056] or v1056.Material
				v_u_16[v1056] = nil
				v1056:RemoveTag("CosmicVisual")
			end
		end
	end
}
v_u_551.Jackpot = {
	["Id"] = "JA",
	["Name"] = "Jackpot",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(132, 245, 112),
	["_AddFX"] = function(p1057, p1058, p1059)
		p1057:_RemoveFX(p1058, p1059)
		if p1059 then
			for _, v1060 in game.ServerStorage.Mutation_FX.Jackpot:GetChildren() do
				local v1061 = v1060:Clone()
				v1061.Parent = p1059
				v1061:AddTag("Cleanup_Jackpot")
				if v1061:IsA("ParticleEmitter") then
					v1061.Enabled = true
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p1062)
		local function v1065(p1063)
			for _, v1064 in p1063:GetDescendants() do
				if v1064:HasTag("Cleanup_Jackpot") then
					v1064:Destroy()
				end
			end
		end
		if p1062 then
			v1065(p1062)
		end
	end
}
v_u_551.Blitzshock = {
	["Id"] = "BS",
	["Name"] = "Blitzshock",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(0, 192, 245),
	["_AddFX"] = function(p1066, p1067, p1068)
		-- upvalues: (copy) v_u_16, (copy) v_u_13
		p1066:_RemoveFX(p1067, p1068)
		if p1068 then
			for _, v1069 in game.ServerStorage.Mutation_FX.Blitzshock:GetChildren() do
				local v1070 = v1069:Clone()
				v1070.Parent = p1068
				v1070:AddTag("Cleanup_Blitzshock")
				if v1070:IsA("ParticleEmitter") then
					v1070.Enabled = true
				end
			end
		end
		for _, v1071 in p1067:GetDescendants() do
			if (v1071:IsA("BasePart") or v1071:IsA("UnionOperation")) and (not v1071:HasTag("Effect") and (not v1071.Transparency or v1071.Transparency ~= 1)) then
				v_u_16[v1071] = v_u_16[v1071] or v1071.Material
				v1071.Material = Enum.Material.Neon
				v_u_13[v1071] = v_u_13[v1071] or v1071.Color
				v1071.Color = v1071.Color:Lerp(Color3.fromRGB(0, 170, 255), 0.5)
				v1071:AddTag("BlitzshockVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1072, p1073)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v1076(p1074)
			for _, v1075 in p1074:GetDescendants() do
				if v1075:HasTag("Cleanup_Blitzshock") then
					v1075:Destroy()
				end
			end
		end
		if p1073 then
			v1076(p1073)
		end
		if p1072 then
			v1076(p1072)
		end
		for _, v1077 in p1072:GetDescendants() do
			if (v1077:IsA("BasePart") or v1077:IsA("UnionOperation")) and v1077:HasTag("BlitzshockVisual") then
				v1077.Color = v_u_13[v1077] or v1077.Color
				v_u_13[v1077] = nil
				v1077:RemoveTag("BlitzshockVisual")
				if v_u_16[v1077] then
					v1077.Material = v_u_16[v1077]
					v_u_16[v1077] = nil
				end
			end
		end
	end
}
v_u_551.Junkshock = {
	["Id"] = "JS",
	["Name"] = "Junkshock",
	["ValueMulti"] = 45,
	["Color"] = Color3.fromRGB(147, 247, 0),
	["_AddFX"] = function(p1078, p1079, p1080)
		-- upvalues: (copy) v_u_16, (copy) v_u_13
		p1078:_RemoveFX(p1079, p1080)
		if p1080 then
			for _, v1081 in game.ServerStorage.Mutation_FX.Junkshock:GetChildren() do
				local v1082 = v1081:Clone()
				v1082.Parent = p1080
				v1082:AddTag("Cleanup_Junkshock")
				if v1082:IsA("ParticleEmitter") then
					v1082.Enabled = true
				end
			end
		end
		for _, v1083 in p1079:GetDescendants() do
			if (v1083:IsA("BasePart") or v1083:IsA("UnionOperation")) and (not v1083:HasTag("Effect") and (not v1083.Transparency or v1083.Transparency ~= 1)) then
				v_u_16[v1083] = v_u_16[v1083] or v1083.Material
				v1083.Material = Enum.Material.Neon
				v_u_13[v1083] = v_u_13[v1083] or v1083.Color
				v1083.Color = v1083.Color:Lerp(Color3.fromRGB(0, 255, 36), 0.5)
				v1083:AddTag("JunkshockVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1084, p1085)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v1088(p1086)
			for _, v1087 in p1086:GetDescendants() do
				if v1087:HasTag("Cleanup_Junkshock") then
					v1087:Destroy()
				end
			end
		end
		if p1085 then
			v1088(p1085)
		end
		if p1084 then
			v1088(p1084)
		end
		for _, v1089 in p1084:GetDescendants() do
			if (v1089:IsA("BasePart") or v1089:IsA("UnionOperation")) and v1089:HasTag("JunkshockVisual") then
				v1089.Color = v_u_13[v1089] or v1089.Color
				v_u_13[v1089] = nil
				v1089:RemoveTag("JunkshockVisual")
				if v_u_16[v1089] then
					v1089.Material = v_u_16[v1089]
					v_u_16[v1089] = nil
				end
			end
		end
	end
}
v_u_551.Touchdown = {
	["Id"] = "TD",
	["Name"] = "Touchdown",
	["ValueMulti"] = 105,
	["Color"] = Color3.fromRGB(203, 95, 0),
	["_AddFX"] = function(p1090, p1091, p1092)
		p1090:_RemoveFX(p1091, p1092)
		if p1092 then
			for _, v1093 in game.ServerStorage.Mutation_FX.Touchdown:GetChildren() do
				local v1094 = v1093:Clone()
				v1094.Parent = p1092
				v1094.Enabled = true
				v1094:AddTag("Cleanup_Touchdown")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1095, p1096)
		local function v1099(p1097)
			for _, v1098 in p1097:GetDescendants() do
				if v1098:HasTag("Cleanup_Touchdown") then
					v1098:Destroy()
				end
			end
		end
		if p1096 then
			v1099(p1096)
		end
		if p1095 then
			v1099(p1095)
		end
	end
}
v_u_551.Subzero = {
	["Id"] = "SZ",
	["Name"] = "Subzero",
	["ValueMulti"] = 40,
	["Color"] = Color3.fromRGB(0, 255, 255),
	["_AddFX"] = function(p1100, p1101, p1102)
		-- upvalues: (copy) v_u_96, (copy) v_u_16, (copy) v_u_17, (copy) v_u_13
		p1100:_RemoveFX(p1101, p1102)
		v_u_96(p1100, p1101, p1102, 0.4)
		if p1102 then
			for _, v1103 in game.ServerStorage.Mutation_FX.Subzero:GetChildren() do
				local v1104 = v1103:Clone()
				v1104.Parent = p1102
				v1104:AddTag("Cleanup_Subzero")
				if v1104:IsA("ParticleEmitter") then
					v1104.Enabled = true
				end
			end
		end
		for _, v1105 in p1101:GetChildren() do
			if v1105:IsA("BasePart") or v1105:IsA("UnionOperation") then
				v1105.Reflectance = 0.35
			end
		end
		for _, v1106 in p1101:GetDescendants() do
			if (v1106:IsA("BasePart") or v1106:IsA("UnionOperation")) and (not v1106:HasTag("Effect") and (not v1106.Transparency or v1106.Transparency ~= 1)) then
				v_u_16[v1106] = v_u_16[v1106] or v1106.Material
				v1106.Material = Enum.Material.Plastic
				v_u_17[v1106] = v_u_17[v1106] or v1106.MaterialVariant
				v1106.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_13[v1106] = v_u_13[v1106] or v1106.Color
				v1106.Color = v1106.Color:Lerp(Color3.fromRGB(0, 255, 255), 0.5)
				v1106:AddTag("SubzeroVisual")
			end
		end
	end,
	["_RemoveFX"] = function(p1107, p1108, p1109)
		-- upvalues: (copy) v_u_105, (copy) v_u_13, (copy) v_u_17, (copy) v_u_16
		v_u_105(p1107, p1108, p1109)
		local function v1112(p1110)
			for _, v1111 in p1110:GetDescendants() do
				if v1111:HasTag("Cleanup_Subzero") then
					v1111:Destroy()
				end
			end
		end
		if p1109 then
			v1112(p1109)
		end
		if p1108 then
			v1112(p1108)
		end
		for _, v1113 in p1108:GetDescendants() do
			if v1113:IsA("BasePart") or v1113:IsA("UnionOperation") then
				v1113.Reflectance = 0
				if v1113:HasTag("SubzeroVisual") then
					v1113.Color = v_u_13[v1113] or v1113.Color
					v_u_13[v1113] = nil
					v1113:RemoveTag("SubzeroVisual")
					v1113.MaterialVariant = v_u_17[v1113] or v1113.MaterialVariant
					v_u_17[v1113] = nil
					if v_u_16[v1113] then
						v1113.Material = v_u_16[v1113]
						v_u_16[v1113] = nil
					end
				end
			end
		end
	end
}
v_u_551.Lightcycle = {
	["Id"] = "lc",
	["Name"] = "Lightcycle",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p1114, p1115, p1116)
		-- upvalues: (copy) v_u_13
		p1114:_RemoveFX(p1115, p1116)
		p1115:AddTag("Lightcycle_Mutation")
		for _, v1117 in p1115:GetDescendants() do
			if (v1117:IsA("BasePart") or v1117:IsA("UnionOperation")) and not v1117:HasTag("Effect") then
				local _ = v1117.Color
				v_u_13[v1117] = v_u_13[v1117] or v1117.Color
				v1117:AddTag("StoplightVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1118, _)
		-- upvalues: (copy) v_u_13
		p1118:RemoveTag("Lightcycle_Mutation")
		for _, v1119 in p1118:GetDescendants() do
			if (v1119:IsA("BasePart") or v1119:IsA("UnionOperation")) and v1119:HasTag("StoplightVisual") then
				local v1120 = v_u_13[v1119]
				if v1120 then
					v1119.Color = v1120
				end
				v1119:RemoveTag("StoplightVisual")
			end
		end
	end
}
v_u_551.Brainrot = {
	["Id"] = "lca",
	["Name"] = "Brainrot",
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(255, 108, 110),
	["_AddFX"] = function(p1121, p1122, p1123)
		p1121:_RemoveFX(p1122, p1123)
		if p1123 then
			for _, v1124 in game.ServerStorage.Mutation_FX.Brainrot:GetChildren() do
				local v1125 = v1124:Clone()
				v1125.Parent = p1123
				v1125.Enabled = true
				v1125:AddTag("Cleanup_Brainrot")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1126, p1127)
		local function v1130(p1128)
			for _, v1129 in p1128:GetDescendants() do
				if v1129:HasTag("Cleanup_Brainrot") then
					v1129:Destroy()
				end
			end
		end
		if p1127 then
			v1130(p1127)
		end
		if p1126 then
			v1130(p1126)
		end
	end
}
v_u_551.Warped = {
	["Id"] = "wpa",
	["Name"] = "Warped",
	["ValueMulti"] = 75,
	["Color"] = Color3.fromRGB(192, 52, 255),
	["_AddFX"] = function(p1131, p1132, p1133)
		p1131:_RemoveFX(p1132, p1133)
		if p1133 then
			for _, v1134 in game.ServerStorage.Mutation_FX.Warped:GetChildren() do
				local v1135 = v1134:Clone()
				v1135.Parent = p1133
				v1135.Enabled = true
				v1135:AddTag("Cleanup_Warped")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1136, p1137)
		local function v1140(p1138)
			for _, v1139 in p1138:GetDescendants() do
				if v1139:HasTag("Cleanup_Warped") then
					v1139:Destroy()
				end
			end
		end
		if p1137 then
			v1140(p1137)
		end
		if p1136 then
			v1140(p1136)
		end
	end
}
v_u_551.Aromatic = {
	["Id"] = "ar",
	["Name"] = "Aromatic",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(162, 145, 57),
	["_AddFX"] = function(p1141, p1142, p1143)
		-- upvalues: (copy) v_u_13
		p1141:_RemoveFX(p1142, p1143)
		if p1143 then
			for _, v1144 in game.ServerStorage.Mutation_FX.Aromatic:GetChildren() do
				local v1145 = v1144:Clone()
				v1145.Parent = p1143
				v1145:AddTag("Cleanup_Aromatic")
				if v1145:IsA("ParticleEmitter") then
					v1145.Enabled = true
				end
			end
		end
		for _, v1146 in p1142:GetDescendants() do
			if (v1146:IsA("BasePart") or v1146:IsA("UnionOperation")) and (not v1146:HasTag("Effect") and (not v1146.Transparency or v1146.Transparency ~= 1)) then
				v_u_13[v1146] = v_u_13[v1146] or v1146.Color
				v1146.Color = v1146.Color:Lerp(Color3.fromRGB(162, 145, 57), 0.3)
				v1146:AddTag("AromaticVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1147, p1148)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v1151(p1149)
			for _, v1150 in p1149:GetDescendants() do
				if v1150:HasTag("Cleanup_Aromatic") then
					v1150:Destroy()
				end
			end
		end
		if p1148 then
			v1151(p1148)
		end
		if p1147 then
			v1151(p1147)
		end
		for _, v1152 in p1147:GetDescendants() do
			if (v1152:IsA("BasePart") or v1152:IsA("UnionOperation")) and v1152:HasTag("AromaticVisual") then
				v1152.Color = v_u_13[v1152] or v1152.Color
				v_u_13[v1152] = nil
				v1152:RemoveTag("AromaticVisual")
				if v_u_16[v1152] then
					v1152.Material = v_u_16[v1152]
					v_u_16[v1152] = nil
				end
			end
		end
	end
}
v_u_551.Gnomed = {
	["Id"] = "gn",
	["Name"] = "Gnomed",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(0, 173, 239),
	["_AddFX"] = function(p1153, p1154, p1155)
		p1153:_RemoveFX(p1154, p1155)
		if p1155 then
			for _, v1156 in game.ServerStorage.Mutation_FX.Gnomed:GetChildren() do
				local v1157 = v1156:Clone()
				v1157.Parent = p1155
				v1157.Enabled = true
				v1157:AddTag("Cleanup_Gnomed")
			end
		end
		for _, v1158 in p1154:GetChildren() do
			if v1158:IsA("BasePart") or v1158:IsA("UnionOperation") then
				v1158.Reflectance = 0.1
			end
		end
	end,
	["_RemoveFX"] = function(_, p1159, p1160)
		if p1160 then
			for _, v1161 in p1160:GetChildren() do
				if v1161:HasTag("Cleanup_Gnomed") then
					v1161:Destroy()
				end
			end
		end
		for _, v1162 in p1159:GetChildren() do
			if v1162:IsA("BasePart") or v1162:IsA("UnionOperation") then
				v1162.Reflectance = 0
			end
		end
	end
}
local v_u_1163 = {}
local v_u_1164 = {}
for v1165, v1166 in v_u_551 do
	v_u_1163[v1165] = v1166.Id
end
for v1167, v1168 in v_u_551 do
	if v_u_1164[v1168.Id] then
		error((("MutationHandler | Duplicate Enum for %* and %*"):format(v1167, v_u_1164[v1168.Id])))
	end
	v_u_1164[v1168.Id] = v1167
end
table.freeze(v_u_1163)
table.freeze(v_u_1164)
function v_u_11.GetMutationsToEnums(_)
	-- upvalues: (copy) v_u_1163
	return v_u_1163
end
function v_u_11.GetEnumsToMutations(_)
	-- upvalues: (copy) v_u_1164
	return v_u_1164
end
function v_u_11.GetMutations(_)
	-- upvalues: (copy) v_u_6, (copy) v_u_551
	return v_u_6:DeepCopy(v_u_551)
end
function v_u_11.AddMutation(_, p1169, p1170)
	if p1169 then
		p1169:SetAttribute(p1170.Name, true)
	else
		warn("MutationHandler:AddMutation | No plant")
	end
end
function v_u_11.RemoveMutation(_, p1171, p1172)
	if p1171 then
		p1171:SetAttribute(p1172.Name, nil)
	else
		warn("MutationHandler:RemoveMutation | No plant")
	end
end
function v_u_11.GetPlantMutations(_, p1173)
	-- upvalues: (copy) v_u_551
	local v1174 = {}
	for _, v1175 in v_u_551 do
		if p1173:GetAttribute(v1175.Name) then
			table.insert(v1174, v1175)
		end
	end
	return v1174
end
function v_u_11.GetPlantMutationsAsEnums(_, p1176)
	-- upvalues: (copy) v_u_11
	local v1177 = {}
	for _, v1178 in v_u_11:GetPlantMutations(p1176) do
		local v1179 = v1178.Id
		table.insert(v1177, v1179)
	end
	return v1177
end
function v_u_11.GetMutationsAsString(_, p1180, p1181)
	-- upvalues: (copy) v_u_551
	local v1182 = ""
	for _, v1183 in v_u_551 do
		local v1184 = v1183.Name
		if p1180:GetAttribute(v1184) then
			if v1182 ~= "" then
				v1182 = v1182 .. ", "
			end
			v1182 = v1182 .. v1184
		end
	end
	if v1182 ~= "" and p1181 then
		v1182 = "[" .. v1182 .. "]"
	end
	return v1182
end
function v_u_11.ExtractMutationsFromEnumArray(_, p1185)
	-- upvalues: (copy) v_u_1164, (copy) v_u_551
	local v1186 = {}
	for _, v1187 in p1185 do
		local v1188 = v_u_1164[v1187]
		if v1188 then
			local v1189 = v_u_551[v1188]
			table.insert(v1186, v1189)
		else
			warn((("MutationHandler:ExtractMutationsFromEnumArray | Mutation does not exist for %*"):format(v1187)))
		end
	end
	return v1186
end
function v_u_11.ExtractMutationsFromString(_, p1190)
	-- upvalues: (copy) v_u_11
	local v1191 = {}
	if not p1190 or p1190 == "" then
		return v1191
	end
	local v1192 = p1190:gsub("%[", ""):gsub("%]", ""):gsub("%s+", "")
	for v1193 in string.gmatch(v1192, "([^,]+)") do
		local v1194 = false
		for _, v1195 in v_u_11:GetMutations() do
			if v1195.Name == v1193 then
				table.insert(v1191, v1195)
				v1194 = true
			end
		end
		if not v1194 then
			warn((("MutationHandler:ExtractMutationsFromString | Mutation name: %* does not exist"):format(v1193)))
		end
	end
	return v1191
end
function v_u_11.TransferMutations(_, p1196, p1197)
	-- upvalues: (copy) v_u_11
	for _, v1198 in v_u_11:GetMutations() do
		if p1196:GetAttribute(v1198.Name) then
			v_u_11:AddMutation(p1197, v1198)
			v_u_11:RemoveMutation(p1196, v1198)
		end
	end
	p1197:SetAttribute("WeightMulti", p1196:GetAttribute("WeightMulti") or 1)
end
function v_u_11.CalcValueMultiFromMuts(_, p1199)
	local v1200 = 1
	for _, v1201 in p1199 do
		v1200 = v1200 + (v1201.ValueMulti - 1)
	end
	return math.max(1, v1200)
end
function v_u_11.CalcValueMulti(_, p1202)
	-- upvalues: (copy) v_u_11
	return v_u_11:CalcValueMultiFromMuts((v_u_11:GetPlantMutations(p1202)))
end
function v_u_11.SetToolName(_, p_u_1203)
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_11
	if p_u_1203:IsA("Tool") then
		task.spawn(function()
			-- upvalues: (ref) v_u_2, (copy) p_u_1203, (ref) v_u_7, (ref) v_u_11
			local v1204 = game:GetService("ServerScriptService")
			local v1205 = require(v1204.Modules.InventoryService)
			local v1206 = require(v_u_2.Data.EnumRegistry.InventoryServiceEnums)
			local v1207
			if p_u_1203:FindFirstChild("Item_String") then
				v1207 = p_u_1203.Item_String.Value
			else
				v1207 = nil
			end
			local v1208, v1209
			if p_u_1203:GetAttribute(v1206.OWNER) then
				local v1210 = v1205:GetToolData(p_u_1203)
				v1207 = v1207 or v1210.ItemName
				v1208 = v1210.Variant or "Normal"
				v1209 = v1210.Seed
			else
				local v1211 = p_u_1203:WaitForChild("Variant", 0.3)
				if not v1211 then
					return
				end
				local v1212 = p_u_1203:WaitForChild("Item_Seed", 0.3)
				if not v1212 then
					return
				end
				v1208 = v1211.Value
				v1209 = v1212.Value
			end
			if v1208 and (v1209 and v1207) then
				local v1213 = v_u_7.Calculate_Weight(v1209, v1207) * (p_u_1203:GetAttribute("WeightMulti") or 1)
				local v1214 = v_u_11:GetMutationsAsString(p_u_1203)
				if v1208 and (v1208 ~= "" and v1208 ~= "Normal") then
					v1214 = v1214 .. (#v1214 > 0 and ", " or "") .. v1208
				end
				p_u_1203.Name = (v1214 == "" and "" or (("[%*] "):format(v1214) or "")) .. v1207 .. " [" .. string.format("%.2f", v1213) .. "kg]"
			end
		end)
	end
end
local v_u_1215 = {}
for _, v1216 in v_u_551 do
	v_u_1215[v1216.Name] = v1216.Name
end
v_u_11.MutationNames = v_u_1215
local v_u_1217 = {}
function v_u_11.CheckTimedPlants(_)
	-- upvalues: (copy) v_u_1217, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_551
	local v1218 = require(game.ServerStorage.Data_Module)
	local v1219 = workspace:GetServerTimeNow()
	for v1220, _ in v_u_1217 do
		local v1221 = v_u_8(v1220)
		if v1221 then
			local v1222 = v1218.GetFruitData(v1221, v1220)
			local v1223 = v_u_9.MutationTimes
			if not v1222 then
				v1222 = v1218.GetPlantData(v1221, v1220)
				v1223 = v_u_10.MutationTimes
			end
			if v1222 then
				if v1222[v1223] then
					local v1224 = 0
					for v1225, v1226 in v1222[v1223] do
						local v1227 = v_u_11:GetEnumsToMutations()[v1225]
						local v1228 = v_u_551[v1227]
						if v1228 then
							local v1229 = v1228.TimeData
							if v1229 and (v1229.TimeToChange and v1229.AddMutationName) then
								v1224 = v1224 + 1
								if v1219 - v1226 >= v1229.TimeToChange then
									v1220:SetAttribute(v1229.AddMutationName, true)
								end
							else
								warn((("Invalid or nil TimeData for %*, despite being in mutaionTimes"):format(v1227)))
							end
						else
							warn((("No mutation for %*:%*"):format(v1225, v1227)))
						end
					end
					if v1224 <= 0 then
						warn((("%* in timedPlants, but no valid muts!"):format(v1220.Name)))
					end
				else
					warn(("No Mutation Times for %* >"):format(v1220.Name), v1220)
				end
			else
				warn(("No Plant Data for %* >"):format((v1220:GetFullName())), v1220)
			end
		end
	end
end
local function v_u_1243(p1230)
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_551, (copy) v_u_1217
	if p1230:IsA("Tool") then
		return
	elseif p1230:HasTag("FoodModel") then
		return
	elseif p1230:HasTag("TESTING") then
		return
	else
		local v1231 = require(game.ServerStorage.Data_Module)
		local v1232 = v_u_8(p1230)
		if v1232 then
			local v1233 = v1231.GetFruitData(v1232, p1230)
			local v1234 = v_u_9.MutationTimes
			if not v1233 then
				v1233 = v1231.GetPlantData(v1232, p1230)
				v1234 = v_u_10.MutationTimes
			end
			if v1233 then
				local v1235 = workspace:GetServerTimeNow()
				local v1236 = math.floor(v1235)
				v1233[v1234] = v1233[v1234] or {}
				for v1237, _ in v1233[v1234] do
					local v1238 = v_u_11:GetEnumsToMutations()[v1237]
					local v1239 = v_u_551[v1238]
					if not (p1230:GetAttribute(v1238) and v1239.TimeData) then
						v1233[v1234][v1237] = nil
					end
				end
				for v1240, _ in p1230:GetAttributes() do
					local v1241 = v_u_551[v1240]
					if v1241 and v1241.TimeData then
						local v1242 = v_u_11:GetMutationsToEnums()[v1240]
						if not v1233[v1234][v1242] then
							v1233[v1234][v1242] = v1236
						end
					end
				end
				if next(v1233[v1234]) == nil then
					v1233[v1234] = nil
					if v_u_1217[p1230] then
						v_u_1217[p1230] = nil
						return
					end
				elseif not v_u_1217[p1230] then
					v_u_1217[p1230] = true
				end
			else
				warn(("No Plant Data for %* >"):format((p1230:GetFullName())), p1230)
			end
		else
			warn("No player for plant >", p1230)
			return
		end
	end
end
local v_u_1244 = {}
local function v1250(p_u_1245)
	-- upvalues: (copy) v_u_1215, (copy) v_u_1244, (copy) v_u_1243, (copy) v_u_129, (copy) v_u_11, (copy) v_u_1217, (copy) v_u_13, (copy) v_u_16
	local v_u_1246 = require(script.MutationCombos)
	if p_u_1245 then
		p_u_1245.AttributeChanged:Connect(function(p1247)
			-- upvalues: (ref) v_u_1215, (ref) v_u_1244, (copy) p_u_1245, (ref) v_u_1243, (copy) v_u_1246, (ref) v_u_129, (ref) v_u_11
			if v_u_1215[p1247] then
				if not v_u_1244[p_u_1245] then
					v_u_1244[p_u_1245] = true
					v_u_1243(p_u_1245)
					task.defer(function()
						-- upvalues: (ref) v_u_1246, (ref) p_u_1245, (ref) v_u_129, (ref) v_u_11, (ref) v_u_1244
						v_u_1246:HandleCombos(p_u_1245)
						v_u_129(p_u_1245)
						if p_u_1245:HasTag("PlantGenerated") then
							v_u_11:SetToolName(p_u_1245)
						end
						v_u_1244[p_u_1245] = nil
					end)
				end
			else
				return
			end
		end)
		v_u_1243(p_u_1245)
		v_u_1246:HandleCombos(p_u_1245)
		v_u_129(p_u_1245)
		if p_u_1245:HasTag("PlantGenerated") then
			v_u_11:SetToolName(p_u_1245)
		end
		p_u_1245.Destroying:Once(function()
			-- upvalues: (ref) v_u_1244, (copy) p_u_1245, (ref) v_u_1217, (ref) v_u_13, (ref) v_u_16
			v_u_1244[p_u_1245] = nil
			v_u_1217[p_u_1245] = nil
			for _, v1248 in p_u_1245:GetDescendants() do
				if v1248:IsA("BasePart") then
					v_u_13[v1248] = nil
					v_u_16[v1248] = nil
				end
			end
		end)
		p_u_1245.DescendantRemoving:Connect(function(p1249)
			-- upvalues: (ref) v_u_13, (ref) v_u_16
			v_u_13[p1249] = nil
			v_u_16[p1249] = nil
		end)
	else
		warn("MutationHandler.MutatableAdded | No plant")
	end
end
if v_u_3:IsServer() then
	v1:GetInstanceAddedSignal("Harvestable"):Connect(v1250)
	v1:GetInstanceAddedSignal("FruitTool"):Connect(v1250)
	v1:GetInstanceAddedSignal("FoodGenerated"):Connect(v1250)
	v1:GetInstanceAddedSignal("PlantScaled"):Connect(function(p1251)
		-- upvalues: (copy) v_u_11, (copy) v_u_129
		if v_u_11:CanBeMutated(p1251) then
			if p1251:IsA("Model") or p1251:IsA("Tool") then
				v_u_129(p1251)
				v_u_11:SetToolName(p1251)
			end
		else
			return
		end
	end)
	task.spawn(function()
		-- upvalues: (copy) v_u_11
		while true do
			task.wait(60)
			xpcall(function()
				-- upvalues: (ref) v_u_11
				v_u_11:CheckTimedPlants()
			end, warn)
		end
	end)
end
return v_u_11
