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
local v_u_518 = {
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
	["Aurora"] = {
		["Id"] = "l",
		["Name"] = "Aurora",
		["ValueMulti"] = 90,
		["Color"] = Color3.fromRGB(99, 89, 175),
		["_AddFX"] = function(p250, p251, p252)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p250:_RemoveFX(p251, p252)
			for v253, v254 in p251:GetDescendants() do
				if v254:IsA("BasePart") or v254:IsA("UnionOperation") then
					if v253 % 5 == 0 then
						local v255 = game.ServerStorage.Mutation_FX.Aurora.Light:Clone()
						v255.Parent = v254
						v255.Enabled = true
						v255:AddTag("Cleanup_Aurora")
					end
					if not v254:HasTag("Effect") then
						local v256 = Random.new():NextInteger(1, 3)
						v_u_13[v254] = v_u_13[v254] or v254.Color
						if v256 == 1 then
							v254.Color = Color3.fromRGB(150, 92, 186)
						elseif v256 == 2 then
							v254.Color = Color3.fromRGB(87, 91, 171)
						elseif v256 == 3 then
							v254.Color = Color3.fromRGB(76, 156, 165)
						end
						v_u_16[v254] = v_u_16[v254] or v254.Material
						v254.Material = Enum.Material.Neon
						v254:AddTag("AuroraVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p257, p258)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p258 then
				for _, v259 in p258:GetChildren() do
					if v259:HasTag("Cleanup_Aurora") then
						v259:Destroy()
					end
				end
			end
			for _, v260 in p257:GetDescendants() do
				if (v260:IsA("BasePart") or v260:IsA("UnionOperation")) and v260:HasTag("GalacticVisual") then
					v260.Reflectance = 0
					v260.Color = v_u_13[v260] or v260.Color
					v_u_13[v260] = nil
					v260:RemoveTag("AuroraVisual")
					if v_u_16[v260] then
						v260.Material = v_u_16[v260]
						v_u_16[v260] = nil
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
		["_AddFX"] = function(p261, p262, p263)
			p261:_RemoveFX(p262, p263)
			if p263 then
				for _, v264 in game.ServerStorage.Mutation_FX.Chilled:GetChildren() do
					local v265 = v264:Clone()
					v265.Parent = p263
					v265.Enabled = true
					v265:AddTag("Cleanup_Chilled")
				end
			end
			for _, v266 in p262:GetChildren() do
				if v266:IsA("BasePart") or v266:IsA("UnionOperation") then
					v266.Reflectance = 0.1
				end
			end
		end,
		["_RemoveFX"] = function(_, p267, p268)
			if p268 then
				for _, v269 in p268:GetChildren() do
					if v269:HasTag("Cleanup_Chilled") then
						v269:Destroy()
					end
				end
			end
			for _, v270 in p267:GetChildren() do
				if v270:IsA("BasePart") or v270:IsA("UnionOperation") then
					v270.Reflectance = 0
				end
			end
		end
	},
	["Sundried"] = {
		["Id"] = "n",
		["Name"] = "Sundried",
		["ValueMulti"] = 85,
		["Color"] = Color3.fromRGB(207, 93, 0),
		["_AddFX"] = function(p271, p272, p273)
			-- upvalues: (copy) v_u_13
			p271:_RemoveFX(p272, p273)
			for _, v274 in p272:GetChildren() do
				if v274:IsA("BasePart") or v274:IsA("UnionOperation") then
					v_u_13[v274] = v_u_13[v274] or v274.Color
					v274.Color = Color3.fromRGB(v274.Color.R * 178.5, v274.Color.G * 127.5, v274.Color.B * 127.5)
				end
			end
		end,
		["_RemoveFX"] = function(_, p275, _)
			-- upvalues: (copy) v_u_13
			for _, v276 in p275:GetChildren() do
				if v276:IsA("BasePart") or v276:IsA("UnionOperation") then
					v276.Color = v_u_13[v276] or v276.Color
					v_u_13[v276] = nil
				end
			end
		end
	},
	["Wiltproof"] = {
		["Id"] = "o",
		["Name"] = "Wiltproof",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(0, 222, 155),
		["_AddFX"] = function(p277, p278, p279)
			-- upvalues: (copy) v_u_13
			p277:_RemoveFX(p278, p279)
			for _, v280 in p278:GetChildren() do
				if v280:IsA("BasePart") or v280:IsA("UnionOperation") then
					v_u_13[v280] = v_u_13[v280] or v280.Color
					local v281 = v280.Color
					local v282 = v281.R * 0.3 + v281.G * 0.59 + v281.B * 0.11
					local v283 = Color3.new
					local v284 = v282 + (v281.R - v282) * 3
					local v285 = math.clamp(v284, 0, 1)
					local v286 = v282 + (v281.G - v282) * 4
					local v287 = math.clamp(v286, 0, 1)
					local v288 = v282 + (v281.B - v282) * 3
					v280.Color = v283(v285, v287, (math.clamp(v288, 0, 1)))
				end
			end
		end,
		["_RemoveFX"] = function(_, p289, _)
			-- upvalues: (copy) v_u_13, (copy) v_u_16, (copy) v_u_17
			for _, v290 in p289:GetChildren() do
				if v290:IsA("BasePart") or v290:IsA("UnionOperation") then
					v290.Color = v_u_13[v290] or v290.Color
					v_u_13[v290] = nil
					if v_u_16[v290] then
						v290.Material = v_u_16[v290]
						v_u_16[v290] = nil
					end
					if v_u_17[v290] then
						v290.MaterialVariant = v_u_17[v290]
						v_u_17[v290] = nil
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
		["_AddFX"] = function(p291, p292, p293)
			-- upvalues: (copy) v_u_13
			p291:_RemoveFX(p292, p293)
			if p293 then
				for _, v294 in game.ServerStorage.Mutation_FX.Drenched:GetChildren() do
					local v295 = v294:Clone()
					v295.Parent = p293
					v295.Enabled = true
					v295:AddTag("Cleanup_Drenched")
				end
			end
			for _, v296 in p292:GetChildren() do
				if v296:IsA("BasePart") or v296:IsA("UnionOperation") then
					v_u_13[v296] = v_u_13[v296] or v296.Color
					local v297, v298, v299 = v296.Color:ToHSV()
					local v300 = v298 + 0.1
					local v301 = math.clamp(v300, v298, 1)
					local v302 = v299 + 0.05
					local v303 = math.clamp(v302, v299, 1)
					v296.Color = Color3.fromHSV(v297, v301, v303)
				end
			end
		end,
		["_RemoveFX"] = function(_, p304, p305)
			-- upvalues: (copy) v_u_13, (copy) v_u_16, (copy) v_u_17
			if p305 then
				for _, v306 in p305:GetChildren() do
					if v306:HasTag("Cleanup_Drenched") then
						v306:Destroy()
					end
				end
			end
			for _, v307 in p304:GetChildren() do
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
	["Verdant"] = {
		["Id"] = "q",
		["Name"] = "Verdant",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(34, 139, 34),
		["_AddFX"] = function(p308, p309, p310)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p308:_RemoveFX(p309, p310)
			if p310 then
				for _, v311 in game.ServerStorage.Mutation_FX.Verdant:GetChildren() do
					local v312 = v311:Clone()
					v312.Parent = p310
					v312.Enabled = true
					v312:AddTag("Cleanup_Verdant")
				end
			end
			for v313, v314 in p309:GetDescendants() do
				if v314:IsA("BasePart") or v314:IsA("UnionOperation") then
					if v313 % 6 == 0 then
						local v315 = game.ServerStorage.Mutation_FX.Verdant.LeafSwirl:Clone()
						v315.Parent = v314
						v315.Enabled = true
						v315:AddTag("Cleanup_Verdant")
					end
					if not v314:HasTag("Effect") then
						local v316 = v314.Color
						v_u_13[v314] = v_u_13[v314] or v314.Color
						v_u_16[v314] = v_u_16[v314] or v314.Material
						local v317 = Color3.fromRGB
						local v318 = v316.R * 166 * 0.5
						local v319 = v316.G * 255 + 150
						v314.Color = v317(v318, math.clamp(v319, 0, 255) * 0.5, v316.B * 166 * 0.5)
						v314:AddTag("VerdantVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p320, p321)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p321 then
				for _, v322 in p321:GetChildren() do
					if v322:HasTag("Cleanup_Verdant") then
						v322:Destroy()
					end
				end
			end
			for _, v323 in p320:GetDescendants() do
				if (v323:IsA("BasePart") or v323:IsA("UnionOperation")) and v323:HasTag("VerdantVisual") then
					v323:RemoveTag("VerdantVisual")
					v323.Color = v_u_13[v323] or v323.Color
					v_u_13[v323] = nil
					if v_u_16[v323] then
						v323.Material = v_u_16[v323]
						v_u_16[v323] = nil
					end
					v323.Reflectance = 0
				end
			end
		end
	},
	["Paradisal"] = {
		["Id"] = "r",
		["Name"] = "Paradisal",
		["ValueMulti"] = 100,
		["Color"] = Color3.fromRGB(176, 240, 0),
		["_AddFX"] = function(p324, p325, p326)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p324:_RemoveFX(p325, p326)
			if p326 then
				for _, v327 in game.ServerStorage.Mutation_FX.Paradisal:GetChildren() do
					local v328 = v327:Clone()
					v328.Parent = p326
					v328.Enabled = true
					v328:AddTag("Cleanup_Paradisal")
				end
			end
			for v329, v330 in p325:GetDescendants() do
				if v330:IsA("BasePart") or v330:IsA("UnionOperation") then
					if v329 % 6 == 0 then
						local v331 = game.ServerStorage.Mutation_FX.Paradisal.Rays:Clone()
						v331.Parent = v330
						v331.Enabled = true
						v331:AddTag("Cleanup_Paradisal")
					end
					if not v330:HasTag("Effect") then
						v_u_13[v330] = v_u_13[v330] or v330.Color
						v_u_16[v330] = v_u_16[v330] or v330.Material
						v330.Color = Color3.fromRGB(176, 240, 0)
						v330:AddTag("ParadisalVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p332, p333)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p333 then
				for _, v334 in p333:GetChildren() do
					if v334:HasTag("Cleanup_Paradisal") then
						v334:Destroy()
					end
				end
			end
			for _, v335 in p332:GetDescendants() do
				if (v335:IsA("BasePart") or v335:IsA("UnionOperation")) and v335:HasTag("ParadisalVisual") then
					v335:RemoveTag("ParadisalVisual")
					v335.Color = v_u_13[v335] or v335.Color
					v_u_13[v335] = nil
					if v_u_16[v335] then
						v335.Material = v_u_16[v335]
						v_u_16[v335] = nil
					end
					v335.Reflectance = 0
				end
			end
		end
	},
	["Glitched"] = {
		["Id"] = "gli",
		["Name"] = "Glitched",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(240, 96, 228),
		["_AddFX"] = function(p336, p337, p338)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p336:_RemoveFX(p337, p338)
			if p338 then
				for _, v339 in game.ServerStorage.Mutation_FX.Glitched:GetChildren() do
					local v340 = v339:Clone()
					v340.Parent = p338
					v340.Enabled = true
					v340:AddTag("Cleanup_Glitched")
				end
			end
			local v341 = {
				Color3.fromRGB(240, 96, 228),
				Color3.fromRGB(79, 237, 240),
				Color3.fromRGB(84, 240, 67),
				Color3.fromRGB(217, 217, 217),
				Color3.fromRGB(39, 39, 255)
			}
			for v342, v343 in p337:GetDescendants() do
				if v343:IsA("BasePart") or v343:IsA("UnionOperation") then
					if v342 % 6 == 0 then
						local v344 = game.ServerStorage.Mutation_FX.Glitched.Glitchy:Clone()
						v344.Parent = v343
						v344.Enabled = true
						v344.Rate = math.random(12, 35) / 10
						v344:AddTag("Cleanup_Glitched")
					end
					if not v343:HasTag("Effect") then
						v_u_13[v343] = v_u_13[v343] or v343.Color
						v_u_16[v343] = v_u_16[v343] or v343.Material
						v343.Color = v341[math.random(1, #v341)]
						v343.Material = "ForceField"
						v343:AddTag("GlitchedVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p345, p346)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p346 then
				for _, v347 in p346:GetChildren() do
					if v347:HasTag("Cleanup_Glitched") then
						v347:Destroy()
					end
				end
			end
			for _, v348 in p345:GetDescendants() do
				if (v348:IsA("BasePart") or v348:IsA("UnionOperation")) and v348:HasTag("GlitchedVisual") then
					v348:RemoveTag("GlitchedVisual")
					v348.Color = v_u_13[v348] or v348.Color
					v_u_13[v348] = nil
					if v_u_16[v348] then
						v348.Material = v_u_16[v348]
						v_u_16[v348] = nil
					end
					v348.Reflectance = 0
				end
			end
		end
	},
	["Enchanted"] = {
		["Id"] = "Enc",
		["Name"] = "Enchanted",
		["ValueMulti"] = 50,
		["Color"] = Color3.fromRGB(255, 214, 89),
		["_AddFX"] = function(p349, p350, p351)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p349:_RemoveFX(p350, p351)
			if p351 then
				for _, v352 in game.ServerStorage.Mutation_FX.Enchanted:GetChildren() do
					local v353 = v352:Clone()
					v353.Parent = p351
					v353.Enabled = true
					v353:AddTag("Cleanup_Enchanment")
				end
			end
			local v354 = { Color3.fromRGB(255, 214, 89), Color3.fromRGB(255, 159, 80), Color3.fromRGB(255, 244, 123) }
			for v355, v356 in p350:GetDescendants() do
				if v356:IsA("BasePart") or v356:IsA("UnionOperation") then
					if v355 % 6 == 0 then
						local v357 = game.ServerStorage.Mutation_FX.Enchanted.Sparkle:Clone()
						v357.Parent = v356
						v357.Enabled = true
						v357.Rate = math.random(8, 25) / 10
						v357:AddTag("Cleanup_Enchanment")
						local v358 = Instance.new("Attachment", v356)
						v358:AddTag("Cleanup_Enchanment")
						local v359 = Instance.new("Attachment", v356)
						v359:AddTag("Cleanup_Enchanment")
						v358.Position = Vector3.new(0, 0.1, 0)
						v359.Position = Vector3.new(0, -0.1, 0)
						local v360 = Instance.new("Trail")
						v360.Color = ColorSequence.new(Color3.fromRGB(255, 214, 89))
						v360.LightInfluence = 0
						v360.Brightness = 3
						v360.Attachment0 = v358
						v360.Attachment1 = v359
						v360.Lifetime = 0.3
						v360.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
						v360.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
						v360.Parent = v356
						v360:AddTag("Cleanup_Enchanment")
					end
					if not v356:HasTag("Effect") then
						v_u_13[v356] = v_u_13[v356] or v356.Color
						v_u_16[v356] = v_u_16[v356] or v356.Material
						if v356.Transparency ~= 1 then
							v356.Color = v354[math.random(1, #v354)]
							v356.Material = "Neon"
							v356:SetAttribute("OTransparency", v356.Transparency)
							v356.Transparency = 0.5
							v356:AddTag("EnchanmentVisual")
						end
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p361, p362)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p362 then
				for _, v363 in p362:GetChildren() do
					if v363:HasTag("Cleanup_Enchantment") then
						v363:Destroy()
					end
				end
			end
			for _, v364 in p361:GetDescendants() do
				if (v364:IsA("BasePart") or v364:IsA("UnionOperation")) and v364:HasTag("EnchamtmentVisual") then
					v364:RemoveTag("EnchamtmentVisual")
					v364.Color = v_u_13[v364] or v364.Color
					v_u_13[v364] = nil
					v364.Transparency = v364:GetAttribute("OTransparency") or 0
					if v_u_16[v364] then
						v364.Material = v_u_16[v364]
						v_u_16[v364] = nil
					end
					v364.Reflectance = 0
				end
			end
		end
	},
	["Frozen"] = {
		["Id"] = "s",
		["Name"] = "Frozen",
		["ValueMulti"] = 10,
		["Color"] = Color3.fromRGB(108, 184, 255),
		["_AddFX"] = function(p365, p366, p367)
			-- upvalues: (copy) v_u_96
			v_u_96(p365, p366, p367, 0.8)
		end,
		["_RemoveFX"] = function(p368, p369, p370)
			-- upvalues: (copy) v_u_105
			v_u_105(p368, p369, p370)
		end
	},
	["Disco"] = {
		["Id"] = "t",
		["Name"] = "Disco",
		["ValueMulti"] = 125,
		["Color"] = Color3.fromRGB(255, 105, 180),
		["_AddFX"] = function(p371, p372, p373)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p371:_RemoveFX(p372, p373)
			local function v_u_376(p374)
				-- upvalues: (ref) v_u_13, (ref) v_u_16, (copy) v_u_376
				for _, v375 in p374:GetChildren() do
					if v375:IsA("BasePart") or v375:IsA("UnionOperation") then
						v_u_13[v375] = v_u_13[v375] or v375.Color
						v_u_16[v375] = v_u_16[v375] or v375.Material
						v375.Material = Enum.Material.Neon
						v375:AddTag("Discofied")
					elseif v375:IsA("Model") then
						v_u_376(v375)
					end
				end
			end
			v_u_376(p372)
		end,
		["_RemoveFX"] = function(_, p377, _)
			-- upvalues: (copy) v_u_13, (copy) v_u_16, (copy) v_u_5
			local v378 = {}
			for _, v379 in p377:GetDescendants() do
				if (v379:IsA("BasePart") or v379:IsA("UnionOperation")) and v379:HasTag("Discofied") then
					v379.Reflectance = 0
					v379:RemoveTag("Discofied")
					v379.Color = v_u_13[v379] or v379.Color
					v_u_13[v379] = nil
					local v380 = {
						["Part"] = v379,
						["Color"] = v379.Color
					}
					table.insert(v378, v380)
					local v381 = v_u_16[v379]
					if v381 then
						v379.Material = v381
						v_u_16[v379] = nil
					end
				end
			end
			v_u_5:FireAllClients(v378)
		end
	},
	["Choc"] = {
		["Id"] = "u",
		["Name"] = "Choc",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(92, 64, 51),
		["_AddFX"] = function(p382, p383, p384)
			-- upvalues: (copy) v_u_12
			p382:_RemoveFX(p383, p384)
			local function v_u_391(p385)
				-- upvalues: (ref) v_u_12, (copy) v_u_391
				for _, v_u_386 in p385:GetChildren() do
					if v_u_386:IsA("BasePart") or v_u_386:IsA("UnionOperation") then
						local v_u_387 = {}
						for _, v388 in game.ServerStorage.Mutation_Textures.Choc:GetChildren() do
							local v389 = v388:Clone()
							v389.Parent = v_u_386
							v389.Transparency = v_u_386.Transparency
							table.insert(v_u_387, v389)
							v389:AddTag("Cleanup_Choc")
						end
						v_u_12[v_u_386] = v_u_386.Changed:Connect(function()
							-- upvalues: (copy) v_u_386, (ref) v_u_12, (copy) v_u_387
							if v_u_386.Transparency == 0 then
								v_u_12[v_u_386]:Disconnect()
								for _, v390 in v_u_387 do
									v390.Transparency = 0
								end
							end
						end)
					elseif v_u_386:IsA("Model") then
						v_u_391(v_u_386)
					end
				end
			end
			v_u_391(p383)
		end,
		["_RemoveFX"] = function(_, p392, _)
			-- upvalues: (copy) v_u_12
			for _, v393 in p392:GetDescendants() do
				if v393:HasTag("Cleanup_Choc") then
					v393:Destroy()
				end
				if v_u_12[v393] then
					v_u_12[v393]:Disconnect()
				end
			end
		end
	},
	["Plasma"] = {
		["Id"] = "v",
		["Name"] = "Plasma",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(208, 43, 137),
		["_AddFX"] = function(p394, p395, p396)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p394:_RemoveFX(p395, p396)
			if p396 then
				for _, v397 in game.ServerStorage.Mutation_FX.Plasma:GetChildren() do
					local v398 = v397:Clone()
					v398.Parent = p396
					v398.Enabled = true
					v398:AddTag("Cleanup_Plasma")
				end
			end
			for _, v399 in p395:GetDescendants() do
				if (v399:IsA("BasePart") or v399:IsA("UnionOperation")) and not v399:HasTag("Effect") then
					v_u_13[v399] = v_u_13[v399] or v399.Color
					v399.Color = Color3.fromRGB(189, 67, 142)
					v_u_16[v399] = v_u_16[v399] or v399.Material
					v399.Material = Enum.Material.Neon
					v399.Reflectance = 0.05
					v399:AddTag("PlasmaVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p400, p401)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			local function v404(p402)
				for _, v403 in p402:GetDescendants() do
					if v403:HasTag("Cleanup_Plasma") then
						v403:Destroy()
					end
				end
			end
			if p401 then
				v404(p401)
			end
			if p400 then
				v404(p400)
			end
			for _, v405 in p400:GetDescendants() do
				if (v405:IsA("BasePart") or v405:IsA("UnionOperation")) and v405:HasTag("PlasmaVisual") then
					v405.Reflectance = 0
					v405.Color = v_u_13[v405] or v405.Color
					v_u_13[v405] = nil
					v405:RemoveTag("PlasmaVisual")
					if v_u_16[v405] then
						v405.Material = v_u_16[v405]
						v_u_16[v405] = nil
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
		["_AddFX"] = function(p406, p407, p408)
			p406:_RemoveFX(p407, p408)
			if p408 then
				for _, v409 in game.ServerStorage.Mutation_FX.Heavenly:GetChildren() do
					local v410 = v409:Clone()
					v410.Parent = p408
					v410.Enabled = true
					v410:AddTag("Cleanup_Heavenly")
				end
			end
		end,
		["_RemoveFX"] = function(_, p411, p412)
			local function v415(p413)
				for _, v414 in p413:GetDescendants() do
					if v414:HasTag("Cleanup_Heavenly") then
						v414:Destroy()
					end
				end
			end
			if p412 then
				v415(p412)
			end
			if p411 then
				v415(p411)
			end
		end
	},
	["Burnt"] = {
		["Id"] = "x",
		["Name"] = "Burnt",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(40, 40, 40),
		["_AddFX"] = function(p416, p417, p418)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			p416:_RemoveFX(p417, p418)
			if p418 then
				for _, v419 in game.ServerStorage.Mutation_FX.Burnt:GetChildren() do
					local v420 = v419:Clone()
					v420.Parent = p418
					v420.Enabled = true
					v420:AddTag("Cleanup_Burnt")
				end
			end
			for _, v421 in p417:GetDescendants() do
				if (v421:IsA("BasePart") or v421:IsA("UnionOperation")) and not v421:HasTag("Effect") then
					v_u_13[v421] = v_u_13[v421] or v421.Color
					v421.Color = Color3.fromRGB(25, 25, 25)
					v_u_16[v421] = v_u_16[v421] or v421.Material
					v421.Material = Enum.Material.Slate
					v421.Reflectance = 0.05
					v421:AddTag("BurntVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p422, p423)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			local function v426(p424)
				for _, v425 in p424:GetDescendants() do
					if v425:HasTag("Cleanup_Burnt") then
						v425:Destroy()
					end
				end
			end
			if p423 then
				v426(p423)
			end
			if p422 then
				v426(p422)
			end
			for _, v427 in p422:GetDescendants() do
				if (v427:IsA("BasePart") or v427:IsA("UnionOperation")) and v427:HasTag("BurntVisual") then
					v427.Reflectance = 0
					v427.Color = v_u_13[v427] or v427.Color
					v_u_13[v427] = nil
					v427:RemoveTag("BurntVisual")
					if v_u_16[v427] then
						v427.Material = v_u_16[v427]
						v_u_16[v427] = nil
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
		["_AddFX"] = function(p428, p429, p430)
			-- upvalues: (copy) v_u_13
			p428:_RemoveFX(p429, p430)
			if p430 then
				for _, v431 in game.ServerStorage.Mutation_FX.Cooked:GetChildren() do
					local v432 = v431:Clone()
					v432.Parent = p430
					v432.Enabled = true
					v432:AddTag("Cleanup_Cooked")
				end
			end
			for _, v433 in p429:GetDescendants() do
				if (v433:IsA("BasePart") or v433:IsA("UnionOperation")) and not v433:HasTag("Effect") then
					v_u_13[v433] = v_u_13[v433] or v433.Color
					v433.Color = Color3.fromRGB(210, 120, 60)
					v433:AddTag("CookedVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p434, p435)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			local function v438(p436)
				for _, v437 in p436:GetDescendants() do
					if v437:HasTag("Cleanup_Cooked") then
						v437:Destroy()
					end
				end
			end
			if p435 then
				v438(p435)
			end
			if p434 then
				v438(p434)
			end
			for _, v439 in p434:GetDescendants() do
				if (v439:IsA("BasePart") or v439:IsA("UnionOperation")) and v439:HasTag("CookedVisual") then
					v439.Reflectance = 0
					v439.Color = v_u_13[v439] or v439.Color
					v_u_13[v439] = nil
					v439:RemoveTag("CookedVisual")
					local v440 = v_u_16[v439]
					if v440 then
						v439.Material = v440
						v_u_16[v439] = nil
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
		["_AddFX"] = function(p441, p442, p443)
			-- upvalues: (copy) v_u_13
			p441:_RemoveFX(p442, p443)
			if p443 then
				for _, v444 in game.ServerStorage.Mutation_FX.Moonlit:GetChildren() do
					local v445 = v444:Clone()
					v445.Parent = p443
					v445.Enabled = true
					v445:AddTag("Cleanup_Moonlit")
					v445:AddTag("Effect")
				end
			end
			for _, v446 in p442:GetDescendants() do
				if (v446:IsA("BasePart") or v446:IsA("UnionOperation")) and not v446:HasTag("Effect") then
					v_u_13[v446] = v_u_13[v446] or v446.Color
					v446.Color = Color3.fromRGB(62, 56, 86)
					v446.Reflectance = 0.3
					v446:AddTag("MoonlitVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p447, p448)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p448 then
				for _, v449 in p448:GetChildren() do
					if v449:HasTag("Cleanup_Moonlit") then
						v449:Destroy()
					end
				end
			end
			for _, v450 in p447:GetDescendants() do
				if (v450:IsA("BasePart") or v450:IsA("UnionOperation")) and v450:HasTag("MoonlitVisual") then
					v450.Color = v_u_13[v450] or v450.Color
					v_u_13[v450] = nil
					v450.Reflectance = 0
					v450:RemoveTag("MoonlitVisual")
					local v451 = v_u_16[v450]
					if v451 then
						v450.Material = v451
						v_u_16[v450] = nil
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
		["_AddFX"] = function(p452, p453, p454)
			-- upvalues: (copy) v_u_13
			p452:_RemoveFX(p453, p454)
			if p454 then
				for _, v455 in game.ServerStorage.Mutation_FX.Bloodlit:GetChildren() do
					local v456 = v455:Clone()
					v456.Parent = p454
					v456.Enabled = true
					v456:AddTag("Cleanup_Bloodlit")
					v456:AddTag("Effect")
				end
			end
			for _, v457 in p453:GetDescendants() do
				if (v457:IsA("BasePart") or v457:IsA("UnionOperation")) and not v457:HasTag("Effect") then
					v_u_13[v457] = v_u_13[v457] or v457.Color
					v457.Color = Color3.fromRGB(143, 1, 3)
					v457.Reflectance = 0.3
					v457:AddTag("BloodlitVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p458, p459)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p459 then
				for _, v460 in p459:GetChildren() do
					if v460:HasTag("Cleanup_Bloodlit") then
						v460:Destroy()
					end
				end
			end
			for _, v461 in p458:GetDescendants() do
				if (v461:IsA("BasePart") or v461:IsA("UnionOperation")) and v461:HasTag("BloodlitVisual") then
					v461.Reflectance = 0
					v461.Color = v_u_13[v461] or v461.Color
					v_u_13[v461] = nil
					v461:RemoveTag("BloodlitVisual")
					local v462 = v_u_16[v461]
					if v462 then
						v461.Material = v462
						v_u_16[v461] = nil
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
		["_AddFX"] = function(p463, p464, p465)
			p463:_RemoveFX(p464, p465)
			if p465 then
				for _, v466 in game.ServerStorage.Mutation_FX.Zombified:GetChildren() do
					local v467 = v466:Clone()
					v467.Parent = p465
					v467.Enabled = true
					v467:AddTag("Cleanup_Zombified")
					v467:AddTag("Effect")
				end
			end
			for _, v468 in p464:GetDescendants() do
				if (v468:IsA("BasePart") or v468:IsA("UnionOperation")) and not v468:HasTag("Effect") then
					v468:AddTag("ZombifiedVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p469, p470)
			-- upvalues: (copy) v_u_16
			if p470 then
				for _, v471 in p470:GetChildren() do
					if v471:HasTag("Cleanup_Zombified") then
						v471:Destroy()
					end
				end
			end
			for _, v472 in p469:GetDescendants() do
				if (v472:IsA("BasePart") or v472:IsA("UnionOperation")) and v472:HasTag("ZombifiedVisual") then
					v472:RemoveTag("ZombifiedVisual")
					local v473 = v_u_16[v472]
					if v473 then
						v472.Material = v473
						v_u_16[v472] = nil
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
		["_AddFX"] = function(p474, p475, p476)
			p474:_RemoveFX(p475, p476)
			if p476 then
				for _, v477 in game.ServerStorage.Mutation_FX.Celestial:GetChildren() do
					local v478 = v477:Clone()
					v478.Parent = p476
					v478.Enabled = true
					v478:AddTag("Cleanup_Celestial")
					v478:AddTag("Effect")
				end
			end
			for _, v479 in p475:GetDescendants() do
				if (v479:IsA("BasePart") or v479:IsA("UnionOperation")) and not v479:HasTag("Effect") then
					v479.Reflectance = 0.5
					v479:AddTag("CelestialVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p480, p481)
			-- upvalues: (copy) v_u_16
			if p481 then
				for _, v482 in p481:GetChildren() do
					if v482:HasTag("Cleanup_Celestial") then
						v482:Destroy()
					end
				end
			end
			for _, v483 in p480:GetDescendants() do
				if (v483:IsA("BasePart") or v483:IsA("UnionOperation")) and v483:HasTag("CelestialVisual") then
					v483.Reflectance = 0
					v483:RemoveTag("CelestialVisual")
					local v484 = v_u_16[v483]
					if v484 then
						v483.Material = v484
						v_u_16[v483] = nil
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
		["_AddFX"] = function(p485, p486, p487)
			p485:_RemoveFX(p486, p487)
			if p487 then
				for _, v488 in game.ServerStorage.Mutation_FX.Meteoric:GetChildren() do
					local v489 = v488:Clone()
					v489.Parent = p487
					v489.Enabled = true
					v489:AddTag("Cleanup_Meteoric")
					v489:AddTag("Effect")
				end
			end
			for _, v490 in p486:GetDescendants() do
				if (v490:IsA("BasePart") or v490:IsA("UnionOperation")) and not v490:HasTag("Effect") then
					v490.Reflectance = 0.5
					v490:AddTag("MeteoricVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p491, p492)
			-- upvalues: (copy) v_u_16
			if p492 then
				for _, v493 in p492:GetChildren() do
					if v493:HasTag("Cleanup_Meteoric") then
						v493:Destroy()
					end
				end
			end
			for _, v494 in p491:GetDescendants() do
				if (v494:IsA("BasePart") or v494:IsA("UnionOperation")) and v494:HasTag("MeteoricVisual") then
					v494.Reflectance = 0
					v494:RemoveTag("MeteoricVisual")
					local v495 = v_u_16[v494]
					if v495 then
						v494.Material = v495
						v_u_16[v494] = nil
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
		["_AddFX"] = function(p496, p497, p498)
			p496:_RemoveFX(p497, p498)
			if p498 then
				for _, v499 in game.ServerStorage.Mutation_FX.Honey:GetChildren() do
					local v500 = v499:Clone()
					v500.Parent = p498
					v500.Enabled = true
					v500:AddTag("Cleanup_Honey")
					v500:AddTag("Effect")
				end
			end
			for _, v501 in p497:GetDescendants() do
				if (v501:IsA("BasePart") or v501:IsA("UnionOperation")) and not v501:HasTag("Effect") then
					v501:AddTag("HoneyVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p502, p503)
			-- upvalues: (copy) v_u_16
			if p503 then
				for _, v504 in p503:GetChildren() do
					if v504:HasTag("Cleanup_Honey") then
						v504:Destroy()
					end
				end
			end
			for _, v505 in p502:GetDescendants() do
				if (v505:IsA("BasePart") or v505:IsA("UnionOperation")) and v505:HasTag("HoneyVisual") then
					v505:RemoveTag("HoneyVisual")
					local v506 = v_u_16[v505]
					if v506 then
						v505.Material = v506
						v_u_16[v505] = nil
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
		["_AddFX"] = function(p507, p508, p509)
			-- upvalues: (copy) v_u_13
			p507:_RemoveFX(p508, p509)
			if p509 then
				for _, v510 in game.ServerStorage.Mutation_FX.Pollinated:GetChildren() do
					local v511 = v510:Clone()
					v511.Parent = p509
					v511.Enabled = true
					v511:AddTag("Cleanup_Pollinated")
					v511:AddTag("Effect")
				end
			end
			for _, v512 in p508:GetDescendants() do
				if (v512:IsA("BasePart") or v512:IsA("UnionOperation")) and not v512:HasTag("Effect") then
					v_u_13[v512] = v_u_13[v512] or v512.Color
					v512.Color = Color3.fromRGB(255, 170, 0)
					v512:AddTag("PollinatedlVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p513, p514)
			-- upvalues: (copy) v_u_13, (copy) v_u_16
			if p514 then
				for _, v515 in p514:GetChildren() do
					if v515:HasTag("Cleanup_Pollinated") then
						v515:Destroy()
					end
				end
			end
			for _, v516 in p513:GetDescendants() do
				if (v516:IsA("BasePart") or v516:IsA("UnionOperation")) and v516:HasTag("PollinatedlVisual") then
					v516:RemoveTag("PollinatedVisual")
					v516.Color = v_u_13[v516] or v516.Color
					v_u_13[v516] = nil
					local v517 = v_u_16[v516]
					if v517 then
						v516.Material = v517
						v_u_16[v516] = nil
					end
				end
			end
		end
	}
}
local v525 = {
	["Id"] = "G",
	["Name"] = "Amber",
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(255, 192, 0),
	["TimeData"] = {
		["TimeToChange"] = 86400,
		["AddMutationName"] = "OldAmber"
	},
	["_AddFX"] = function(p519, p520, p521)
		-- upvalues: (copy) v_u_96
		v_u_96(p519, p520, p521, 0.5)
	end,
	["_RemoveFX"] = function(p522, p523, p524)
		-- upvalues: (copy) v_u_105
		v_u_105(p522, p523, p524)
	end
}
v_u_518.Amber = v525
local v532 = {
	["Id"] = "H",
	["Name"] = "OldAmber",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(252, 106, 33),
	["TimeData"] = {
		["TimeToChange"] = 172800,
		["AddMutationName"] = "AncientAmber"
	},
	["_AddFX"] = function(p526, p527, p528)
		-- upvalues: (copy) v_u_96
		v_u_96(p526, p527, p528, 0.5)
	end,
	["_RemoveFX"] = function(p529, p530, p531)
		-- upvalues: (copy) v_u_105
		v_u_105(p529, p530, p531)
	end
}
v_u_518.OldAmber = v532
v_u_518.AncientAmber = {
	["Id"] = "I",
	["Name"] = "AncientAmber",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(204, 68, 0),
	["_AddFX"] = function(p533, p534, p535)
		-- upvalues: (copy) v_u_96
		v_u_96(p533, p534, p535, 0.5)
	end,
	["_RemoveFX"] = function(p536, p537, p538)
		-- upvalues: (copy) v_u_105
		v_u_105(p536, p537, p538)
	end
}
v_u_518.Sandy = {
	["Id"] = "J",
	["Name"] = "Sandy",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(212, 191, 141),
	["_AddFX"] = function(p539, p540, p541)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p539:_RemoveFX(p540, p541)
		if p541 then
			for _, v542 in game.ServerStorage.Mutation_FX.Sandy:GetChildren() do
				local v543 = v542:Clone()
				v543.Parent = p541
				v543.Enabled = true
				v543:AddTag("Cleanup_Sandy")
			end
		end
		for _, v544 in p540:GetDescendants() do
			if (v544:IsA("BasePart") or v544:IsA("UnionOperation")) and not v544:HasTag("Effect") then
				v_u_13[v544] = v_u_13[v544] or v544.Color
				v544.Color = Color3.fromRGB(240, 206, 119)
				v_u_16[v544] = v_u_16[v544] or v544.Material
				v544.Material = Enum.Material.Sand
				v544.Reflectance = 0
				v544:AddTag("SandyVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p545, p546)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v549(p547)
			for _, v548 in p547:GetDescendants() do
				if v548:HasTag("Cleanup_Sandy") then
					v548:Destroy()
				end
			end
		end
		if p546 then
			v549(p546)
		end
		if p545 then
			v549(p545)
		end
		for _, v550 in p545:GetDescendants() do
			if (v550:IsA("BasePart") or v550:IsA("UnionOperation")) and v550:HasTag("SandyVisual") then
				v550.Reflectance = 0
				v550.Color = v_u_13[v550] or v550.Color
				v_u_13[v550] = nil
				v550:RemoveTag("SandyVisual")
				if v_u_16[v550] then
					v550.Material = v_u_16[v550]
					v_u_16[v550] = nil
				end
			end
		end
	end
}
v_u_518.Clay = {
	["Id"] = "K",
	["Name"] = "Clay",
	["ValueMulti"] = 5,
	["Color"] = Color3.fromRGB(147, 129, 122),
	["_AddFX"] = function(p551, p552, p553)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p551:_RemoveFX(p552, p553)
		if p553 then
			for _, v554 in game.ServerStorage.Mutation_FX.Clay:GetChildren() do
				local v555 = v554:Clone()
				v555.Parent = p553
				v555.Enabled = true
				v555:AddTag("Cleanup_Clay")
			end
		end
		for _, v556 in p552:GetDescendants() do
			if (v556:IsA("BasePart") or v556:IsA("UnionOperation")) and not v556:HasTag("Effect") then
				v_u_13[v556] = v_u_13[v556] or v556.Color
				v556.Color = Color3.fromRGB(147, 129, 122)
				v_u_16[v556] = v_u_16[v556] or v556.Material
				v556.Material = Enum.Material.Plaster
				v556.Reflectance = 0.5
				v556:AddTag("ClayVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p557, p558)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v561(p559)
			for _, v560 in p559:GetDescendants() do
				if v560:HasTag("Cleanup_Clay") then
					v560:Destroy()
				end
			end
		end
		if p558 then
			v561(p558)
		end
		if p557 then
			v561(p557)
		end
		for _, v562 in p557:GetDescendants() do
			if (v562:IsA("BasePart") or v562:IsA("UnionOperation")) and v562:HasTag("ClayVisual") then
				v562.Reflectance = 0
				v562.Color = v_u_13[v562] or v562.Color
				v_u_13[v562] = nil
				v562:RemoveTag("ClayVisual")
				if v_u_16[v562] then
					v562.Material = v_u_16[v562]
					v_u_16[v562] = nil
				end
			end
		end
	end
}
v_u_518.Ceramic = {
	["Id"] = "L",
	["Name"] = "Ceramic",
	["ValueMulti"] = 32,
	["Color"] = Color3.fromRGB(234, 184, 146),
	["_AddFX"] = function(p563, p564, p565)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p563:_RemoveFX(p564, p565)
		if p565 then
			for _, v566 in game.ServerStorage.Mutation_FX.Ceramic:GetChildren() do
				local v567 = v566:Clone()
				v567.Parent = p565
				v567.Enabled = true
				v567:AddTag("Cleanup_Ceramic")
			end
		end
		for _, v568 in p564:GetDescendants() do
			if (v568:IsA("BasePart") or v568:IsA("UnionOperation")) and not v568:HasTag("Effect") then
				v_u_13[v568] = v_u_13[v568] or v568.Color
				v568.Color = Color3.fromRGB(234, 184, 146)
				v_u_16[v568] = v_u_16[v568] or v568.Material
				v568.Material = Enum.Material.Concrete
				v568:AddTag("CeramicVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p569, p570)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v573(p571)
			for _, v572 in p571:GetDescendants() do
				if v572:HasTag("Cleanup_Ceramic") then
					v572:Destroy()
				end
			end
		end
		if p570 then
			v573(p570)
		end
		if p569 then
			v573(p569)
		end
		for _, v574 in p569:GetDescendants() do
			if (v574:IsA("BasePart") or v574:IsA("UnionOperation")) and v574:HasTag("CeramicVisual") then
				v574.Reflectance = 0
				v574.Color = v_u_13[v574] or v574.Color
				v_u_13[v574] = nil
				v574:RemoveTag("CeramicVisual")
				if v_u_16[v574] then
					v574.Material = v_u_16[v574]
					v_u_16[v574] = nil
				end
			end
		end
	end
}
v_u_518.Friendbound = {
	["Id"] = "M",
	["Name"] = "Friendbound",
	["ValueMulti"] = 70,
	["Color"] = Color3.fromRGB(255, 0, 127),
	["_AddFX"] = function(p575, p576, p577)
		-- upvalues: (copy) v_u_13
		p575:_RemoveFX(p576, p577)
		if p577 then
			for _, v578 in game.ServerStorage.Mutation_FX.Friendbound:GetChildren() do
				local v579 = v578:Clone()
				v579.Parent = p577
				v579.Enabled = true
				v579:AddTag("Cleanup_Friendbound")
			end
		end
		for _, v580 in p576:GetDescendants() do
			if (v580:IsA("BasePart") or v580:IsA("UnionOperation")) and not v580:HasTag("Effect") then
				v_u_13[v580] = v_u_13[v580] or v580.Color
				v580.Color = v_u_13[v580]:Lerp(Color3.fromRGB(255, 0, 127), 0.4)
				v580:AddTag("FriendboundVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p581, p582)
		-- upvalues: (copy) v_u_13
		local function v585(p583)
			for _, v584 in p583:GetDescendants() do
				if v584:HasTag("Cleanup_Friendbound") then
					v584:Destroy()
				end
			end
		end
		if p582 then
			v585(p582)
		end
		if p581 then
			v585(p581)
		end
		for _, v586 in p581:GetDescendants() do
			if (v586:IsA("BasePart") or v586:IsA("UnionOperation")) and v586:HasTag("FriendboundVisual") then
				v586.Color = v_u_13[v586] or v586.Color
				v_u_13[v586] = nil
				v586:RemoveTag("FriendboundVisual")
			end
		end
	end
}
v_u_518.Tempestuous = {
	["Id"] = "N",
	["Name"] = "Tempestuous",
	["ValueMulti"] = 12,
	["Color"] = Color3.fromRGB(143, 163, 180),
	["_AddFX"] = function(p587, p588, p589)
		p587:_RemoveFX(p588, p589)
		if p589 then
			for _, v590 in { game.ServerStorage.Mutation_FX.Twisted, game.ServerStorage.Mutation_FX.Tempestous } do
				for _, v591 in v590:GetChildren() do
					local v592 = v591:Clone()
					v592.Parent = p589
					v592.Enabled = true
					v592:AddTag("Cleanup_Tempestuous")
				end
			end
		end
		for _, v593 in p588:GetDescendants() do
			if (v593:IsA("BasePart") or v593:IsA("UnionOperation")) and not v593:HasTag("Effect") then
				v593:AddTag("TempestuousVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p594, p595)
		if p595 then
			for _, v596 in p595:GetChildren() do
				if v596:HasTag("Cleanup_Tempestuous") then
					v596:Destroy()
				end
			end
		end
		for _, v597 in p594:GetDescendants() do
			if (v597:IsA("BasePart") or v597:IsA("UnionOperation")) and v597:HasTag("TempestuousVisual") then
				v597:RemoveTag("TempestuousVisual")
			end
		end
	end
}
v_u_518.Infected = {
	["Id"] = "O",
	["Name"] = "Infected",
	["ValueMulti"] = 75,
	["Color"] = Color3.fromRGB(67, 167, 0),
	["_AddFX"] = function(p598, p599, p600)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p598:_RemoveFX(p599, p600)
		if p600 then
			for _, v601 in game.ServerStorage.Mutation_FX.Infected:GetChildren() do
				local v602 = v601:Clone()
				v602.Parent = p600
				v602.Enabled = true
				v602:AddTag("Cleanup_Infected")
			end
		end
		for _, v603 in p599:GetDescendants() do
			if (v603:IsA("BasePart") or v603:IsA("UnionOperation")) and not v603:HasTag("Effect") then
				v_u_13[v603] = v_u_13[v603] or v603.Color
				v603.Color = Color3.fromRGB(65, 175, 0)
				v_u_16[v603] = v_u_16[v603] or v603.Material
				v603:AddTag("InfectedVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p604, p605)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v608(p606)
			for _, v607 in p606:GetDescendants() do
				if v607:HasTag("Cleanup_Infected") then
					v607:Destroy()
				end
			end
		end
		if p605 then
			v608(p605)
		end
		if p604 then
			v608(p604)
		end
		for _, v609 in p604:GetDescendants() do
			if (v609:IsA("BasePart") or v609:IsA("UnionOperation")) and v609:HasTag("InfectedVisual") then
				v609.Reflectance = 0
				v609.Color = v_u_13[v609] or v609.Color
				v_u_13[v609] = nil
				v609:RemoveTag("InfectedVisual")
				if v_u_16[v609] then
					v609.Material = v_u_16[v609]
					v_u_16[v609] = nil
				end
			end
		end
	end
}
v_u_518.Radioactive = {
	["Id"] = "P",
	["Name"] = "Radioactive",
	["ValueMulti"] = 55,
	["Color"] = Color3.fromRGB(98, 255, 0),
	["_AddFX"] = function(p610, p611, p612)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p610:_RemoveFX(p611, p612)
		if p612 then
			for _, v613 in game.ServerStorage.Mutation_FX.Radioactive:GetChildren() do
				local v614 = v613:Clone()
				v614.Parent = p612
				v614.Enabled = true
				v614:AddTag("Cleanup_Radioactive")
			end
		end
		for _, v615 in p611:GetDescendants() do
			if (v615:IsA("BasePart") or v615:IsA("UnionOperation")) and not v615:HasTag("Effect") then
				v_u_13[v615] = v_u_13[v615] or v615.Color
				v615.Color = Color3.fromRGB(65, 175, 0)
				v_u_16[v615] = v_u_16[v615] or v615.Material
				v615.Material = Enum.Material.Neon
				v615:AddTag("RadioactiveVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p616, p617)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v620(p618)
			for _, v619 in p618:GetDescendants() do
				if v619:HasTag("Cleanup_Radioactive") then
					v619:Destroy()
				end
			end
		end
		if p617 then
			v620(p617)
		end
		if p616 then
			v620(p616)
		end
		for _, v621 in p616:GetDescendants() do
			if (v621:IsA("BasePart") or v621:IsA("UnionOperation")) and v621:HasTag("RadioactiveVisual") then
				v621.Reflectance = 0
				v621.Color = v_u_13[v621] or v621.Color
				v_u_13[v621] = nil
				v621:RemoveTag("RadioactiveVisual")
				if v_u_16[v621] then
					v621.Material = v_u_16[v621]
					v_u_16[v621] = nil
				end
			end
		end
	end
}
v_u_518.Chakra = {
	["Id"] = "R",
	["Name"] = "Chakra",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(255, 80, 65),
	["_AddFX"] = function(p622, p623, p624)
		p622:_RemoveFX(p623, p624)
		local v625 = game.ServerStorage.Mutation_FX.Chakra:GetChildren()
		if p624 then
			for _, v626 in v625 do
				local v627 = v626:Clone()
				v627.Parent = p624
				v627.Enabled = true
				v627:AddTag("Cleanup_Chakra")
			end
		end
		local v628 = 0
		for _, v629 in p623:GetDescendants() do
			if v629:IsA("BasePart") and v629 ~= p624 then
				v628 = v628 + 1
				if v628 % 3 == 0 then
					local v630 = v625[math.random(1, #v625)]:Clone()
					v630.Parent = v629
					v630.Enabled = true
					v630:AddTag("Cleanup_Chakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p631, p632)
		local function v635(p633)
			for _, v634 in p633:GetDescendants() do
				if v634:HasTag("Cleanup_Chakra") then
					v634:Destroy()
				end
			end
		end
		if p632 then
			v635(p632)
		end
		if p631 then
			v635(p631)
		end
	end
}
v_u_518.FoxfireChakra = {
	["Id"] = "S",
	["Name"] = "FoxfireChakra",
	["ValueMulti"] = 90,
	["Color"] = Color3.fromRGB(255, 80, 65),
	["_AddFX"] = function(p636, p637, p638)
		p636:_RemoveFX(p637, p638)
		local v639 = game.ServerStorage.Mutation_FX.FoxfireChakra:GetChildren()
		local v640 = nil
		for _, v641 in v639 do
			if v641.Name == "Flames" then
				v640 = v641
				break
			end
		end
		if p638 then
			for _, v642 in v639 do
				local v643 = v642:Clone()
				v643.Parent = p638
				v643.Enabled = true
				v643:AddTag("Cleanup_FoxfireChakra")
			end
		end
		local v644 = 0
		for _, v645 in p637:GetDescendants() do
			if v645:IsA("BasePart") and v645 ~= p638 then
				v644 = v644 + 1
				if v644 % 2 == 0 then
					local v646 = v639[math.random(1, #v639)]:Clone()
					v646.Parent = v645
					v646.Enabled = true
					v646:AddTag("Cleanup_FoxfireChakra")
				end
				if v644 % 3 == 0 and v640 then
					local v647 = v640:Clone()
					v647.Parent = v645
					v647.Enabled = true
					v647:AddTag("Cleanup_FoxfireChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p648, p649)
		local function v652(p650)
			for _, v651 in p650:GetDescendants() do
				if v651:HasTag("Cleanup_FoxfireChakra") then
					v651:Destroy()
				end
			end
		end
		if p649 then
			v652(p649)
		end
		if p648 then
			v652(p648)
		end
	end
}
v_u_518.CorruptChakra = {
	["Id"] = "T",
	["Name"] = "CorruptChakra",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(0, 85, 255),
	["_AddFX"] = function(p653, p654, p655)
		p653:_RemoveFX(p654, p655)
		local v656 = game.ServerStorage.Mutation_FX.CorruptChakra:GetChildren()
		if p655 then
			for _, v657 in v656 do
				local v658 = v657:Clone()
				v658.Parent = p655
				v658.Enabled = true
				v658:AddTag("Cleanup_CorruptChakra")
			end
		end
		local v659 = 0
		for _, v660 in p654:GetDescendants() do
			if v660:IsA("BasePart") and v660 ~= p655 then
				v659 = v659 + 1
				if v659 % 3 == 0 then
					local v661 = v656[math.random(1, #v656)]:Clone()
					v661.Parent = v660
					v661.Enabled = true
					v661:AddTag("Cleanup_CorruptChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p662, p663)
		local function v666(p664)
			for _, v665 in p664:GetDescendants() do
				if v665:HasTag("Cleanup_CorruptChakra") then
					v665:Destroy()
				end
			end
		end
		if p663 then
			v666(p663)
		end
		if p662 then
			v666(p662)
		end
	end
}
v_u_518.CorruptFoxfireChakra = {
	["Id"] = "U",
	["Name"] = "CorruptFoxfireChakra",
	["ValueMulti"] = 90,
	["Color"] = Color3.fromRGB(0, 0, 255),
	["_AddFX"] = function(p667, p668, p669)
		p667:_RemoveFX(p668, p669)
		local v670 = game.ServerStorage.Mutation_FX.CorruptFoxfireChakra:GetChildren()
		local v671 = nil
		for _, v672 in v670 do
			if v672.Name == "Flames" then
				v671 = v672
				break
			end
		end
		if p669 then
			for _, v673 in v670 do
				local v674 = v673:Clone()
				v674.Parent = p669
				v674.Enabled = true
				v674:AddTag("Cleanup_CorruptFoxfireChakra")
			end
		end
		local v675 = 0
		for _, v676 in p668:GetDescendants() do
			if v676:IsA("BasePart") and v676 ~= p669 then
				v675 = v675 + 1
				if v675 % 2 == 0 then
					local v677 = v670[math.random(1, #v670)]:Clone()
					v677.Parent = v676
					v677.Enabled = true
					v677:AddTag("Cleanup_CorruptFoxfireChakra")
				end
				if v675 % 3 == 0 and v671 then
					local v678 = v671:Clone()
					v678.Parent = v676
					v678.Enabled = true
					v678:AddTag("Cleanup_CorruptFoxfireChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p679, p680)
		local function v683(p681)
			for _, v682 in p681:GetDescendants() do
				if v682:HasTag("Cleanup_CorruptFoxfireChakra") then
					v682:Destroy()
				end
			end
		end
		if p680 then
			v683(p680)
		end
		if p679 then
			v683(p679)
		end
	end
}
v_u_518.Static = {
	["Id"] = "V",
	["Name"] = "Static",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p684, p685, p686)
		p684:_RemoveFX(p685, p686)
		if p686 then
			for _, v687 in game.ServerStorage.Mutation_FX.Static:GetChildren() do
				local v688 = v687:Clone()
				v688.Parent = p686
				v688:AddTag("Cleanup_Static")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p689)
		if p689 then
			for _, v690 in p689:GetChildren() do
				if v690:HasTag("Cleanup_Static") then
					v690:Destroy()
				end
			end
		end
	end
}
v_u_518.HarmonisedChakra = {
	["Id"] = "W",
	["Name"] = "HarmonisedChakra",
	["ValueMulti"] = 35,
	["Color"] = Color3.fromRGB(170, 85, 255),
	["_AddFX"] = function(p691, p692, p693)
		p691:_RemoveFX(p692, p693)
		local v694 = game.ServerStorage.Mutation_FX.HarmonisedChakra:GetChildren()
		if p693 then
			for _, v695 in v694 do
				local v696 = v695:Clone()
				v696.Parent = p693
				v696.Enabled = true
				v696:AddTag("Cleanup_HarmonisedChakra")
			end
		end
		local v697 = 0
		for _, v698 in p692:GetDescendants() do
			if v698:IsA("BasePart") and v698 ~= p693 then
				v697 = v697 + 1
				if v697 % 3 == 0 then
					local v699 = v694[math.random(1, #v694)]:Clone()
					v699.Parent = v698
					v699.Enabled = true
					v699:AddTag("Cleanup_HarmonisedChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p700, p701)
		local function v704(p702)
			for _, v703 in p702:GetDescendants() do
				if v703:HasTag("Cleanup_HarmonisedChakra") then
					v703:Destroy()
				end
			end
		end
		if p701 then
			v704(p701)
		end
		if p700 then
			v704(p700)
		end
	end
}
v_u_518.HarmonisedFoxfireChakra = {
	["Id"] = "X",
	["Name"] = "HarmonisedFoxfireChakra",
	["ValueMulti"] = 190,
	["Color"] = Color3.fromRGB(170, 85, 255),
	["_AddFX"] = function(p705, p706, p707)
		p705:_RemoveFX(p706, p707)
		local v708 = game.ServerStorage.Mutation_FX.HarmonisedFoxfireChakra:GetChildren()
		local v709 = nil
		for _, v710 in v708 do
			if v710.Name == "Flames" then
				v709 = v710
				break
			end
		end
		if p707 then
			for _, v711 in v708 do
				local v712 = v711:Clone()
				v712.Parent = p707
				v712.Enabled = true
				v712:AddTag("Cleanup_HarmonisedFoxfireChakra")
			end
		end
		local v713 = 0
		for _, v714 in p706:GetDescendants() do
			if v714:IsA("BasePart") and v714 ~= p707 then
				v713 = v713 + 1
				if v713 % 2 == 0 then
					local v715 = v708[math.random(1, #v708)]:Clone()
					v715.Parent = v714
					v715.Enabled = true
					v715:AddTag("Cleanup_HarmonisedFoxfireChakra")
				end
				if v713 % 3 == 0 and v709 then
					local v716 = v709:Clone()
					v716.Parent = v714
					v716.Enabled = true
					v716:AddTag("Cleanup_HarmonisedFoxfireChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p717, p718)
		local function v721(p719)
			for _, v720 in p719:GetDescendants() do
				if v720:HasTag("Cleanup_HarmonisedFoxfireChakra") then
					v720:Destroy()
				end
			end
		end
		if p718 then
			v721(p718)
		end
		if p717 then
			v721(p717)
		end
	end
}
v_u_518.Pasta = {
	["Id"] = "PA",
	["Name"] = "Pasta",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(255, 223, 128),
	["_AddFX"] = function(p722, p723, p724)
		p722:_RemoveFX(p723, p724)
		local v725 = {}
		for _, v726 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
			if v726.Name == "Pasta" then
				table.insert(v725, v726)
			end
		end
		if p724 then
			for _, v727 in v725 do
				if not p724:FindFirstChild(v727.Name) then
					local v728 = v727:Clone()
					v728.Parent = p724
					v728.Enabled = true
					v728:AddTag("Cleanup_Pasta")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p729, p730)
		local function v733(p731)
			for _, v732 in p731:GetDescendants() do
				if v732:HasTag("Cleanup_Pasta") then
					v732:Destroy()
				end
			end
		end
		if p730 then
			v733(p730)
		end
		if p729 then
			v733(p729)
		end
	end
}
v_u_518.Sauce = {
	["Id"] = "SA",
	["Name"] = "Sauce",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(200, 45, 35),
	["_AddFX"] = function(p734, p735, p736)
		p734:_RemoveFX(p735, p736)
		local v737 = {}
		for _, v738 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
			if v738.Name == "Sauce" then
				table.insert(v737, v738)
			end
		end
		if p736 then
			for _, v739 in v737 do
				if not p736:FindFirstChild(v739.Name) then
					local v740 = v739:Clone()
					v740.Parent = p736
					v740.Enabled = true
					v740:AddTag("Cleanup_Sauce")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p741, p742)
		local function v745(p743)
			for _, v744 in p743:GetDescendants() do
				if v744:HasTag("Cleanup_Sauce") then
					v744:Destroy()
				end
			end
		end
		if p742 then
			v745(p742)
		end
		if p741 then
			v745(p741)
		end
	end
}
v_u_518.Meatball = {
	["Id"] = "MB",
	["Name"] = "Meatball",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(139, 69, 19),
	["_AddFX"] = function(p746, p747, p748)
		p746:_RemoveFX(p747, p748)
		local v749 = {}
		for _, v750 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
			if v750.Name == "Meatball" then
				table.insert(v749, v750)
			end
		end
		if p748 then
			for _, v751 in v749 do
				if not p748:FindFirstChild(v751.Name) then
					local v752 = v751:Clone()
					v752.Parent = p748
					v752.Enabled = true
					v752:AddTag("Cleanup_Meatball")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p753, p754)
		local function v757(p755)
			for _, v756 in p755:GetDescendants() do
				if v756:HasTag("Cleanup_Meatball") then
					v756:Destroy()
				end
			end
		end
		if p754 then
			v757(p754)
		end
		if p753 then
			v757(p753)
		end
	end
}
v_u_518.Spaghetti = {
	["Id"] = "SP",
	["Name"] = "Spaghetti",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(255, 140, 70),
	["_AddFX"] = function(p758, p759, p760)
		p758:_RemoveFX(p759, p760)
		local v761 = game.ServerStorage.Mutation_FX.Spaghetti:GetChildren()
		if p760 then
			for _, v762 in v761 do
				if not p760:FindFirstChild(v762.Name) then
					local v763 = v762:Clone()
					v763.Parent = p760
					v763.Enabled = true
					v763:AddTag("Cleanup_Spaghetti")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p764, p765)
		local function v768(p766)
			for _, v767 in p766:GetDescendants() do
				if v767:HasTag("Cleanup_Spaghetti") then
					v767:Destroy()
				end
			end
		end
		if p765 then
			v768(p765)
		end
		if p764 then
			v768(p764)
		end
	end
}
v_u_518.Eclipsed = {
	["Id"] = "EC",
	["Name"] = "Eclipsed",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(44, 111, 162),
	["_AddFX"] = function(p769, p770, p771)
		-- upvalues: (copy) v_u_13
		p769:_RemoveFX(p770, p771)
		if p771 then
			for _, v772 in game.ServerStorage.Mutation_FX.Eclipsed:GetChildren() do
				local v773 = v772:Clone()
				v773.Parent = p771
				v773.Enabled = true
				v773:AddTag("Cleanup_Eclipsed")
			end
		end
		for _, v774 in p770:GetDescendants() do
			if (v774:IsA("BasePart") or v774:IsA("UnionOperation")) and (not v774:HasTag("Effect") and (not v774.Transparency or v774.Transparency ~= 1)) then
				v_u_13[v774] = v_u_13[v774] or v774.Color
				v774.Color = v774.Color:Lerp(Color3.fromRGB(0, 0, 0), 0.45)
				v774:AddTag("EclipsedVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p775, p776)
		-- upvalues: (copy) v_u_13
		if p776 then
			for _, v777 in p776:GetChildren() do
				if v777:HasTag("Cleanup_Eclipsed") then
					v777:Destroy()
				end
			end
		end
		for _, v778 in p775:GetDescendants() do
			if (v778:IsA("BasePart") or v778:IsA("UnionOperation")) and v778:HasTag("EclipsedVisual") then
				v778.Color = v_u_13[v778] or v778.Color
				v_u_13[v778] = nil
				v778:RemoveTag("EclipsedVisual")
			end
		end
	end
}
v_u_518.Enlightened = {
	["Id"] = "EN",
	["Name"] = "Enlightened",
	["ValueMulti"] = 35,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p779, p780, p781)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p779:_RemoveFX(p780, p781)
		local v782 = Color3.fromRGB(218, 133, 65)
		local v783 = {}
		for _, v784 in p780:GetDescendants() do
			if (v784:IsA("BasePart") or v784:IsA("UnionOperation")) and not v784:HasTag("Effect") then
				local v785 = v784.Color
				v783[v785] = (v783[v785] or 0) + 1
			end
		end
		local v786 = 0
		for v787, v788 in pairs(v783) do
			if v786 <= v788 then
				v782 = v787
				v786 = v788
			end
		end
		for _, v789 in p780:GetDescendants() do
			if (v789:IsA("BasePart") or v789:IsA("UnionOperation")) and (not v789:HasTag("Effect") and (not v789.Transparency or v789.Transparency ~= 1) and v789.Color == v782) then
				v_u_13[v789] = v_u_13[v789] or v789.Color
				v789.Color = Color3.fromRGB(218, 133, 65)
				v_u_16[v789] = v_u_16[v789] or v789.Material
				v789.Material = Enum.Material.Neon
				v789:AddTag("EnlightenedVisual")
			end
		end
		if p781 then
			for _, v790 in game.ServerStorage.Mutation_FX.Enlightened:GetChildren() do
				local v791 = v790:Clone()
				v791.Parent = p781
				v791.Enabled = true
				v791:AddTag("Cleanup_Enlightened")
			end
		end
	end,
	["_RemoveFX"] = function(_, p792, p793)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v796(p794)
			for _, v795 in p794:GetDescendants() do
				if v795:HasTag("Cleanup_Enlightened") then
					v795:Destroy()
				end
			end
		end
		if p793 then
			v796(p793)
		end
		if p792 then
			v796(p792)
		end
		for _, v797 in p792:GetDescendants() do
			if (v797:IsA("BasePart") or v797:IsA("UnionOperation")) and v797:HasTag("EnlightenedVisual") then
				v797.Color = v_u_13[v797] or v797.Color
				v_u_13[v797] = nil
				v797:RemoveTag("EnlightenedVisual")
				if v_u_16[v797] then
					v797.Material = v_u_16[v797]
					v_u_16[v797] = nil
				end
			end
		end
	end
}
v_u_518.Tranquil = {
	["Id"] = "TQ",
	["Name"] = "Tranquil",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p798, p799, p800)
		p798:_RemoveFX(p799, p800)
		local v801 = p799:FindFirstChild("Item_Seed")
		local v802 = not (v801 and v801:IsA("NumberValue")) and 0 or v801.Value
		local v803 = Random.new(v802)
		local v804 = game.ServerStorage.Mutation_FX.Tranquil:GetChildren()
		local v805 = 0
		for _, v806 in p799:GetDescendants() do
			if (v806:IsA("BasePart") or v806:IsA("UnionOperation")) and not v806:HasTag("Effect") then
				v805 = v805 + 1
				if v805 % 5 == 0 or v805 == 1 then
					local v807 = v804[v803:NextInteger(1, #v804)]:Clone()
					v807.Enabled = true
					v807.Rate = v803:NextInteger(30, 50) * 0.01
					v807.Parent = v806
					v807:AddTag("Cleanup_Tranquil")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p808, p809)
		local function v812(p810)
			for _, v811 in p810:GetDescendants() do
				if v811:HasTag("Cleanup_Tranquil") then
					v811:Destroy()
				end
			end
		end
		if p809 then
			v812(p809)
		end
		if p808 then
			v812(p808)
		end
	end
}
v_u_518.Corrupt = {
	["Id"] = "CR",
	["Name"] = "Corrupt",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(176, 23, 26),
	["_AddFX"] = function(p813, p814, p815)
		-- upvalues: (copy) v_u_13
		p813:_RemoveFX(p814, p815)
		if p815 then
			for _, v816 in game.ServerStorage.Mutation_FX.Corrupt:GetChildren() do
				local v817 = v816:Clone()
				v817.Parent = p815
				v817:AddTag("Cleanup_Infected")
				if v817:IsA("ParticleEmitter") then
					v817.Enabled = true
				end
			end
		end
		for _, v818 in p814:GetDescendants() do
			if (v818:IsA("BasePart") or v818:IsA("UnionOperation")) and (not v818:HasTag("Effect") and (not v818.Transparency or v818.Transparency ~= 1)) then
				v_u_13[v818] = v_u_13[v818] or v818.Color
				v818.Color = v818.Color:Lerp(Color3.fromRGB(176, 23, 26), 0.5)
				v818:AddTag("CorruptVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p819, p820)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v823(p821)
			for _, v822 in p821:GetDescendants() do
				if v822:HasTag("Cleanup_Corrupt") then
					v822:Destroy()
				end
			end
		end
		if p820 then
			v823(p820)
		end
		for _, v824 in p819:GetDescendants() do
			if (v824:IsA("BasePart") or v824:IsA("UnionOperation")) and v824:HasTag("CorruptVisual") then
				v824.Color = v_u_13[v824] or v824.Color
				v_u_13[v824] = nil
				v824:RemoveTag("CorruptVisual")
				if v_u_16[v824] then
					v824.Material = v_u_16[v824]
					v_u_16[v824] = nil
				end
			end
		end
	end
}
v_u_518.Toxic = {
	["Id"] = "TX",
	["Name"] = "Toxic",
	["ValueMulti"] = 12,
	["Color"] = Color3.fromRGB(85, 255, 0),
	["_AddFX"] = function(p825, p826, p827)
		p825:_RemoveFX(p826, p827)
		if p827 then
			for _, v828 in game.ServerStorage.Mutation_FX.Toxic:GetChildren() do
				local v829 = v828:Clone()
				v829.Parent = p827
				v829.Enabled = true
				v829:AddTag("Cleanup_Toxic")
			end
		end
	end,
	["_RemoveFX"] = function(_, p830, p831)
		local function v834(p832)
			for _, v833 in p832:GetDescendants() do
				if v833:HasTag("Cleanup_Toxic") then
					v833:Destroy()
				end
			end
		end
		if p831 then
			v834(p831)
		end
		if p830 then
			v834(p830)
		end
	end
}
v_u_518.Acidic = {
	["Id"] = "AC",
	["Name"] = "Acidic",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(224, 245, 129),
	["_AddFX"] = function(p835, p836, p837)
		p835:_RemoveFX(p836, p837)
		if p837 then
			for _, v838 in game.ServerStorage.Mutation_FX.Acidic:GetChildren() do
				local v839 = v838:Clone()
				v839.Parent = p837
				v839.Enabled = true
				v839:AddTag("Cleanup_Acidic")
			end
		end
	end,
	["_RemoveFX"] = function(_, p840, p841)
		local function v844(p842)
			for _, v843 in p842:GetDescendants() do
				if v843:HasTag("Cleanup_Acidic") then
					v843:Destroy()
				end
			end
		end
		if p841 then
			v844(p841)
		end
		if p840 then
			v844(p840)
		end
	end
}
v_u_518.Oil = {
	["Id"] = "OL",
	["Name"] = "Oil",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(52, 52, 77),
	["_AddFX"] = function(p845, p846, p847)
		p845:_RemoveFX(p846, p847)
		if p847 then
			for _, v848 in game.ServerStorage.Mutation_FX.Oil:GetChildren() do
				local v849 = v848:Clone()
				v849.Parent = p847
				v849.Enabled = true
				v849:AddTag("Cleanup_Oil")
				v849:AddTag("Effect")
			end
		end
		for _, v850 in p846:GetDescendants() do
			if (v850:IsA("BasePart") or v850:IsA("UnionOperation")) and not v850:HasTag("Effect") then
				v850:AddTag("OilVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p851, p852)
		-- upvalues: (copy) v_u_16
		if p852 then
			for _, v853 in p852:GetChildren() do
				if v853:HasTag("Cleanup_Oil") then
					v853:Destroy()
				end
			end
		end
		for _, v854 in p851:GetDescendants() do
			if (v854:IsA("BasePart") or v854:IsA("UnionOperation")) and v854:HasTag("OilVisual") then
				v854:RemoveTag("OilVisual")
				local v855 = v_u_16[v854]
				if v855 then
					v854.Material = v855
					v_u_16[v854] = nil
				end
			end
		end
	end
}
v_u_518.Boil = {
	["Id"] = "BOL",
	["Name"] = "Boil",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(150, 178, 225),
	["_AddFX"] = function(p856, p857, p858)
		p856:_RemoveFX(p857, p858)
		if p858 then
			for _, v859 in game.ServerStorage.Mutation_FX.Boil:GetChildren() do
				local v860 = v859:Clone()
				v860.Parent = p858
				v860.Enabled = true
				v860:AddTag("Cleanup_Boil")
				v860:AddTag("Effect")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p861)
		if p861 then
			for _, v862 in p861:GetChildren() do
				if v862:HasTag("Cleanup_Boil") then
					v862:Destroy()
				end
			end
		end
	end
}
v_u_518.Fortune = {
	["Id"] = "FR",
	["Name"] = "Fortune",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(255, 192, 5),
	["_AddFX"] = function(p863, p864, p865)
		p863:_RemoveFX(p864, p865)
		if p865 then
			for _, v866 in game.ServerStorage.Mutation_FX.Fortune:GetChildren() do
				local v867 = v866:Clone()
				v867.Parent = p865
				v867.Enabled = true
				v867:AddTag("Cleanup_Fortune")
				v867:AddTag("Effect")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p868)
		if p868 then
			for _, v869 in p868:GetChildren() do
				if v869:HasTag("Cleanup_Fortune") then
					v869:Destroy()
				end
			end
		end
	end
}
v_u_518.Bloom = {
	["Id"] = "BL",
	["Name"] = "Bloom",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(170, 255, 0),
	["_AddFX"] = function(p870, p871, p872)
		p870:_RemoveFX(p871, p872)
		local v873 = game.ServerStorage.Mutation_FX.Bloom:GetChildren()
		if p872 then
			for _, v874 in v873 do
				if not p872:FindFirstChild(v874.Name) then
					local v875 = v874:Clone()
					v875.Parent = p872
					v875.Enabled = true
					v875:AddTag("Cleanup_Bloom")
					v875:AddTag("Effect")
				end
			end
		end
		local v876 = {}
		for _, v877 in p871:GetDescendants() do
			if v877:IsA("BasePart") and v877 ~= p872 then
				table.insert(v876, v877)
			end
		end
		(function(p878)
			for v879 = #p878, 2, -1 do
				local v880 = math.random(1, v879)
				local v881 = p878[v880]
				local v882 = p878[v879]
				p878[v879] = v881
				p878[v880] = v882
			end
			return p878
		end)(v876)
		local v883 = #v876 * 0.25 + 0.5
		for v884 = 1, math.floor(v883) do
			local v885 = v876[v884]
			local v886 = v873[math.random(1, #v873)]:Clone()
			v886.Parent = v885
			v886.Enabled = true
			v886:AddTag("Cleanup_Bloom")
			v886:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p887, p888)
		local function v891(p889)
			for _, v890 in p889:GetDescendants() do
				if v890:HasTag("Cleanup_Bloom") then
					v890:Destroy()
				end
			end
		end
		if p888 then
			v891(p888)
		end
		if p887 then
			v891(p887)
		end
	end
}
v_u_518.Rot = {
	["Id"] = "RO",
	["Name"] = "Rot",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(85, 0, 127),
	["_AddFX"] = function(p892, p893, p894)
		p892:_RemoveFX(p893, p894)
		local v895 = game.ServerStorage.Mutation_FX.Rot:GetChildren()
		if p894 then
			for _, v896 in v895 do
				if not p894:FindFirstChild(v896.Name) then
					local v897 = v896:Clone()
					v897.Parent = p894
					v897.Enabled = true
					v897:AddTag("Cleanup_Rot")
					v897:AddTag("Effect")
				end
			end
		end
		local v898 = {}
		for _, v899 in p893:GetDescendants() do
			if v899:IsA("BasePart") and v899 ~= p894 then
				table.insert(v898, v899)
			end
		end
		(function(p900)
			for v901 = #p900, 2, -1 do
				local v902 = math.random(1, v901)
				local v903 = p900[v902]
				local v904 = p900[v901]
				p900[v901] = v903
				p900[v902] = v904
			end
			return p900
		end)(v898)
		local v905 = #v898 * 0.25 + 0.5
		for v906 = 1, math.floor(v905) do
			local v907 = v898[v906]
			local v908 = v895[math.random(1, #v895)]:Clone()
			v908.Parent = v907
			v908.Enabled = true
			v908:AddTag("Cleanup_Rot")
			v908:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p909, p910)
		local function v913(p911)
			for _, v912 in p911:GetDescendants() do
				if v912:HasTag("Cleanup_Rot") then
					v912:Destroy()
				end
			end
		end
		if p910 then
			v913(p910)
		end
		if p909 then
			v913(p909)
		end
	end
}
v_u_518.Gloom = {
	["Id"] = "GL",
	["Name"] = "Gloom",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(85, 85, 127),
	["_AddFX"] = function(p914, p915, p916)
		p914:_RemoveFX(p915, p916)
		local v917 = game.ServerStorage.Mutation_FX.Gloom:GetChildren()
		if p916 then
			for _, v918 in v917 do
				if not p916:FindFirstChild(v918.Name) then
					local v919 = v918:Clone()
					v919.Parent = p916
					v919.Enabled = true
					v919:AddTag("Cleanup_Gloom")
					v919:AddTag("Effect")
				end
			end
		end
		local v920 = {}
		for _, v921 in p915:GetDescendants() do
			if v921:IsA("BasePart") and v921 ~= p916 then
				table.insert(v920, v921)
			end
		end
		(function(p922)
			for v923 = #p922, 2, -1 do
				local v924 = math.random(1, v923)
				local v925 = p922[v924]
				local v926 = p922[v923]
				p922[v923] = v925
				p922[v924] = v926
			end
			return p922
		end)(v920)
		local v927 = #v920 * 0.25 + 0.5
		for v928 = 1, math.floor(v927) do
			local v929 = v920[v928]
			local v930 = v917[math.random(1, #v917)]:Clone()
			v930.Parent = v929
			v930.Enabled = true
			v930:AddTag("Cleanup_Gloom")
			v930:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p931, p932)
		local function v935(p933)
			for _, v934 in p933:GetDescendants() do
				if v934:HasTag("Cleanup_Gloom") then
					v934:Destroy()
				end
			end
		end
		if p932 then
			v935(p932)
		end
		if p931 then
			v935(p931)
		end
	end
}
v_u_518.Cyclonic = {
	["Id"] = "CY",
	["Name"] = "Cyclonic",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(130, 230, 255),
	["_AddFX"] = function(p936, p937, p938)
		p936:_RemoveFX(p937, p938)
		local v939 = game.ServerStorage.Mutation_FX.Cyclonic:GetChildren()
		if p938 then
			for _, v940 in v939 do
				if not p938:FindFirstChild(v940.Name) then
					local v941 = v940:Clone()
					v941.Parent = p938
					v941.Enabled = true
					v941:AddTag("Cleanup_Cyclonic")
				end
			end
		end
		local v942 = 0
		for _, v943 in p937:GetDescendants() do
			if v943:IsA("BasePart") and v943 ~= p938 then
				v942 = v942 + 1
				if v942 % 2 == 0 then
					local v944 = v939[math.random(1, #v939)]:Clone()
					v944.Parent = v943
					v944.Enabled = true
					v944:AddTag("Cleanup_Cyclonic")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p945, p946)
		local function v949(p947)
			for _, v948 in p947:GetDescendants() do
				if v948:HasTag("Cleanup_Cyclonic") then
					v948:Destroy()
				end
			end
		end
		if p946 then
			v949(p946)
		end
		if p945 then
			v949(p945)
		end
	end
}
v_u_518.Maelstrom = {
	["Id"] = "MS",
	["Name"] = "Maelstrom",
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(0, 60, 255),
	["_AddFX"] = function(p950, p951, p952)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		p950:_RemoveFX(p951, p952)
		local v953 = game.ServerStorage.Mutation_FX.Maelstrom:GetChildren()
		local v954 = {
			["Stars1"] = true
		}
		if p952 then
			for _, v955 in v953 do
				if not p952:FindFirstChild(v955.Name) then
					local v956 = v955:Clone()
					v956.Parent = p952
					v956.Enabled = true
					v956:AddTag("Cleanup_Maelstrom")
				end
			end
		end
		local v957 = {}
		for _, v958 in p951:GetDescendants() do
			if v958:IsA("BasePart") and v958 ~= p952 then
				table.insert(v957, v958)
				for _, v959 in v953 do
					if v954[v959.Name] then
						local v960 = v959:Clone()
						v960.Parent = v958
						v960.Enabled = true
						v960:AddTag("Cleanup_Maelstrom")
					end
				end
			end
		end
		for _, v961 in v957 do
			if Random.new():NextNumber() < 0.5 then
				v_u_13[v961] = v_u_13[v961] or v961.Color
				v_u_16[v961] = v_u_16[v961] or v961.Material
				v961.Color = Color3.fromRGB(0, 186, 186)
				v961.Material = Enum.Material.Neon
				v961:AddTag("MaelstromVisual")
			end
		end
		local v962 = {}
		for _, v963 in v953 do
			if not v954[v963.Name] then
				table.insert(v962, v963)
			end
		end
		for v964, v965 in v957 do
			if v964 % 2 == 0 and #v962 > 0 then
				local v966 = v962[math.random(1, #v962)]:Clone()
				v966.Parent = v965
				v966.Enabled = true
				v966:AddTag("Cleanup_Maelstrom")
			end
		end
	end,
	["_RemoveFX"] = function(_, p967, p968)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v971(p969)
			-- upvalues: (ref) v_u_13, (ref) v_u_16
			for _, v970 in p969:GetDescendants() do
				if v970:HasTag("Cleanup_Maelstrom") then
					v970:Destroy()
				end
				if v970:HasTag("MaelstromVisual") then
					v970.Color = v_u_13[v970] or v970.Color
					v_u_13[v970] = nil
					if v_u_16[v970] then
						v970.Material = v_u_16[v970]
						v_u_16[v970] = nil
					end
					v970:RemoveTag("MaelstromVisual")
				end
			end
		end
		if p968 then
			v971(p968)
		end
		if p967 then
			v971(p967)
		end
	end
}
v_u_518.Jackpot = {
	["Id"] = "JA",
	["Name"] = "Jackpot",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(132, 245, 112),
	["_AddFX"] = function(p972, p973, p974)
		p972:_RemoveFX(p973, p974)
		if p974 then
			for _, v975 in game.ServerStorage.Mutation_FX.Jackpot:GetChildren() do
				local v976 = v975:Clone()
				v976.Parent = p974
				v976:AddTag("Cleanup_Jackpot")
				if v976:IsA("ParticleEmitter") then
					v976.Enabled = true
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p977)
		local function v980(p978)
			for _, v979 in p978:GetDescendants() do
				if v979:HasTag("Cleanup_Jackpot") then
					v979:Destroy()
				end
			end
		end
		if p977 then
			v980(p977)
		end
	end
}
v_u_518.Blitzshock = {
	["Id"] = "BS",
	["Name"] = "Blitzshock",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(0, 192, 245),
	["_AddFX"] = function(p981, p982, p983)
		-- upvalues: (copy) v_u_16, (copy) v_u_13
		p981:_RemoveFX(p982, p983)
		if p983 then
			for _, v984 in game.ServerStorage.Mutation_FX.Blitzshock:GetChildren() do
				local v985 = v984:Clone()
				v985.Parent = p983
				v985:AddTag("Cleanup_Blitzshock")
				if v985:IsA("ParticleEmitter") then
					v985.Enabled = true
				end
			end
		end
		for _, v986 in p982:GetDescendants() do
			if (v986:IsA("BasePart") or v986:IsA("UnionOperation")) and (not v986:HasTag("Effect") and (not v986.Transparency or v986.Transparency ~= 1)) then
				v_u_16[v986] = v_u_16[v986] or v986.Material
				v986.Material = Enum.Material.Neon
				v_u_13[v986] = v_u_13[v986] or v986.Color
				v986.Color = v986.Color:Lerp(Color3.fromRGB(0, 170, 255), 0.5)
				v986:AddTag("BlitzshockVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p987, p988)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v991(p989)
			for _, v990 in p989:GetDescendants() do
				if v990:HasTag("Cleanup_Blitzshock") then
					v990:Destroy()
				end
			end
		end
		if p988 then
			v991(p988)
		end
		if p987 then
			v991(p987)
		end
		for _, v992 in p987:GetDescendants() do
			if (v992:IsA("BasePart") or v992:IsA("UnionOperation")) and v992:HasTag("BlitzshockVisual") then
				v992.Color = v_u_13[v992] or v992.Color
				v_u_13[v992] = nil
				v992:RemoveTag("BlitzshockVisual")
				if v_u_16[v992] then
					v992.Material = v_u_16[v992]
					v_u_16[v992] = nil
				end
			end
		end
	end
}
v_u_518.Junkshock = {
	["Id"] = "JS",
	["Name"] = "Junkshock",
	["ValueMulti"] = 45,
	["Color"] = Color3.fromRGB(147, 247, 0),
	["_AddFX"] = function(p993, p994, p995)
		-- upvalues: (copy) v_u_16, (copy) v_u_13
		p993:_RemoveFX(p994, p995)
		if p995 then
			for _, v996 in game.ServerStorage.Mutation_FX.Junkshock:GetChildren() do
				local v997 = v996:Clone()
				v997.Parent = p995
				v997:AddTag("Cleanup_Junkshock")
				if v997:IsA("ParticleEmitter") then
					v997.Enabled = true
				end
			end
		end
		for _, v998 in p994:GetDescendants() do
			if (v998:IsA("BasePart") or v998:IsA("UnionOperation")) and (not v998:HasTag("Effect") and (not v998.Transparency or v998.Transparency ~= 1)) then
				v_u_16[v998] = v_u_16[v998] or v998.Material
				v998.Material = Enum.Material.Neon
				v_u_13[v998] = v_u_13[v998] or v998.Color
				v998.Color = v998.Color:Lerp(Color3.fromRGB(0, 255, 36), 0.5)
				v998:AddTag("JunkshockVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p999, p1000)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v1003(p1001)
			for _, v1002 in p1001:GetDescendants() do
				if v1002:HasTag("Cleanup_Junkshock") then
					v1002:Destroy()
				end
			end
		end
		if p1000 then
			v1003(p1000)
		end
		if p999 then
			v1003(p999)
		end
		for _, v1004 in p999:GetDescendants() do
			if (v1004:IsA("BasePart") or v1004:IsA("UnionOperation")) and v1004:HasTag("JunkshockVisual") then
				v1004.Color = v_u_13[v1004] or v1004.Color
				v_u_13[v1004] = nil
				v1004:RemoveTag("JunkshockVisual")
				if v_u_16[v1004] then
					v1004.Material = v_u_16[v1004]
					v_u_16[v1004] = nil
				end
			end
		end
	end
}
v_u_518.Touchdown = {
	["Id"] = "TD",
	["Name"] = "Touchdown",
	["ValueMulti"] = 105,
	["Color"] = Color3.fromRGB(203, 95, 0),
	["_AddFX"] = function(p1005, p1006, p1007)
		p1005:_RemoveFX(p1006, p1007)
		if p1007 then
			for _, v1008 in game.ServerStorage.Mutation_FX.Touchdown:GetChildren() do
				local v1009 = v1008:Clone()
				v1009.Parent = p1007
				v1009.Enabled = true
				v1009:AddTag("Cleanup_Touchdown")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1010, p1011)
		local function v1014(p1012)
			for _, v1013 in p1012:GetDescendants() do
				if v1013:HasTag("Cleanup_Touchdown") then
					v1013:Destroy()
				end
			end
		end
		if p1011 then
			v1014(p1011)
		end
		if p1010 then
			v1014(p1010)
		end
	end
}
v_u_518.Subzero = {
	["Id"] = "SZ",
	["Name"] = "Subzero",
	["ValueMulti"] = 40,
	["Color"] = Color3.fromRGB(0, 255, 255),
	["_AddFX"] = function(p1015, p1016, p1017)
		-- upvalues: (copy) v_u_96, (copy) v_u_16, (copy) v_u_17, (copy) v_u_13
		p1015:_RemoveFX(p1016, p1017)
		v_u_96(p1015, p1016, p1017, 0.4)
		if p1017 then
			for _, v1018 in game.ServerStorage.Mutation_FX.Subzero:GetChildren() do
				local v1019 = v1018:Clone()
				v1019.Parent = p1017
				v1019:AddTag("Cleanup_Subzero")
				if v1019:IsA("ParticleEmitter") then
					v1019.Enabled = true
				end
			end
		end
		for _, v1020 in p1016:GetChildren() do
			if v1020:IsA("BasePart") or v1020:IsA("UnionOperation") then
				v1020.Reflectance = 0.35
			end
		end
		for _, v1021 in p1016:GetDescendants() do
			if (v1021:IsA("BasePart") or v1021:IsA("UnionOperation")) and (not v1021:HasTag("Effect") and (not v1021.Transparency or v1021.Transparency ~= 1)) then
				v_u_16[v1021] = v_u_16[v1021] or v1021.Material
				v1021.Material = Enum.Material.Plastic
				v_u_17[v1021] = v_u_17[v1021] or v1021.MaterialVariant
				v1021.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_13[v1021] = v_u_13[v1021] or v1021.Color
				v1021.Color = v1021.Color:Lerp(Color3.fromRGB(0, 255, 255), 0.5)
				v1021:AddTag("SubzeroVisual")
			end
		end
	end,
	["_RemoveFX"] = function(p1022, p1023, p1024)
		-- upvalues: (copy) v_u_105, (copy) v_u_13, (copy) v_u_17, (copy) v_u_16
		v_u_105(p1022, p1023, p1024)
		local function v1027(p1025)
			for _, v1026 in p1025:GetDescendants() do
				if v1026:HasTag("Cleanup_Subzero") then
					v1026:Destroy()
				end
			end
		end
		if p1024 then
			v1027(p1024)
		end
		if p1023 then
			v1027(p1023)
		end
		for _, v1028 in p1023:GetDescendants() do
			if v1028:IsA("BasePart") or v1028:IsA("UnionOperation") then
				v1028.Reflectance = 0
				if v1028:HasTag("SubzeroVisual") then
					v1028.Color = v_u_13[v1028] or v1028.Color
					v_u_13[v1028] = nil
					v1028:RemoveTag("SubzeroVisual")
					v1028.MaterialVariant = v_u_17[v1028] or v1028.MaterialVariant
					v_u_17[v1028] = nil
					if v_u_16[v1028] then
						v1028.Material = v_u_16[v1028]
						v_u_16[v1028] = nil
					end
				end
			end
		end
	end
}
v_u_518.Lightcycle = {
	["Id"] = "lc",
	["Name"] = "Lightcycle",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p1029, p1030, p1031)
		-- upvalues: (copy) v_u_13
		p1029:_RemoveFX(p1030, p1031)
		p1030:AddTag("Lightcycle_Mutation")
		for _, v1032 in p1030:GetDescendants() do
			if (v1032:IsA("BasePart") or v1032:IsA("UnionOperation")) and not v1032:HasTag("Effect") then
				local _ = v1032.Color
				v_u_13[v1032] = v_u_13[v1032] or v1032.Color
				v1032:AddTag("StoplightVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1033, _)
		-- upvalues: (copy) v_u_13
		p1033:RemoveTag("Lightcycle_Mutation")
		for _, v1034 in p1033:GetDescendants() do
			if (v1034:IsA("BasePart") or v1034:IsA("UnionOperation")) and v1034:HasTag("StoplightVisual") then
				local v1035 = v_u_13[v1034]
				if v1035 then
					v1034.Color = v1035
				end
				v1034:RemoveTag("StoplightVisual")
			end
		end
	end
}
v_u_518.Brainrot = {
	["Id"] = "lca",
	["Name"] = "Brainrot",
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(255, 108, 110),
	["_AddFX"] = function(p1036, p1037, p1038)
		p1036:_RemoveFX(p1037, p1038)
		if p1038 then
			for _, v1039 in game.ServerStorage.Mutation_FX.Brainrot:GetChildren() do
				local v1040 = v1039:Clone()
				v1040.Parent = p1038
				v1040.Enabled = true
				v1040:AddTag("Cleanup_Brainrot")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1041, p1042)
		local function v1045(p1043)
			for _, v1044 in p1043:GetDescendants() do
				if v1044:HasTag("Cleanup_Brainrot") then
					v1044:Destroy()
				end
			end
		end
		if p1042 then
			v1045(p1042)
		end
		if p1041 then
			v1045(p1041)
		end
	end
}
v_u_518.Warped = {
	["Id"] = "wpa",
	["Name"] = "Warped",
	["ValueMulti"] = 75,
	["Color"] = Color3.fromRGB(192, 52, 255),
	["_AddFX"] = function(p1046, p1047, p1048)
		p1046:_RemoveFX(p1047, p1048)
		if p1048 then
			for _, v1049 in game.ServerStorage.Mutation_FX.Warped:GetChildren() do
				local v1050 = v1049:Clone()
				v1050.Parent = p1048
				v1050.Enabled = true
				v1050:AddTag("Cleanup_Warped")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1051, p1052)
		local function v1055(p1053)
			for _, v1054 in p1053:GetDescendants() do
				if v1054:HasTag("Cleanup_Warped") then
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
	end
}
v_u_518.Aromatic = {
	["Id"] = "ar",
	["Name"] = "Aromatic",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(162, 145, 57),
	["_AddFX"] = function(p1056, p1057, p1058)
		-- upvalues: (copy) v_u_13
		p1056:_RemoveFX(p1057, p1058)
		if p1058 then
			for _, v1059 in game.ServerStorage.Mutation_FX.Aromatic:GetChildren() do
				local v1060 = v1059:Clone()
				v1060.Parent = p1058
				v1060:AddTag("Cleanup_Aromatic")
				if v1060:IsA("ParticleEmitter") then
					v1060.Enabled = true
				end
			end
		end
		for _, v1061 in p1057:GetDescendants() do
			if (v1061:IsA("BasePart") or v1061:IsA("UnionOperation")) and (not v1061:HasTag("Effect") and (not v1061.Transparency or v1061.Transparency ~= 1)) then
				v_u_13[v1061] = v_u_13[v1061] or v1061.Color
				v1061.Color = v1061.Color:Lerp(Color3.fromRGB(162, 145, 57), 0.3)
				v1061:AddTag("AromaticVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1062, p1063)
		-- upvalues: (copy) v_u_13, (copy) v_u_16
		local function v1066(p1064)
			for _, v1065 in p1064:GetDescendants() do
				if v1065:HasTag("Cleanup_Aromatic") then
					v1065:Destroy()
				end
			end
		end
		if p1063 then
			v1066(p1063)
		end
		if p1062 then
			v1066(p1062)
		end
		for _, v1067 in p1062:GetDescendants() do
			if (v1067:IsA("BasePart") or v1067:IsA("UnionOperation")) and v1067:HasTag("AromaticVisual") then
				v1067.Color = v_u_13[v1067] or v1067.Color
				v_u_13[v1067] = nil
				v1067:RemoveTag("AromaticVisual")
				if v_u_16[v1067] then
					v1067.Material = v_u_16[v1067]
					v_u_16[v1067] = nil
				end
			end
		end
	end
}
v_u_518.Gnomed = {
	["Id"] = "gn",
	["Name"] = "Gnomed",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(0, 173, 239),
	["_AddFX"] = function(p1068, p1069, p1070)
		p1068:_RemoveFX(p1069, p1070)
		if p1070 then
			for _, v1071 in game.ServerStorage.Mutation_FX.Gnomed:GetChildren() do
				local v1072 = v1071:Clone()
				v1072.Parent = p1070
				v1072.Enabled = true
				v1072:AddTag("Cleanup_Gnomed")
			end
		end
		for _, v1073 in p1069:GetChildren() do
			if v1073:IsA("BasePart") or v1073:IsA("UnionOperation") then
				v1073.Reflectance = 0.1
			end
		end
	end,
	["_RemoveFX"] = function(_, p1074, p1075)
		if p1075 then
			for _, v1076 in p1075:GetChildren() do
				if v1076:HasTag("Cleanup_Gnomed") then
					v1076:Destroy()
				end
			end
		end
		for _, v1077 in p1074:GetChildren() do
			if v1077:IsA("BasePart") or v1077:IsA("UnionOperation") then
				v1077.Reflectance = 0
			end
		end
	end
}
local v_u_1078 = {}
local v_u_1079 = {}
for v1080, v1081 in v_u_518 do
	v_u_1078[v1080] = v1081.Id
end
for v1082, v1083 in v_u_518 do
	if v_u_1079[v1083.Id] then
		error((("MutationHandler | Duplicate Enum for %* and %*"):format(v1082, v_u_1079[v1083.Id])))
	end
	v_u_1079[v1083.Id] = v1082
end
table.freeze(v_u_1078)
table.freeze(v_u_1079)
function v_u_11.GetMutationsToEnums(_)
	-- upvalues: (copy) v_u_1078
	return v_u_1078
end
function v_u_11.GetEnumsToMutations(_)
	-- upvalues: (copy) v_u_1079
	return v_u_1079
end
function v_u_11.GetMutations(_)
	-- upvalues: (copy) v_u_6, (copy) v_u_518
	return v_u_6:DeepCopy(v_u_518)
end
function v_u_11.AddMutation(_, p1084, p1085)
	if p1084 then
		p1084:SetAttribute(p1085.Name, true)
	else
		warn("MutationHandler:AddMutation | No plant")
	end
end
function v_u_11.RemoveMutation(_, p1086, p1087)
	if p1086 then
		p1086:SetAttribute(p1087.Name, nil)
	else
		warn("MutationHandler:RemoveMutation | No plant")
	end
end
function v_u_11.GetPlantMutations(_, p1088)
	-- upvalues: (copy) v_u_518
	local v1089 = {}
	for _, v1090 in v_u_518 do
		if p1088:GetAttribute(v1090.Name) then
			table.insert(v1089, v1090)
		end
	end
	return v1089
end
function v_u_11.GetPlantMutationsAsEnums(_, p1091)
	-- upvalues: (copy) v_u_11
	local v1092 = {}
	for _, v1093 in v_u_11:GetPlantMutations(p1091) do
		local v1094 = v1093.Id
		table.insert(v1092, v1094)
	end
	return v1092
end
function v_u_11.GetMutationsAsString(_, p1095, p1096)
	-- upvalues: (copy) v_u_518
	local v1097 = ""
	for _, v1098 in v_u_518 do
		local v1099 = v1098.Name
		if p1095:GetAttribute(v1099) then
			if v1097 ~= "" then
				v1097 = v1097 .. ", "
			end
			v1097 = v1097 .. v1099
		end
	end
	if v1097 ~= "" and p1096 then
		v1097 = "[" .. v1097 .. "]"
	end
	return v1097
end
function v_u_11.ExtractMutationsFromEnumArray(_, p1100)
	-- upvalues: (copy) v_u_1079, (copy) v_u_518
	local v1101 = {}
	for _, v1102 in p1100 do
		local v1103 = v_u_1079[v1102]
		if v1103 then
			local v1104 = v_u_518[v1103]
			table.insert(v1101, v1104)
		else
			warn((("MutationHandler:ExtractMutationsFromEnumArray | Mutation does not exist for %*"):format(v1102)))
		end
	end
	return v1101
end
function v_u_11.ExtractMutationsFromString(_, p1105)
	-- upvalues: (copy) v_u_11
	local v1106 = {}
	if not p1105 or p1105 == "" then
		return v1106
	end
	local v1107 = p1105:gsub("%[", ""):gsub("%]", ""):gsub("%s+", "")
	for v1108 in string.gmatch(v1107, "([^,]+)") do
		local v1109 = false
		for _, v1110 in v_u_11:GetMutations() do
			if v1110.Name == v1108 then
				table.insert(v1106, v1110)
				v1109 = true
			end
		end
		if not v1109 then
			warn((("MutationHandler:ExtractMutationsFromString | Mutation name: %* does not exist"):format(v1108)))
		end
	end
	return v1106
end
function v_u_11.TransferMutations(_, p1111, p1112)
	-- upvalues: (copy) v_u_11
	for _, v1113 in v_u_11:GetMutations() do
		if p1111:GetAttribute(v1113.Name) then
			v_u_11:AddMutation(p1112, v1113)
			v_u_11:RemoveMutation(p1111, v1113)
		end
	end
	p1112:SetAttribute("WeightMulti", p1111:GetAttribute("WeightMulti") or 1)
end
function v_u_11.CalcValueMultiFromMuts(_, p1114)
	local v1115 = 1
	for _, v1116 in p1114 do
		v1115 = v1115 + (v1116.ValueMulti - 1)
	end
	return math.max(1, v1115)
end
function v_u_11.CalcValueMulti(_, p1117)
	-- upvalues: (copy) v_u_11
	return v_u_11:CalcValueMultiFromMuts((v_u_11:GetPlantMutations(p1117)))
end
function v_u_11.SetToolName(_, p_u_1118)
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_11
	if p_u_1118:IsA("Tool") then
		task.spawn(function()
			-- upvalues: (ref) v_u_2, (copy) p_u_1118, (ref) v_u_7, (ref) v_u_11
			local v1119 = game:GetService("ServerScriptService")
			local v1120 = require(v1119.Modules.InventoryService)
			local v1121 = require(v_u_2.Data.EnumRegistry.InventoryServiceEnums)
			local v1122
			if p_u_1118:FindFirstChild("Item_String") then
				v1122 = p_u_1118.Item_String.Value
			else
				v1122 = nil
			end
			local v1123, v1124
			if p_u_1118:GetAttribute(v1121.OWNER) then
				local v1125 = v1120:GetToolData(p_u_1118)
				v1122 = v1122 or v1125.ItemName
				v1123 = v1125.Variant or "Normal"
				v1124 = v1125.Seed
			else
				local v1126 = p_u_1118:WaitForChild("Variant", 0.3)
				if not v1126 then
					return
				end
				local v1127 = p_u_1118:WaitForChild("Item_Seed", 0.3)
				if not v1127 then
					return
				end
				v1123 = v1126.Value
				v1124 = v1127.Value
			end
			if v1123 and (v1124 and v1122) then
				local v1128 = v_u_7.Calculate_Weight(v1124, v1122) * (p_u_1118:GetAttribute("WeightMulti") or 1)
				local v1129 = v_u_11:GetMutationsAsString(p_u_1118)
				if v1123 and (v1123 ~= "" and v1123 ~= "Normal") then
					v1129 = v1129 .. (#v1129 > 0 and ", " or "") .. v1123
				end
				p_u_1118.Name = (v1129 == "" and "" or (("[%*] "):format(v1129) or "")) .. v1122 .. " [" .. string.format("%.2f", v1128) .. "kg]"
			end
		end)
	end
end
local v_u_1130 = {}
for _, v1131 in v_u_518 do
	v_u_1130[v1131.Name] = v1131.Name
end
v_u_11.MutationNames = v_u_1130
local v_u_1132 = {}
function v_u_11.CheckTimedPlants(_)
	-- upvalues: (copy) v_u_1132, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_518
	local v1133 = require(game.ServerStorage.Data_Module)
	local v1134 = workspace:GetServerTimeNow()
	for v1135, _ in v_u_1132 do
		local v1136 = v_u_8(v1135)
		if v1136 then
			local v1137 = v1133.GetFruitData(v1136, v1135)
			local v1138 = v_u_9.MutationTimes
			if not v1137 then
				v1137 = v1133.GetPlantData(v1136, v1135)
				v1138 = v_u_10.MutationTimes
			end
			if v1137 then
				if v1137[v1138] then
					local v1139 = 0
					for v1140, v1141 in v1137[v1138] do
						local v1142 = v_u_11:GetEnumsToMutations()[v1140]
						local v1143 = v_u_518[v1142]
						if v1143 then
							local v1144 = v1143.TimeData
							if v1144 and (v1144.TimeToChange and v1144.AddMutationName) then
								v1139 = v1139 + 1
								if v1134 - v1141 >= v1144.TimeToChange then
									v1135:SetAttribute(v1144.AddMutationName, true)
								end
							else
								warn((("Invalid or nil TimeData for %*, despite being in mutaionTimes"):format(v1142)))
							end
						else
							warn((("No mutation for %*:%*"):format(v1140, v1142)))
						end
					end
					if v1139 <= 0 then
						warn((("%* in timedPlants, but no valid muts!"):format(v1135.Name)))
					end
				else
					warn(("No Mutation Times for %* >"):format(v1135.Name), v1135)
				end
			else
				warn(("No Plant Data for %* >"):format((v1135:GetFullName())), v1135)
			end
		end
	end
end
local function v_u_1158(p1145)
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_518, (copy) v_u_1132
	if p1145:IsA("Tool") then
		return
	elseif p1145:HasTag("FoodModel") then
		return
	elseif p1145:HasTag("TESTING") then
		return
	else
		local v1146 = require(game.ServerStorage.Data_Module)
		local v1147 = v_u_8(p1145)
		if v1147 then
			local v1148 = v1146.GetFruitData(v1147, p1145)
			local v1149 = v_u_9.MutationTimes
			if not v1148 then
				v1148 = v1146.GetPlantData(v1147, p1145)
				v1149 = v_u_10.MutationTimes
			end
			if v1148 then
				local v1150 = workspace:GetServerTimeNow()
				local v1151 = math.floor(v1150)
				v1148[v1149] = v1148[v1149] or {}
				for v1152, _ in v1148[v1149] do
					local v1153 = v_u_11:GetEnumsToMutations()[v1152]
					local v1154 = v_u_518[v1153]
					if not (p1145:GetAttribute(v1153) and v1154.TimeData) then
						v1148[v1149][v1152] = nil
					end
				end
				for v1155, _ in p1145:GetAttributes() do
					local v1156 = v_u_518[v1155]
					if v1156 and v1156.TimeData then
						local v1157 = v_u_11:GetMutationsToEnums()[v1155]
						if not v1148[v1149][v1157] then
							v1148[v1149][v1157] = v1151
						end
					end
				end
				if next(v1148[v1149]) == nil then
					v1148[v1149] = nil
					if v_u_1132[p1145] then
						v_u_1132[p1145] = nil
						return
					end
				elseif not v_u_1132[p1145] then
					v_u_1132[p1145] = true
				end
			else
				warn(("No Plant Data for %* >"):format((p1145:GetFullName())), p1145)
			end
		else
			warn("No player for plant >", p1145)
			return
		end
	end
end
local v_u_1159 = {}
local function v1165(p_u_1160)
	-- upvalues: (copy) v_u_1130, (copy) v_u_1159, (copy) v_u_1158, (copy) v_u_129, (copy) v_u_11, (copy) v_u_1132, (copy) v_u_13, (copy) v_u_16
	local v_u_1161 = require(script.MutationCombos)
	if p_u_1160 then
		p_u_1160.AttributeChanged:Connect(function(p1162)
			-- upvalues: (ref) v_u_1130, (ref) v_u_1159, (copy) p_u_1160, (ref) v_u_1158, (copy) v_u_1161, (ref) v_u_129, (ref) v_u_11
			if v_u_1130[p1162] then
				if not v_u_1159[p_u_1160] then
					v_u_1159[p_u_1160] = true
					v_u_1158(p_u_1160)
					task.defer(function()
						-- upvalues: (ref) v_u_1161, (ref) p_u_1160, (ref) v_u_129, (ref) v_u_11, (ref) v_u_1159
						v_u_1161:HandleCombos(p_u_1160)
						v_u_129(p_u_1160)
						v_u_11:SetToolName(p_u_1160)
						v_u_1159[p_u_1160] = nil
					end)
				end
			else
				return
			end
		end)
		v_u_1158(p_u_1160)
		v_u_1161:HandleCombos(p_u_1160)
		v_u_129(p_u_1160)
		v_u_11:SetToolName(p_u_1160)
		p_u_1160.Destroying:Once(function()
			-- upvalues: (ref) v_u_1159, (copy) p_u_1160, (ref) v_u_1132, (ref) v_u_13, (ref) v_u_16
			v_u_1159[p_u_1160] = nil
			v_u_1132[p_u_1160] = nil
			for _, v1163 in p_u_1160:GetDescendants() do
				if v1163:IsA("BasePart") then
					v_u_13[v1163] = nil
					v_u_16[v1163] = nil
				end
			end
		end)
		p_u_1160.DescendantRemoving:Connect(function(p1164)
			-- upvalues: (ref) v_u_13, (ref) v_u_16
			v_u_13[p1164] = nil
			v_u_16[p1164] = nil
		end)
	else
		warn("MutationHandler.MutatableAdded | No plant")
	end
end
if v_u_3:IsServer() then
	v1:GetInstanceAddedSignal("Harvestable"):Connect(v1165)
	v1:GetInstanceAddedSignal("FruitTool"):Connect(v1165)
	v1:GetInstanceAddedSignal("FoodGenerated"):Connect(v1165)
	v1:GetInstanceAddedSignal("PlantScaled"):Connect(function(p1166)
		-- upvalues: (copy) v_u_11, (copy) v_u_129
		if v_u_11:CanBeMutated(p1166) then
			if p1166:IsA("Model") or p1166:IsA("Tool") then
				v_u_129(p1166)
				v_u_11:SetToolName(p1166)
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
