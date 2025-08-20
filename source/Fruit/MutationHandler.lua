-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("CollectionService")
local u2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("RunService")
local u4 = game:GetService("Players")
local u5 = game.ReplicatedStorage.GameEvents.DiscoSetColor_RE
local u6 = require(game.ReplicatedStorage.Modules.TableUtils)
local u7 = require(game.ReplicatedStorage.Calculate_Weight)
local u8 = require(u2.Modules.GetPlayerFromPlant)
local u9 = require(u2.Data.EnumRegistry.FruitsEnums)
local u10 = require(u2.Data.EnumRegistry.PlantsEnums)
local u11 = {}
local u12 = {}
local u13 = {}
local u14 = {}
local u15 = {}
local u16 = {}
local u17 = {}
local u18 = {
    ["Potato"] = CFrame.Angles(1.5707963267948966, 0, 0)
}
local function u96(p19, p20, p21, p22) --[[Anonymous function at line 66]]
    --[[
    Upvalues:
        [1] = u18
    --]]
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
                if u18[v88] then
                    v87 = v87 * u18[v88]
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
local function u105(p97, p98, p99) --[[Anonymous function at line 187]]
    local u100 = p97.Name
    if u100 then
        local function v103(p101) --[[Anonymous function at line 195]]
            --[[
            Upvalues:
                [1] = u100
            --]]
            for _, v102 in p101:GetDescendants() do
                if v102:HasTag((("Cleanup_%*"):format(u100))) then
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
function u11.CanBeMutated(_, p106) --[[Anonymous function at line 210]]
    if p106 then
        return p106:HasTag("Harvestable") or p106:HasTag("FruitTool")
    end
    warn("MutationHandler.CanBeMutated | No plant given!")
    return false
end
local function u112(p107) --[[Anonymous function at line 222]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
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
    if u3:IsStudio() then
        for _, v111 in u4:GetPlayers() do
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
local function u129(u113) --[[Anonymous function at line 263]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u112
    --]]
    local u114 = {}
    local u115 = {}
    for _, v116 in u11:GetMutations() do
        if not u113:GetAttribute(v116.Name) then
            u115[v116] = v116._RemoveFX
        end
        if u113:GetAttribute(v116.Name) then
            u114[v116] = v116._AddFX
        end
    end
    task.spawn(function() --[[Anonymous function at line 273]]
        --[[
        Upvalues:
            [1] = u113
            [2] = u112
            [3] = u115
            [4] = u114
        --]]
        local v117 = os.time()
        while os.time() - v117 <= 10 do
            task.wait()
            if u113:HasTag("PlantGenerated") or u113:HasTag("FoodGenerated") then
                break
            end
        end
        local v118 = u112(u113)
        local function v124(p119, p120, p121, p122) --[[Anonymous function at line 286]]
            if typeof(p122) == "table" then
                for _, v123 in ipairs(p122) do
                    p119(p120, p121, v123)
                end
            elseif p122 then
                p119(p120, p121, p122)
            end
        end
        for v125, v126 in u115 do
            v124(v126, v125, u113, v118)
        end
        for v127, v128 in u114 do
            v124(v128, v127, u113, v118)
        end
    end)
end
local _ = 0
local u495 = {
    ["Shocked"] = {
        ["Id"] = "a",
        ["Name"] = "Shocked",
        ["ValueMulti"] = 100,
        ["Color"] = Color3.fromRGB(255, 255, 100),
        ["_AddFX"] = function(p130, p131, p132) --[[Function name: _AddFX, line 319]]
            --[[
            Upvalues:
                [1] = u16
            --]]
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
                    u16[v135] = u16[v135] or v135.Material
                    v135.Material = Enum.Material.Neon
                end
            end
        end,
        ["_RemoveFX"] = function(_, p136, p137) --[[Function name: _RemoveFX, line 342]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            if p137 then
                for _, v138 in p137:GetChildren() do
                    if v138:HasTag("Cleanup_Shock") then
                        v138:Destroy()
                    end
                end
            end
            for _, v139 in p136:GetDescendants() do
                if (v139:IsA("BasePart") or v139:IsA("UnionOperation")) and u16[v139] then
                    if not v139:HasTag("Effect") then
                        v139.Material = u16[v139]
                    end
                    u16[v139] = nil
                end
            end
        end
    },
    ["Windstruck"] = {
        ["Id"] = "b",
        ["Name"] = "Windstruck",
        ["ValueMulti"] = 2,
        ["Color"] = Color3.fromRGB(162, 185, 209),
        ["_AddFX"] = function(p140, p141, p142) --[[Function name: _AddFX, line 367]]
            p140:_RemoveFX(p141, p142)
            if p142 then
                for _, v143 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
                    local v144 = v143:Clone()
                    v144.Parent = p142
                    v144:AddTag("Cleanup_Windstruck")
                end
            end
        end,
        ["_RemoveFX"] = function(_, _, p145) --[[Function name: _RemoveFX, line 382]]
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
        ["_AddFX"] = function(p147, p148, p149) --[[Function name: _AddFX, line 399]]
            --[[
            Upvalues:
                [1] = u16
            --]]
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
                    u16[v152] = u16[v152] or v152.Material
                    v152.Material = Enum.Material.Neon
                    v152.Reflectance = 0.05
                    v152:AddTag("DawnboundVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p153, p154) --[[Function name: _RemoveFX, line 426]]
            --[[
            Upvalues:
                [1] = u16
            --]]
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
                    if u16[v156] then
                        v156.Material = u16[v156]
                        u16[v156] = nil
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
        ["_AddFX"] = function(p157, p158, p159) --[[Function name: _AddFX, line 457]]
            p157:_RemoveFX(p158, p159)
            if p159 then
                for _, v160 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
                    local v161 = v160:Clone()
                    v161.Parent = p159
                    v161:AddTag("Cleanup_Twisted")
                end
            end
        end,
        ["_RemoveFX"] = function(_, _, p162) --[[Function name: _RemoveFX, line 472]]
            if p162 then
                for _, v163 in p162:GetChildren() do
                    if v163:HasTag("Twisted") then
                        v163:Destroy()
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
        ["_AddFX"] = function(p164, p165, p166) --[[Function name: _AddFX, line 489]]
            p164:_RemoveFX(p165, p166)
            if p166 then
                for _, v167 in game.ServerStorage.Mutation_FX.Cloudtouched:GetChildren() do
                    local v168 = v167:Clone()
                    v168.Parent = p166
                    v168:AddTag("Cleanup_Cloudtouched")
                end
            end
        end,
        ["_RemoveFX"] = function(_, _, p169) --[[Function name: _RemoveFX, line 504]]
            if p169 then
                for _, v170 in p169:GetChildren() do
                    if v170:HasTag("Cleanup_Cloudtouched") then
                        v170:Destroy()
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
        ["_AddFX"] = function(p171, p172, p173) --[[Function name: _AddFX, line 521]]
            p171:_RemoveFX(p172, p173)
            if p173 then
                for _, v174 in game.ServerStorage.Mutation_FX.Voidtouched:GetChildren() do
                    local v175 = v174:Clone()
                    v175.Parent = p173
                    v175:AddTag("Cleanup_Voidtouched")
                end
            end
        end,
        ["_RemoveFX"] = function(_, _, p176) --[[Function name: _RemoveFX, line 536]]
            if p176 then
                for _, v177 in p176:GetChildren() do
                    if v177:HasTag("Cleanup_Voidtouched") then
                        v177:Destroy()
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
        ["_AddFX"] = function(p178, p179, p180) --[[Function name: _AddFX, line 553]]
            p178:_RemoveFX(p179, p180)
            if p180 then
                for _, v181 in game.ServerStorage.Mutation_FX.Wet:GetChildren() do
                    local v182 = v181:Clone()
                    v182.Parent = p180
                    v182.Enabled = true
                    v182:AddTag("Cleanup_Wet")
                end
            end
        end,
        ["_RemoveFX"] = function(_, _, p183) --[[Function name: _RemoveFX, line 567]]
            if p183 then
                for _, v184 in p183:GetChildren() do
                    if v184:HasTag("Cleanup_Wet") then
                        v184:Destroy()
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
        ["_AddFX"] = function(p185, p186, p187) --[[Function name: _AddFX, line 583]]
            p185:_RemoveFX(p186, p187)
            if p187 then
                for _, v188 in game.ServerStorage.Mutation_FX.Fried:GetChildren() do
                    local v189 = v188:Clone()
                    v189.Parent = p187
                    v189.Enabled = true
                    v189:AddTag("Cleanup_Fried")
                end
            end
        end,
        ["_RemoveFX"] = function(_, _, p190) --[[Function name: _RemoveFX, line 597]]
            if p190 then
                for _, v191 in p190:GetChildren() do
                    if v191:HasTag("Cleanup_Fried") then
                        v191:Destroy()
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
        ["_AddFX"] = function(p192, p193, p194) --[[Function name: _AddFX, line 613]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            p192:_RemoveFX(p193, p194)
            local v195 = {
                "Neon orange",
                "Br. yellowish orange",
                "Bright orange",
                "Bright red",
                "Bright yellow"
            }
            for _, v196 in p193:GetDescendants() do
                if (v196:IsA("BasePart") or v196:IsA("UnionOperation")) and not v196:HasTag("Effect") then
                    u13[v196] = u13[v196] or v196.BrickColor.Color
                    v196.BrickColor = BrickColor.new(v195[Random.new():NextInteger(1, #v195)])
                    u16[v196] = u16[v196] or v196.Material
                    v196.Material = Enum.Material.Neon
                    v196:AddTag("MoltenVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p197, _) --[[Function name: _RemoveFX, line 638]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            for _, v198 in p197:GetDescendants() do
                if (v198:IsA("BasePart") or v198:IsA("UnionOperation")) and v198:HasTag("MoltenVisual") then
                    v198.Reflectance = 0
                    local v199
                    if u13[v198] then
                        v199 = BrickColor.new(u13[v198])
                    else
                        v199 = v198.BrickColor
                    end
                    v198.BrickColor = v199
                    u13[v198] = nil
                    v198:RemoveTag("MoltenVisual")
                    if u16[v198] then
                        v198.Material = u16[v198]
                        u16[v198] = nil
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
        ["_AddFX"] = function(_, p200, _) --[[Function name: _AddFX, line 662]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u14
            --]]
            for _, v201 in p200:GetDescendants() do
                if (v201:IsA("BasePart") or v201:IsA("UnionOperation")) and not v201:HasTag("SlicedVisual") then
                    u15[v201] = u15[v201] or v201.Orientation
                    u14[v201] = u14[v201] or v201.Position
                    local v202 = p200.Item_Seed.Value
                    local v203 = Random.new(v202)
                    local v204 = u15[v201]
                    local v205 = v204.X + v203:NextNumber(-8, 8)
                    local v206 = v204.Y + v203:NextNumber(-8, 8)
                    local v207 = v204.Z + v203:NextNumber(-8, 8)
                    v201.Orientation = Vector3.new(v205, v206, v207)
                    local v208 = v201.Size.X
                    local v209 = v203:NextNumber(-v208, v208) * 0.25
                    local v210 = v203:NextNumber(-v208, v208) * 0.25
                    local v211 = v203:NextNumber(-v208, v208) * 0.25
                    local v212 = u14[v201]
                    local v213 = math.clamp(v209, 0, 1)
                    local v214 = math.clamp(v210, 0, 1)
                    local v215 = math.clamp(v211, 0, 1)
                    v201.Position = v212 + Vector3.new(v213, v214, v215)
                    v201:AddTag("SlicedVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p216, _) --[[Function name: _RemoveFX, line 688]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u14
            --]]
            for _, v217 in p216:GetDescendants() do
                if (v217:IsA("BasePart") or v217:IsA("UnionOperation")) and v217:HasTag("SlicedVisual") then
                    local v218
                    if u15[v217] then
                        v218 = u15[v217]
                    else
                        v218 = v217.Orientation
                    end
                    v217.Orientation = v218
                    local v219
                    if u14[v217] then
                        v219 = u14[v217]
                    else
                        v219 = v217.Position
                    end
                    v217.Position = v219
                    v217:RemoveTag("SlicedVisual")
                end
            end
        end
    },
    ["Alienlike"] = {
        ["Id"] = "j",
        ["Name"] = "Alienlike",
        ["ValueMulti"] = 100,
        ["Color"] = Color3.fromRGB(0, 223, 197),
        ["_AddFX"] = function(p220, p221, p222) --[[Function name: _AddFX, line 708]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            p220:_RemoveFX(p221, p222)
            if p222 then
                for _, v223 in game.ServerStorage.Mutation_FX.Alienlike:GetChildren() do
                    local v224 = v223:Clone()
                    v224.Parent = p222
                    v224.Enabled = true
                    v224:AddTag("Cleanup_Alienlike")
                end
            end
            for _, v225 in p221:GetDescendants() do
                if (v225:IsA("BasePart") or v225:IsA("UnionOperation")) and not v225:HasTag("Effect") then
                    u13[v225] = u13[v225] or v225.Color
                    v225.Color = Color3.fromRGB(0, 255, 217)
                    if Random.new():NextInteger(1, 2) == 1 then
                        u16[v225] = u16[v225] or v225.Material
                        v225.Material = Enum.Material.ForceField
                    end
                    v225:AddTag("AlienlikeVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p226, p227) --[[Function name: _RemoveFX, line 738]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            if p227 then
                for _, v228 in p227:GetChildren() do
                    if v228:HasTag("Cleanup_Alienlike") then
                        v228:Destroy()
                    end
                end
            end
            for _, v229 in p226:GetDescendants() do
                if (v229:IsA("BasePart") or v229:IsA("UnionOperation")) and v229:HasTag("AlienlikeVisual") then
                    v229.Reflectance = 0
                    v229.Color = u13[v229] or v229.Color
                    u13[v229] = nil
                    v229:RemoveTag("AlienlikeVisual")
                    if u16[v229] then
                        v229.Material = u16[v229]
                        u16[v229] = nil
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
        ["_AddFX"] = function(p230, p231, p232) --[[Function name: _AddFX, line 770]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            p230:_RemoveFX(p231, p232)
            if p232 then
                for _, v233 in game.ServerStorage.Mutation_FX.Galactic:GetChildren() do
                    local v234 = v233:Clone()
                    v234.Parent = p232
                    v234.Enabled = true
                    v234:AddTag("Cleanup_Galactic")
                end
            end
            for _, v235 in p231:GetDescendants() do
                if (v235:IsA("BasePart") or v235:IsA("UnionOperation")) and not v235:HasTag("Effect") then
                    u13[v235] = u13[v235] or v235.Color
                    v235.Color = Color3.fromRGB(226, 152, 255)
                    if Random.new():NextInteger(1, 2) == 1 then
                        u16[v235] = u16[v235] or v235.Material
                        v235.Material = Enum.Material.Neon
                    end
                    v235:AddTag("GalacticVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p236, p237) --[[Function name: _RemoveFX, line 800]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            if p237 then
                for _, v238 in p237:GetChildren() do
                    if v238:HasTag("Cleanup_Galactic") then
                        v238:Destroy()
                    end
                end
            end
            for _, v239 in p236:GetDescendants() do
                if (v239:IsA("BasePart") or v239:IsA("UnionOperation")) and v239:HasTag("GalacticVisual") then
                    v239.Reflectance = 0
                    v239.Color = u13[v239] or v239.Color
                    u13[v239] = nil
                    v239:RemoveTag("GalacticVisual")
                    if u16[v239] then
                        v239.Material = u16[v239]
                        u16[v239] = nil
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
        ["_AddFX"] = function(p240, p241, p242) --[[Function name: _AddFX, line 832]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            p240:_RemoveFX(p241, p242)
            for v243, v244 in p241:GetDescendants() do
                if v244:IsA("BasePart") or v244:IsA("UnionOperation") then
                    if v243 % 5 == 0 then
                        local v245 = game.ServerStorage.Mutation_FX.Aurora.Light:Clone()
                        v245.Parent = v244
                        v245.Enabled = true
                        v245:AddTag("Cleanup_Aurora")
                    end
                    if not v244:HasTag("Effect") then
                        local v246 = Random.new():NextInteger(1, 3)
                        u13[v244] = u13[v244] or v244.Color
                        if v246 == 1 then
                            v244.Color = Color3.fromRGB(150, 92, 186)
                        elseif v246 == 2 then
                            v244.Color = Color3.fromRGB(87, 91, 171)
                        elseif v246 == 3 then
                            v244.Color = Color3.fromRGB(76, 156, 165)
                        end
                        u16[v244] = u16[v244] or v244.Material
                        v244.Material = Enum.Material.Neon
                        v244:AddTag("AuroraVisual")
                    end
                end
            end
        end,
        ["_RemoveFX"] = function(_, p247, p248) --[[Function name: _RemoveFX, line 865]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            if p248 then
                for _, v249 in p248:GetChildren() do
                    if v249:HasTag("Cleanup_Aurora") then
                        v249:Destroy()
                    end
                end
            end
            for _, v250 in p247:GetDescendants() do
                if (v250:IsA("BasePart") or v250:IsA("UnionOperation")) and v250:HasTag("GalacticVisual") then
                    v250.Reflectance = 0
                    v250.Color = u13[v250] or v250.Color
                    u13[v250] = nil
                    v250:RemoveTag("AuroraVisual")
                    if u16[v250] then
                        v250.Material = u16[v250]
                        u16[v250] = nil
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
        ["_AddFX"] = function(p251, p252, p253) --[[Function name: _AddFX, line 897]]
            p251:_RemoveFX(p252, p253)
            if p253 then
                for _, v254 in game.ServerStorage.Mutation_FX.Chilled:GetChildren() do
                    local v255 = v254:Clone()
                    v255.Parent = p253
                    v255.Enabled = true
                    v255:AddTag("Cleanup_Chilled")
                end
            end
            for _, v256 in p252:GetChildren() do
                if v256:IsA("BasePart") or v256:IsA("UnionOperation") then
                    v256.Reflectance = 0.1
                end
            end
        end,
        ["_RemoveFX"] = function(_, p257, p258) --[[Function name: _RemoveFX, line 915]]
            if p258 then
                for _, v259 in p258:GetChildren() do
                    if v259:HasTag("Cleanup_Chilled") then
                        v259:Destroy()
                    end
                end
            end
            for _, v260 in p257:GetChildren() do
                if v260:IsA("BasePart") or v260:IsA("UnionOperation") then
                    v260.Reflectance = 0
                end
            end
        end
    },
    ["Sundried"] = {
        ["Id"] = "n",
        ["Name"] = "Sundried",
        ["ValueMulti"] = 85,
        ["Color"] = Color3.fromRGB(207, 93, 0),
        ["_AddFX"] = function(p261, p262, p263) --[[Function name: _AddFX, line 935]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            p261:_RemoveFX(p262, p263)
            for _, v264 in p262:GetChildren() do
                if v264:IsA("BasePart") or v264:IsA("UnionOperation") then
                    u13[v264] = u13[v264] or v264.Color
                    v264.Color = Color3.fromRGB(v264.Color.R * 178.5, v264.Color.G * 127.5, v264.Color.B * 127.5)
                end
            end
        end,
        ["_RemoveFX"] = function(_, p265, _) --[[Function name: _RemoveFX, line 951]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            for _, v266 in p265:GetChildren() do
                if v266:IsA("BasePart") or v266:IsA("UnionOperation") then
                    v266.Color = u13[v266] or v266.Color
                    u13[v266] = nil
                end
            end
        end
    },
    ["Wiltproof"] = {
        ["Id"] = "o",
        ["Name"] = "Wiltproof",
        ["ValueMulti"] = 4,
        ["Color"] = Color3.fromRGB(0, 222, 155),
        ["_AddFX"] = function(p267, p268, p269) --[[Function name: _AddFX, line 968]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            p267:_RemoveFX(p268, p269)
            for _, v270 in p268:GetChildren() do
                if v270:IsA("BasePart") or v270:IsA("UnionOperation") then
                    u13[v270] = u13[v270] or v270.Color
                    local v271 = v270.Color
                    local v272 = v271.R * 0.3 + v271.G * 0.59 + v271.B * 0.11
                    local v273 = Color3.new
                    local v274 = v272 + (v271.R - v272) * 3
                    local v275 = math.clamp(v274, 0, 1)
                    local v276 = v272 + (v271.G - v272) * 4
                    local v277 = math.clamp(v276, 0, 1)
                    local v278 = v272 + (v271.B - v272) * 3
                    v270.Color = v273(v275, v277, (math.clamp(v278, 0, 1)))
                end
            end
        end,
        ["_RemoveFX"] = function(_, p279, _) --[[Function name: _RemoveFX, line 988]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
                [3] = u17
            --]]
            for _, v280 in p279:GetChildren() do
                if v280:IsA("BasePart") or v280:IsA("UnionOperation") then
                    v280.Color = u13[v280] or v280.Color
                    u13[v280] = nil
                    if u16[v280] then
                        v280.Material = u16[v280]
                        u16[v280] = nil
                    end
                    if u17[v280] then
                        v280.MaterialVariant = u17[v280]
                        u17[v280] = nil
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
        ["_AddFX"] = function(p281, p282, p283) --[[Function name: _AddFX, line 1015]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            p281:_RemoveFX(p282, p283)
            if p283 then
                for _, v284 in game.ServerStorage.Mutation_FX.Drenched:GetChildren() do
                    local v285 = v284:Clone()
                    v285.Parent = p283
                    v285.Enabled = true
                    v285:AddTag("Cleanup_Drenched")
                end
            end
            for _, v286 in p282:GetChildren() do
                if v286:IsA("BasePart") or v286:IsA("UnionOperation") then
                    u13[v286] = u13[v286] or v286.Color
                    local v287, v288, v289 = v286.Color:ToHSV()
                    local v290 = v288 + 0.1
                    local v291 = math.clamp(v290, v288, 1)
                    local v292 = v289 + 0.05
                    local v293 = math.clamp(v292, v289, 1)
                    v286.Color = Color3.fromHSV(v287, v291, v293)
                end
            end
        end,
        ["_RemoveFX"] = function(_, p294, p295) --[[Function name: _RemoveFX, line 1051]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
                [3] = u17
            --]]
            if p295 then
                for _, v296 in p295:GetChildren() do
                    if v296:HasTag("Cleanup_Drenched") then
                        v296:Destroy()
                    end
                end
            end
            for _, v297 in p294:GetChildren() do
                if v297:IsA("BasePart") or v297:IsA("UnionOperation") then
                    v297.Color = u13[v297] or v297.Color
                    u13[v297] = nil
                    if u16[v297] then
                        v297.Material = u16[v297]
                        u16[v297] = nil
                    end
                    if u17[v297] then
                        v297.MaterialVariant = u17[v297]
                        u17[v297] = nil
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
        ["_AddFX"] = function(p298, p299, p300) --[[Function name: _AddFX, line 1126]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            p298:_RemoveFX(p299, p300)
            if p300 then
                for _, v301 in game.ServerStorage.Mutation_FX.Verdant:GetChildren() do
                    local v302 = v301:Clone()
                    v302.Parent = p300
                    v302.Enabled = true
                    v302:AddTag("Cleanup_Verdant")
                end
            end
            for v303, v304 in p299:GetDescendants() do
                if v304:IsA("BasePart") or v304:IsA("UnionOperation") then
                    if v303 % 6 == 0 then
                        local v305 = game.ServerStorage.Mutation_FX.Verdant.LeafSwirl:Clone()
                        v305.Parent = v304
                        v305.Enabled = true
                        v305:AddTag("Cleanup_Verdant")
                    end
                    if not v304:HasTag("Effect") then
                        local v306 = v304.Color
                        u13[v304] = u13[v304] or v304.Color
                        u16[v304] = u16[v304] or v304.Material
                        local v307 = Color3.fromRGB
                        local v308 = v306.R * 166 * 0.5
                        local v309 = v306.G * 255 + 150
                        v304.Color = v307(v308, math.clamp(v309, 0, 255) * 0.5, v306.B * 166 * 0.5)
                        v304:AddTag("VerdantVisual")
                    end
                end
            end
        end,
        ["_RemoveFX"] = function(_, p310, p311) --[[Function name: _RemoveFX, line 1167]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            if p311 then
                for _, v312 in p311:GetChildren() do
                    if v312:HasTag("Cleanup_Verdant") then
                        v312:Destroy()
                    end
                end
            end
            for _, v313 in p310:GetDescendants() do
                if (v313:IsA("BasePart") or v313:IsA("UnionOperation")) and v313:HasTag("VerdantVisual") then
                    v313:RemoveTag("VerdantVisual")
                    v313.Color = u13[v313] or v313.Color
                    u13[v313] = nil
                    if u16[v313] then
                        v313.Material = u16[v313]
                        u16[v313] = nil
                    end
                    v313.Reflectance = 0
                end
            end
        end
    },
    ["Paradisal"] = {
        ["Id"] = "r",
        ["Name"] = "Paradisal",
        ["ValueMulti"] = 100,
        ["Color"] = Color3.fromRGB(176, 240, 0),
        ["_AddFX"] = function(p314, p315, p316) --[[Function name: _AddFX, line 1199]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            p314:_RemoveFX(p315, p316)
            if p316 then
                for _, v317 in game.ServerStorage.Mutation_FX.Paradisal:GetChildren() do
                    local v318 = v317:Clone()
                    v318.Parent = p316
                    v318.Enabled = true
                    v318:AddTag("Cleanup_Paradisal")
                end
            end
            for v319, v320 in p315:GetDescendants() do
                if v320:IsA("BasePart") or v320:IsA("UnionOperation") then
                    if v319 % 6 == 0 then
                        local v321 = game.ServerStorage.Mutation_FX.Paradisal.Rays:Clone()
                        v321.Parent = v320
                        v321.Enabled = true
                        v321:AddTag("Cleanup_Paradisal")
                    end
                    if not v320:HasTag("Effect") then
                        u13[v320] = u13[v320] or v320.Color
                        u16[v320] = u16[v320] or v320.Material
                        v320.Color = Color3.fromRGB(176, 240, 0)
                        v320:AddTag("ParadisalVisual")
                    end
                end
            end
        end,
        ["_RemoveFX"] = function(_, p322, p323) --[[Function name: _RemoveFX, line 1235]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            if p323 then
                for _, v324 in p323:GetChildren() do
                    if v324:HasTag("Cleanup_Paradisal") then
                        v324:Destroy()
                    end
                end
            end
            for _, v325 in p322:GetDescendants() do
                if (v325:IsA("BasePart") or v325:IsA("UnionOperation")) and v325:HasTag("ParadisalVisual") then
                    v325:RemoveTag("ParadisalVisual")
                    v325.Color = u13[v325] or v325.Color
                    u13[v325] = nil
                    if u16[v325] then
                        v325.Material = u16[v325]
                        u16[v325] = nil
                    end
                    v325.Reflectance = 0
                end
            end
        end
    },
    ["Enchanted"] = {
        ["Id"] = "Enc",
        ["Name"] = "Enchanted",
        ["ValueMulti"] = 50,
        ["Color"] = Color3.fromRGB(255, 214, 89),
        ["_AddFX"] = function(p326, p327, p328) --[[Function name: _AddFX, line 1267]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            p326:_RemoveFX(p327, p328)
            if p328 then
                for _, v329 in game.ServerStorage.Mutation_FX.Enchanted:GetChildren() do
                    local v330 = v329:Clone()
                    v330.Parent = p328
                    v330.Enabled = true
                    v330:AddTag("Cleanup_Enchanment")
                end
            end
            local v331 = { Color3.fromRGB(255, 214, 89), Color3.fromRGB(255, 159, 80), Color3.fromRGB(255, 244, 123) }
            for v332, v333 in p327:GetDescendants() do
                if v333:IsA("BasePart") or v333:IsA("UnionOperation") then
                    if v332 % 6 == 0 then
                        local v334 = game.ServerStorage.Mutation_FX.Enchanted.Sparkle:Clone()
                        v334.Parent = v333
                        v334.Enabled = true
                        v334.Rate = math.random(8, 25) / 10
                        v334:AddTag("Cleanup_Enchanment")
                        local v335 = Instance.new("Attachment", v333)
                        v335:AddTag("Cleanup_Enchanment")
                        local v336 = Instance.new("Attachment", v333)
                        v336:AddTag("Cleanup_Enchanment")
                        v335.Position = Vector3.new(0, 0.1, 0)
                        v336.Position = Vector3.new(0, -0.1, 0)
                        local v337 = Instance.new("Trail")
                        v337.Color = ColorSequence.new(Color3.fromRGB(255, 214, 89))
                        v337.LightInfluence = 0
                        v337.Brightness = 3
                        v337.Attachment0 = v335
                        v337.Attachment1 = v336
                        v337.Lifetime = 0.3
                        v337.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
                        v337.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
                        v337.Parent = v333
                        v337:AddTag("Cleanup_Enchanment")
                    end
                    if not v333:HasTag("Effect") then
                        u13[v333] = u13[v333] or v333.Color
                        u16[v333] = u16[v333] or v333.Material
                        if v333.Transparency ~= 1 then
                            v333.Color = v331[math.random(1, #v331)]
                            v333.Material = "Neon"
                            v333:SetAttribute("OTransparency", v333.Transparency)
                            v333.Transparency = 0.5
                            v333:AddTag("EnchanmentVisual")
                        end
                    end
                end
            end
        end,
        ["_RemoveFX"] = function(_, p338, p339) --[[Function name: _RemoveFX, line 1323]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            if p339 then
                for _, v340 in p339:GetChildren() do
                    if v340:HasTag("Cleanup_Enchantment") then
                        v340:Destroy()
                    end
                end
            end
            for _, v341 in p338:GetDescendants() do
                if (v341:IsA("BasePart") or v341:IsA("UnionOperation")) and v341:HasTag("EnchamtmentVisual") then
                    v341:RemoveTag("EnchamtmentVisual")
                    v341.Color = u13[v341] or v341.Color
                    u13[v341] = nil
                    v341.Transparency = v341:GetAttribute("OTransparency") or 0
                    if u16[v341] then
                        v341.Material = u16[v341]
                        u16[v341] = nil
                    end
                    v341.Reflectance = 0
                end
            end
        end
    },
    ["Frozen"] = {
        ["Id"] = "s",
        ["Name"] = "Frozen",
        ["ValueMulti"] = 10,
        ["Color"] = Color3.fromRGB(108, 184, 255),
        ["_AddFX"] = function(p342, p343, p344) --[[Function name: _AddFX, line 1356]]
            --[[
            Upvalues:
                [1] = u96
            --]]
            u96(p342, p343, p344, 0.8)
        end,
        ["_RemoveFX"] = function(p345, p346, p347) --[[Function name: _RemoveFX, line 1358]]
            --[[
            Upvalues:
                [1] = u105
            --]]
            u105(p345, p346, p347)
        end
    },
    ["Disco"] = {
        ["Id"] = "t",
        ["Name"] = "Disco",
        ["ValueMulti"] = 125,
        ["Color"] = Color3.fromRGB(255, 105, 180),
        ["_AddFX"] = function(p348, p349, p350) --[[Function name: _AddFX, line 1367]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            p348:_RemoveFX(p349, p350)
            local function u353(p351) --[[Anonymous function at line 1370]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u16
                    [3] = u353
                --]]
                for _, v352 in p351:GetChildren() do
                    if v352:IsA("BasePart") or v352:IsA("UnionOperation") then
                        u13[v352] = u13[v352] or v352.Color
                        u16[v352] = u16[v352] or v352.Material
                        v352.Material = Enum.Material.Neon
                        v352:AddTag("Discofied")
                    elseif v352:IsA("Model") then
                        u353(v352)
                    end
                end
            end
            u353(p349)
        end,
        ["_RemoveFX"] = function(_, p354, _) --[[Function name: _RemoveFX, line 1386]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
                [3] = u5
            --]]
            local v355 = {}
            for _, v356 in p354:GetDescendants() do
                if (v356:IsA("BasePart") or v356:IsA("UnionOperation")) and v356:HasTag("Discofied") then
                    v356.Reflectance = 0
                    v356:RemoveTag("Discofied")
                    v356.Color = u13[v356] or v356.Color
                    u13[v356] = nil
                    local v357 = {
                        ["Part"] = v356,
                        ["Color"] = v356.Color
                    }
                    table.insert(v355, v357)
                    local v358 = u16[v356]
                    if v358 then
                        v356.Material = v358
                        u16[v356] = nil
                    end
                end
            end
            u5:FireAllClients(v355)
        end
    },
    ["Choc"] = {
        ["Id"] = "u",
        ["Name"] = "Choc",
        ["ValueMulti"] = 2,
        ["Color"] = Color3.fromRGB(92, 64, 51),
        ["_AddFX"] = function(p359, p360, p361) --[[Function name: _AddFX, line 1423]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            p359:_RemoveFX(p360, p361)
            local function u368(p362) --[[Anonymous function at line 1429]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u368
                --]]
                for _, u363 in p362:GetChildren() do
                    if u363:IsA("BasePart") or u363:IsA("UnionOperation") then
                        local u364 = {}
                        for _, v365 in game.ServerStorage.Mutation_Textures.Choc:GetChildren() do
                            local v366 = v365:Clone()
                            v366.Parent = u363
                            v366.Transparency = u363.Transparency
                            table.insert(u364, v366)
                            v366:AddTag("Cleanup_Choc")
                        end
                        u12[u363] = u363.Changed:Connect(function() --[[Anonymous function at line 1442]]
                            --[[
                            Upvalues:
                                [1] = u363
                                [2] = u12
                                [3] = u364
                            --]]
                            if u363.Transparency == 0 then
                                u12[u363]:Disconnect()
                                for _, v367 in u364 do
                                    v367.Transparency = 0
                                end
                            end
                        end)
                    elseif u363:IsA("Model") then
                        u368(u363)
                    end
                end
            end
            u368(p360)
        end,
        ["_RemoveFX"] = function(_, p369, _) --[[Function name: _RemoveFX, line 1460]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            for _, v370 in p369:GetDescendants() do
                if v370:HasTag("Cleanup_Choc") then
                    v370:Destroy()
                end
                if u12[v370] then
                    u12[v370]:Disconnect()
                end
            end
        end
    },
    ["Plasma"] = {
        ["Id"] = "v",
        ["Name"] = "Plasma",
        ["ValueMulti"] = 5,
        ["Color"] = Color3.fromRGB(208, 43, 137),
        ["_AddFX"] = function(p371, p372, p373) --[[Function name: _AddFX, line 1476]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            p371:_RemoveFX(p372, p373)
            if p373 then
                for _, v374 in game.ServerStorage.Mutation_FX.Plasma:GetChildren() do
                    local v375 = v374:Clone()
                    v375.Parent = p373
                    v375.Enabled = true
                    v375:AddTag("Cleanup_Plasma")
                end
            end
            for _, v376 in p372:GetDescendants() do
                if (v376:IsA("BasePart") or v376:IsA("UnionOperation")) and not v376:HasTag("Effect") then
                    u13[v376] = u13[v376] or v376.Color
                    v376.Color = Color3.fromRGB(189, 67, 142)
                    u16[v376] = u16[v376] or v376.Material
                    v376.Material = Enum.Material.Neon
                    v376.Reflectance = 0.05
                    v376:AddTag("PlasmaVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p377, p378) --[[Function name: _RemoveFX, line 1502]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            local function v381(p379) --[[Anonymous function at line 1503]]
                for _, v380 in p379:GetDescendants() do
                    if v380:HasTag("Cleanup_Plasma") then
                        v380:Destroy()
                    end
                end
            end
            if p378 then
                v381(p378)
            end
            if p377 then
                v381(p377)
            end
            for _, v382 in p377:GetDescendants() do
                if (v382:IsA("BasePart") or v382:IsA("UnionOperation")) and v382:HasTag("PlasmaVisual") then
                    v382.Reflectance = 0
                    v382.Color = u13[v382] or v382.Color
                    u13[v382] = nil
                    v382:RemoveTag("PlasmaVisual")
                    if u16[v382] then
                        v382.Material = u16[v382]
                        u16[v382] = nil
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
        ["_AddFX"] = function(p383, p384, p385) --[[Function name: _AddFX, line 1536]]
            p383:_RemoveFX(p384, p385)
            if p385 then
                for _, v386 in game.ServerStorage.Mutation_FX.Heavenly:GetChildren() do
                    local v387 = v386:Clone()
                    v387.Parent = p385
                    v387.Enabled = true
                    v387:AddTag("Cleanup_Heavenly")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p388, p389) --[[Function name: _RemoveFX, line 1549]]
            local function v392(p390) --[[Anonymous function at line 1550]]
                for _, v391 in p390:GetDescendants() do
                    if v391:HasTag("Cleanup_Heavenly") then
                        v391:Destroy()
                    end
                end
            end
            if p389 then
                v392(p389)
            end
            if p388 then
                v392(p388)
            end
        end
    },
    ["Burnt"] = {
        ["Id"] = "x",
        ["Name"] = "Burnt",
        ["ValueMulti"] = 4,
        ["Color"] = Color3.fromRGB(40, 40, 40),
        ["_AddFX"] = function(p393, p394, p395) --[[Function name: _AddFX, line 1567]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            p393:_RemoveFX(p394, p395)
            if p395 then
                for _, v396 in game.ServerStorage.Mutation_FX.Burnt:GetChildren() do
                    local v397 = v396:Clone()
                    v397.Parent = p395
                    v397.Enabled = true
                    v397:AddTag("Cleanup_Burnt")
                end
            end
            for _, v398 in p394:GetDescendants() do
                if (v398:IsA("BasePart") or v398:IsA("UnionOperation")) and not v398:HasTag("Effect") then
                    u13[v398] = u13[v398] or v398.Color
                    v398.Color = Color3.fromRGB(25, 25, 25)
                    u16[v398] = u16[v398] or v398.Material
                    v398.Material = Enum.Material.Slate
                    v398.Reflectance = 0.05
                    v398:AddTag("BurntVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p399, p400) --[[Function name: _RemoveFX, line 1593]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            local function v403(p401) --[[Anonymous function at line 1594]]
                for _, v402 in p401:GetDescendants() do
                    if v402:HasTag("Cleanup_Burnt") then
                        v402:Destroy()
                    end
                end
            end
            if p400 then
                v403(p400)
            end
            if p399 then
                v403(p399)
            end
            for _, v404 in p399:GetDescendants() do
                if (v404:IsA("BasePart") or v404:IsA("UnionOperation")) and v404:HasTag("BurntVisual") then
                    v404.Reflectance = 0
                    v404.Color = u13[v404] or v404.Color
                    u13[v404] = nil
                    v404:RemoveTag("BurntVisual")
                    if u16[v404] then
                        v404.Material = u16[v404]
                        u16[v404] = nil
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
        ["_AddFX"] = function(p405, p406, p407) --[[Function name: _AddFX, line 1627]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            p405:_RemoveFX(p406, p407)
            if p407 then
                for _, v408 in game.ServerStorage.Mutation_FX.Cooked:GetChildren() do
                    local v409 = v408:Clone()
                    v409.Parent = p407
                    v409.Enabled = true
                    v409:AddTag("Cleanup_Cooked")
                end
            end
            for _, v410 in p406:GetDescendants() do
                if (v410:IsA("BasePart") or v410:IsA("UnionOperation")) and not v410:HasTag("Effect") then
                    u13[v410] = u13[v410] or v410.Color
                    v410.Color = Color3.fromRGB(210, 120, 60)
                    v410:AddTag("CookedVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p411, p412) --[[Function name: _RemoveFX, line 1650]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            local function v415(p413) --[[Anonymous function at line 1651]]
                for _, v414 in p413:GetDescendants() do
                    if v414:HasTag("Cleanup_Cooked") then
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
            for _, v416 in p411:GetDescendants() do
                if (v416:IsA("BasePart") or v416:IsA("UnionOperation")) and v416:HasTag("CookedVisual") then
                    v416.Reflectance = 0
                    v416.Color = u13[v416] or v416.Color
                    u13[v416] = nil
                    v416:RemoveTag("CookedVisual")
                    local v417 = u16[v416]
                    if v417 then
                        v416.Material = v417
                        u16[v416] = nil
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
        ["_AddFX"] = function(p418, p419, p420) --[[Function name: _AddFX, line 1685]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            p418:_RemoveFX(p419, p420)
            if p420 then
                for _, v421 in game.ServerStorage.Mutation_FX.Moonlit:GetChildren() do
                    local v422 = v421:Clone()
                    v422.Parent = p420
                    v422.Enabled = true
                    v422:AddTag("Cleanup_Moonlit")
                    v422:AddTag("Effect")
                end
            end
            for _, v423 in p419:GetDescendants() do
                if (v423:IsA("BasePart") or v423:IsA("UnionOperation")) and not v423:HasTag("Effect") then
                    u13[v423] = u13[v423] or v423.Color
                    v423.Color = Color3.fromRGB(62, 56, 86)
                    v423.Reflectance = 0.3
                    v423:AddTag("MoonlitVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p424, p425) --[[Function name: _RemoveFX, line 1710]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            if p425 then
                for _, v426 in p425:GetChildren() do
                    if v426:HasTag("Cleanup_Moonlit") then
                        v426:Destroy()
                    end
                end
            end
            for _, v427 in p424:GetDescendants() do
                if (v427:IsA("BasePart") or v427:IsA("UnionOperation")) and v427:HasTag("MoonlitVisual") then
                    v427.Color = u13[v427] or v427.Color
                    u13[v427] = nil
                    v427.Reflectance = 0
                    v427:RemoveTag("MoonlitVisual")
                    local v428 = u16[v427]
                    if v428 then
                        v427.Material = v428
                        u16[v427] = nil
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
        ["_AddFX"] = function(p429, p430, p431) --[[Function name: _AddFX, line 1744]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            p429:_RemoveFX(p430, p431)
            if p431 then
                for _, v432 in game.ServerStorage.Mutation_FX.Bloodlit:GetChildren() do
                    local v433 = v432:Clone()
                    v433.Parent = p431
                    v433.Enabled = true
                    v433:AddTag("Cleanup_Bloodlit")
                    v433:AddTag("Effect")
                end
            end
            for _, v434 in p430:GetDescendants() do
                if (v434:IsA("BasePart") or v434:IsA("UnionOperation")) and not v434:HasTag("Effect") then
                    u13[v434] = u13[v434] or v434.Color
                    v434.Color = Color3.fromRGB(143, 1, 3)
                    v434.Reflectance = 0.3
                    v434:AddTag("BloodlitVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p435, p436) --[[Function name: _RemoveFX, line 1769]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            if p436 then
                for _, v437 in p436:GetChildren() do
                    if v437:HasTag("Cleanup_Bloodlit") then
                        v437:Destroy()
                    end
                end
            end
            for _, v438 in p435:GetDescendants() do
                if (v438:IsA("BasePart") or v438:IsA("UnionOperation")) and v438:HasTag("BloodlitVisual") then
                    v438.Reflectance = 0
                    v438.Color = u13[v438] or v438.Color
                    u13[v438] = nil
                    v438:RemoveTag("BloodlitVisual")
                    local v439 = u16[v438]
                    if v439 then
                        v438.Material = v439
                        u16[v438] = nil
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
        ["_AddFX"] = function(p440, p441, p442) --[[Function name: _AddFX, line 1803]]
            p440:_RemoveFX(p441, p442)
            if p442 then
                for _, v443 in game.ServerStorage.Mutation_FX.Zombified:GetChildren() do
                    local v444 = v443:Clone()
                    v444.Parent = p442
                    v444.Enabled = true
                    v444:AddTag("Cleanup_Zombified")
                    v444:AddTag("Effect")
                end
            end
            for _, v445 in p441:GetDescendants() do
                if (v445:IsA("BasePart") or v445:IsA("UnionOperation")) and not v445:HasTag("Effect") then
                    v445:AddTag("ZombifiedVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p446, p447) --[[Function name: _RemoveFX, line 1823]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            if p447 then
                for _, v448 in p447:GetChildren() do
                    if v448:HasTag("Cleanup_Zombified") then
                        v448:Destroy()
                    end
                end
            end
            for _, v449 in p446:GetDescendants() do
                if (v449:IsA("BasePart") or v449:IsA("UnionOperation")) and v449:HasTag("ZombifiedVisual") then
                    v449:RemoveTag("ZombifiedVisual")
                    local v450 = u16[v449]
                    if v450 then
                        v449.Material = v450
                        u16[v449] = nil
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
        ["_AddFX"] = function(p451, p452, p453) --[[Function name: _AddFX, line 1852]]
            p451:_RemoveFX(p452, p453)
            if p453 then
                for _, v454 in game.ServerStorage.Mutation_FX.Celestial:GetChildren() do
                    local v455 = v454:Clone()
                    v455.Parent = p453
                    v455.Enabled = true
                    v455:AddTag("Cleanup_Celestial")
                    v455:AddTag("Effect")
                end
            end
            for _, v456 in p452:GetDescendants() do
                if (v456:IsA("BasePart") or v456:IsA("UnionOperation")) and not v456:HasTag("Effect") then
                    v456.Reflectance = 0.5
                    v456:AddTag("CelestialVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p457, p458) --[[Function name: _RemoveFX, line 1875]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            if p458 then
                for _, v459 in p458:GetChildren() do
                    if v459:HasTag("Cleanup_Celestial") then
                        v459:Destroy()
                    end
                end
            end
            for _, v460 in p457:GetDescendants() do
                if (v460:IsA("BasePart") or v460:IsA("UnionOperation")) and v460:HasTag("CelestialVisual") then
                    v460.Reflectance = 0
                    v460:RemoveTag("CelestialVisual")
                    local v461 = u16[v460]
                    if v461 then
                        v460.Material = v461
                        u16[v460] = nil
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
        ["_AddFX"] = function(p462, p463, p464) --[[Function name: _AddFX, line 1905]]
            p462:_RemoveFX(p463, p464)
            if p464 then
                for _, v465 in game.ServerStorage.Mutation_FX.Meteoric:GetChildren() do
                    local v466 = v465:Clone()
                    v466.Parent = p464
                    v466.Enabled = true
                    v466:AddTag("Cleanup_Meteoric")
                    v466:AddTag("Effect")
                end
            end
            for _, v467 in p463:GetDescendants() do
                if (v467:IsA("BasePart") or v467:IsA("UnionOperation")) and not v467:HasTag("Effect") then
                    v467.Reflectance = 0.5
                    v467:AddTag("MeteoricVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p468, p469) --[[Function name: _RemoveFX, line 1928]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            if p469 then
                for _, v470 in p469:GetChildren() do
                    if v470:HasTag("Cleanup_Meteoric") then
                        v470:Destroy()
                    end
                end
            end
            for _, v471 in p468:GetDescendants() do
                if (v471:IsA("BasePart") or v471:IsA("UnionOperation")) and v471:HasTag("MeteoricVisual") then
                    v471.Reflectance = 0
                    v471:RemoveTag("MeteoricVisual")
                    local v472 = u16[v471]
                    if v472 then
                        v471.Material = v472
                        u16[v471] = nil
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
        ["_AddFX"] = function(p473, p474, p475) --[[Function name: _AddFX, line 1959]]
            p473:_RemoveFX(p474, p475)
            if p475 then
                for _, v476 in game.ServerStorage.Mutation_FX.Honey:GetChildren() do
                    local v477 = v476:Clone()
                    v477.Parent = p475
                    v477.Enabled = true
                    v477:AddTag("Cleanup_Honey")
                    v477:AddTag("Effect")
                end
            end
            for _, v478 in p474:GetDescendants() do
                if (v478:IsA("BasePart") or v478:IsA("UnionOperation")) and not v478:HasTag("Effect") then
                    v478:AddTag("HoneyVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p479, p480) --[[Function name: _RemoveFX, line 1979]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            if p480 then
                for _, v481 in p480:GetChildren() do
                    if v481:HasTag("Cleanup_Honey") then
                        v481:Destroy()
                    end
                end
            end
            for _, v482 in p479:GetDescendants() do
                if (v482:IsA("BasePart") or v482:IsA("UnionOperation")) and v482:HasTag("HoneyVisual") then
                    v482:RemoveTag("HoneyVisual")
                    local v483 = u16[v482]
                    if v483 then
                        v482.Material = v483
                        u16[v482] = nil
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
        ["_AddFX"] = function(p484, p485, p486) --[[Function name: _AddFX, line 2009]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            p484:_RemoveFX(p485, p486)
            if p486 then
                for _, v487 in game.ServerStorage.Mutation_FX.Pollinated:GetChildren() do
                    local v488 = v487:Clone()
                    v488.Parent = p486
                    v488.Enabled = true
                    v488:AddTag("Cleanup_Pollinated")
                    v488:AddTag("Effect")
                end
            end
            for _, v489 in p485:GetDescendants() do
                if (v489:IsA("BasePart") or v489:IsA("UnionOperation")) and not v489:HasTag("Effect") then
                    u13[v489] = u13[v489] or v489.Color
                    v489.Color = Color3.fromRGB(255, 170, 0)
                    v489:AddTag("PollinatedlVisual")
                end
            end
        end,
        ["_RemoveFX"] = function(_, p490, p491) --[[Function name: _RemoveFX, line 2033]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            if p491 then
                for _, v492 in p491:GetChildren() do
                    if v492:HasTag("Cleanup_Pollinated") then
                        v492:Destroy()
                    end
                end
            end
            for _, v493 in p490:GetDescendants() do
                if (v493:IsA("BasePart") or v493:IsA("UnionOperation")) and v493:HasTag("PollinatedlVisual") then
                    v493:RemoveTag("PollinatedVisual")
                    v493.Color = u13[v493] or v493.Color
                    u13[v493] = nil
                    local v494 = u16[v493]
                    if v494 then
                        v493.Material = v494
                        u16[v493] = nil
                    end
                end
            end
        end
    }
}
local v502 = {
    ["Id"] = "G",
    ["Name"] = "Amber",
    ["ValueMulti"] = 10,
    ["Color"] = Color3.fromRGB(255, 192, 0),
    ["TimeData"] = {
        ["TimeToChange"] = 86400,
        ["AddMutationName"] = "OldAmber"
    },
    ["_AddFX"] = function(p496, p497, p498) --[[Function name: _AddFX, line 2069]]
        --[[
        Upvalues:
            [1] = u96
        --]]
        u96(p496, p497, p498, 0.5)
    end,
    ["_RemoveFX"] = function(p499, p500, p501) --[[Function name: _RemoveFX, line 2071]]
        --[[
        Upvalues:
            [1] = u105
        --]]
        u105(p499, p500, p501)
    end
}
u495.Amber = v502
local v509 = {
    ["Id"] = "H",
    ["Name"] = "OldAmber",
    ["ValueMulti"] = 20,
    ["Color"] = Color3.fromRGB(252, 106, 33),
    ["TimeData"] = {
        ["TimeToChange"] = 172800,
        ["AddMutationName"] = "AncientAmber"
    },
    ["_AddFX"] = function(p503, p504, p505) --[[Function name: _AddFX, line 2084]]
        --[[
        Upvalues:
            [1] = u96
        --]]
        u96(p503, p504, p505, 0.5)
    end,
    ["_RemoveFX"] = function(p506, p507, p508) --[[Function name: _RemoveFX, line 2086]]
        --[[
        Upvalues:
            [1] = u105
        --]]
        u105(p506, p507, p508)
    end
}
u495.OldAmber = v509
u495.AncientAmber = {
    ["Id"] = "I",
    ["Name"] = "AncientAmber",
    ["ValueMulti"] = 50,
    ["Color"] = Color3.fromRGB(204, 68, 0),
    ["_AddFX"] = function(p510, p511, p512) --[[Function name: _AddFX, line 2095]]
        --[[
        Upvalues:
            [1] = u96
        --]]
        u96(p510, p511, p512, 0.5)
    end,
    ["_RemoveFX"] = function(p513, p514, p515) --[[Function name: _RemoveFX, line 2097]]
        --[[
        Upvalues:
            [1] = u105
        --]]
        u105(p513, p514, p515)
    end
}
u495.Sandy = {
    ["Id"] = "J",
    ["Name"] = "Sandy",
    ["ValueMulti"] = 3,
    ["Color"] = Color3.fromRGB(212, 191, 141),
    ["_AddFX"] = function(p516, p517, p518) --[[Function name: _AddFX, line 2106]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        p516:_RemoveFX(p517, p518)
        if p518 then
            for _, v519 in game.ServerStorage.Mutation_FX.Sandy:GetChildren() do
                local v520 = v519:Clone()
                v520.Parent = p518
                v520.Enabled = true
                v520:AddTag("Cleanup_Sandy")
            end
        end
        for _, v521 in p517:GetDescendants() do
            if (v521:IsA("BasePart") or v521:IsA("UnionOperation")) and not v521:HasTag("Effect") then
                u13[v521] = u13[v521] or v521.Color
                v521.Color = Color3.fromRGB(240, 206, 119)
                u16[v521] = u16[v521] or v521.Material
                v521.Material = Enum.Material.Sand
                v521.Reflectance = 0
                v521:AddTag("SandyVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p522, p523) --[[Function name: _RemoveFX, line 2132]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        local function v526(p524) --[[Anonymous function at line 2133]]
            for _, v525 in p524:GetDescendants() do
                if v525:HasTag("Cleanup_Sandy") then
                    v525:Destroy()
                end
            end
        end
        if p523 then
            v526(p523)
        end
        if p522 then
            v526(p522)
        end
        for _, v527 in p522:GetDescendants() do
            if (v527:IsA("BasePart") or v527:IsA("UnionOperation")) and v527:HasTag("SandyVisual") then
                v527.Reflectance = 0
                v527.Color = u13[v527] or v527.Color
                u13[v527] = nil
                v527:RemoveTag("SandyVisual")
                if u16[v527] then
                    v527.Material = u16[v527]
                    u16[v527] = nil
                end
            end
        end
    end
}
u495.Clay = {
    ["Id"] = "K",
    ["Name"] = "Clay",
    ["ValueMulti"] = 5,
    ["Color"] = Color3.fromRGB(147, 129, 122),
    ["_AddFX"] = function(p528, p529, p530) --[[Function name: _AddFX, line 2166]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        p528:_RemoveFX(p529, p530)
        if p530 then
            for _, v531 in game.ServerStorage.Mutation_FX.Clay:GetChildren() do
                local v532 = v531:Clone()
                v532.Parent = p530
                v532.Enabled = true
                v532:AddTag("Cleanup_Clay")
            end
        end
        for _, v533 in p529:GetDescendants() do
            if (v533:IsA("BasePart") or v533:IsA("UnionOperation")) and not v533:HasTag("Effect") then
                u13[v533] = u13[v533] or v533.Color
                v533.Color = Color3.fromRGB(147, 129, 122)
                u16[v533] = u16[v533] or v533.Material
                v533.Material = Enum.Material.Plaster
                v533.Reflectance = 0.5
                v533:AddTag("ClayVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p534, p535) --[[Function name: _RemoveFX, line 2194]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        local function v538(p536) --[[Anonymous function at line 2195]]
            for _, v537 in p536:GetDescendants() do
                if v537:HasTag("Cleanup_Clay") then
                    v537:Destroy()
                end
            end
        end
        if p535 then
            v538(p535)
        end
        if p534 then
            v538(p534)
        end
        for _, v539 in p534:GetDescendants() do
            if (v539:IsA("BasePart") or v539:IsA("UnionOperation")) and v539:HasTag("ClayVisual") then
                v539.Reflectance = 0
                v539.Color = u13[v539] or v539.Color
                u13[v539] = nil
                v539:RemoveTag("ClayVisual")
                if u16[v539] then
                    v539.Material = u16[v539]
                    u16[v539] = nil
                end
            end
        end
    end
}
u495.Ceramic = {
    ["Id"] = "L",
    ["Name"] = "Ceramic",
    ["ValueMulti"] = 32,
    ["Color"] = Color3.fromRGB(234, 184, 146),
    ["_AddFX"] = function(p540, p541, p542) --[[Function name: _AddFX, line 2230]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        p540:_RemoveFX(p541, p542)
        if p542 then
            for _, v543 in game.ServerStorage.Mutation_FX.Ceramic:GetChildren() do
                local v544 = v543:Clone()
                v544.Parent = p542
                v544.Enabled = true
                v544:AddTag("Cleanup_Ceramic")
            end
        end
        for _, v545 in p541:GetDescendants() do
            if (v545:IsA("BasePart") or v545:IsA("UnionOperation")) and not v545:HasTag("Effect") then
                u13[v545] = u13[v545] or v545.Color
                v545.Color = Color3.fromRGB(234, 184, 146)
                u16[v545] = u16[v545] or v545.Material
                v545.Material = Enum.Material.Concrete
                v545:AddTag("CeramicVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p546, p547) --[[Function name: _RemoveFX, line 2257]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        local function v550(p548) --[[Anonymous function at line 2258]]
            for _, v549 in p548:GetDescendants() do
                if v549:HasTag("Cleanup_Ceramic") then
                    v549:Destroy()
                end
            end
        end
        if p547 then
            v550(p547)
        end
        if p546 then
            v550(p546)
        end
        for _, v551 in p546:GetDescendants() do
            if (v551:IsA("BasePart") or v551:IsA("UnionOperation")) and v551:HasTag("CeramicVisual") then
                v551.Reflectance = 0
                v551.Color = u13[v551] or v551.Color
                u13[v551] = nil
                v551:RemoveTag("CeramicVisual")
                if u16[v551] then
                    v551.Material = u16[v551]
                    u16[v551] = nil
                end
            end
        end
    end
}
u495.Friendbound = {
    ["Id"] = "M",
    ["Name"] = "Friendbound",
    ["ValueMulti"] = 70,
    ["Color"] = Color3.fromRGB(255, 0, 127),
    ["_AddFX"] = function(p552, p553, p554) --[[Function name: _AddFX, line 2293]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        p552:_RemoveFX(p553, p554)
        if p554 then
            for _, v555 in game.ServerStorage.Mutation_FX.Friendbound:GetChildren() do
                local v556 = v555:Clone()
                v556.Parent = p554
                v556.Enabled = true
                v556:AddTag("Cleanup_Friendbound")
            end
        end
        for _, v557 in p553:GetDescendants() do
            if (v557:IsA("BasePart") or v557:IsA("UnionOperation")) and not v557:HasTag("Effect") then
                u13[v557] = u13[v557] or v557.Color
                v557.Color = u13[v557]:Lerp(Color3.fromRGB(255, 0, 127), 0.4)
                v557:AddTag("FriendboundVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p558, p559) --[[Function name: _RemoveFX, line 2325]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        local function v562(p560) --[[Anonymous function at line 2326]]
            for _, v561 in p560:GetDescendants() do
                if v561:HasTag("Cleanup_Friendbound") then
                    v561:Destroy()
                end
            end
        end
        if p559 then
            v562(p559)
        end
        if p558 then
            v562(p558)
        end
        for _, v563 in p558:GetDescendants() do
            if (v563:IsA("BasePart") or v563:IsA("UnionOperation")) and v563:HasTag("FriendboundVisual") then
                v563.Color = u13[v563] or v563.Color
                u13[v563] = nil
                v563:RemoveTag("FriendboundVisual")
            end
        end
    end
}
u495.Tempestuous = {
    ["Id"] = "N",
    ["Name"] = "Tempestuous",
    ["ValueMulti"] = 12,
    ["Color"] = Color3.fromRGB(143, 163, 180),
    ["_AddFX"] = function(p564, p565, p566) --[[Function name: _AddFX, line 2356]]
        p564:_RemoveFX(p565, p566)
        if p566 then
            for _, v567 in { game.ServerStorage.Mutation_FX.Twisted, game.ServerStorage.Mutation_FX.Tempestous } do
                for _, v568 in v567:GetChildren() do
                    local v569 = v568:Clone()
                    v569.Parent = p566
                    v569.Enabled = true
                    v569:AddTag("Cleanup_Tempestuous")
                end
            end
        end
        for _, v570 in p565:GetDescendants() do
            if (v570:IsA("BasePart") or v570:IsA("UnionOperation")) and not v570:HasTag("Effect") then
                v570:AddTag("TempestuousVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p571, p572) --[[Function name: _RemoveFX, line 2383]]
        if p572 then
            for _, v573 in p572:GetChildren() do
                if v573:HasTag("Cleanup_Tempestuous") then
                    v573:Destroy()
                end
            end
        end
        for _, v574 in p571:GetDescendants() do
            if (v574:IsA("BasePart") or v574:IsA("UnionOperation")) and v574:HasTag("TempestuousVisual") then
                v574:RemoveTag("TempestuousVisual")
            end
        end
    end
}
u495.Infected = {
    ["Id"] = "O",
    ["Name"] = "Infected",
    ["ValueMulti"] = 75,
    ["Color"] = Color3.fromRGB(67, 167, 0),
    ["_AddFX"] = function(p575, p576, p577) --[[Function name: _AddFX, line 2408]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        p575:_RemoveFX(p576, p577)
        if p577 then
            for _, v578 in game.ServerStorage.Mutation_FX.Infected:GetChildren() do
                local v579 = v578:Clone()
                v579.Parent = p577
                v579.Enabled = true
                v579:AddTag("Cleanup_Infected")
            end
        end
        for _, v580 in p576:GetDescendants() do
            if (v580:IsA("BasePart") or v580:IsA("UnionOperation")) and not v580:HasTag("Effect") then
                u13[v580] = u13[v580] or v580.Color
                v580.Color = Color3.fromRGB(65, 175, 0)
                u16[v580] = u16[v580] or v580.Material
                v580:AddTag("InfectedVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p581, p582) --[[Function name: _RemoveFX, line 2435]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        local function v585(p583) --[[Anonymous function at line 2436]]
            for _, v584 in p583:GetDescendants() do
                if v584:HasTag("Cleanup_Infected") then
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
            if (v586:IsA("BasePart") or v586:IsA("UnionOperation")) and v586:HasTag("InfectedVisual") then
                v586.Reflectance = 0
                v586.Color = u13[v586] or v586.Color
                u13[v586] = nil
                v586:RemoveTag("InfectedVisual")
                if u16[v586] then
                    v586.Material = u16[v586]
                    u16[v586] = nil
                end
            end
        end
    end
}
u495.Radioactive = {
    ["Id"] = "P",
    ["Name"] = "Radioactive",
    ["ValueMulti"] = 55,
    ["Color"] = Color3.fromRGB(98, 255, 0),
    ["_AddFX"] = function(p587, p588, p589) --[[Function name: _AddFX, line 2471]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        p587:_RemoveFX(p588, p589)
        if p589 then
            for _, v590 in game.ServerStorage.Mutation_FX.Radioactive:GetChildren() do
                local v591 = v590:Clone()
                v591.Parent = p589
                v591.Enabled = true
                v591:AddTag("Cleanup_Radioactive")
            end
        end
        for _, v592 in p588:GetDescendants() do
            if (v592:IsA("BasePart") or v592:IsA("UnionOperation")) and not v592:HasTag("Effect") then
                u13[v592] = u13[v592] or v592.Color
                v592.Color = Color3.fromRGB(65, 175, 0)
                u16[v592] = u16[v592] or v592.Material
                v592.Material = Enum.Material.Neon
                v592:AddTag("RadioactiveVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p593, p594) --[[Function name: _RemoveFX, line 2498]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        local function v597(p595) --[[Anonymous function at line 2499]]
            for _, v596 in p595:GetDescendants() do
                if v596:HasTag("Cleanup_Radioactive") then
                    v596:Destroy()
                end
            end
        end
        if p594 then
            v597(p594)
        end
        if p593 then
            v597(p593)
        end
        for _, v598 in p593:GetDescendants() do
            if (v598:IsA("BasePart") or v598:IsA("UnionOperation")) and v598:HasTag("RadioactiveVisual") then
                v598.Reflectance = 0
                v598.Color = u13[v598] or v598.Color
                u13[v598] = nil
                v598:RemoveTag("RadioactiveVisual")
                if u16[v598] then
                    v598.Material = u16[v598]
                    u16[v598] = nil
                end
            end
        end
    end
}
u495.Chakra = {
    ["Id"] = "R",
    ["Name"] = "Chakra",
    ["ValueMulti"] = 15,
    ["Color"] = Color3.fromRGB(255, 80, 65),
    ["_AddFX"] = function(p599, p600, p601) --[[Function name: _AddFX, line 2534]]
        p599:_RemoveFX(p600, p601)
        local v602 = game.ServerStorage.Mutation_FX.Chakra:GetChildren()
        if p601 then
            for _, v603 in v602 do
                local v604 = v603:Clone()
                v604.Parent = p601
                v604.Enabled = true
                v604:AddTag("Cleanup_Chakra")
            end
        end
        local v605 = 0
        for _, v606 in p600:GetDescendants() do
            if v606:IsA("BasePart") and v606 ~= p601 then
                v605 = v605 + 1
                if v605 % 3 == 0 then
                    local v607 = v602[math.random(1, #v602)]:Clone()
                    v607.Parent = v606
                    v607.Enabled = true
                    v607:AddTag("Cleanup_Chakra")
                end
            end
        end
    end,
    ["_RemoveFX"] = function(_, p608, p609) --[[Function name: _RemoveFX, line 2563]]
        local function v612(p610) --[[Anonymous function at line 2564]]
            for _, v611 in p610:GetDescendants() do
                if v611:HasTag("Cleanup_Chakra") then
                    v611:Destroy()
                end
            end
        end
        if p609 then
            v612(p609)
        end
        if p608 then
            v612(p608)
        end
    end
}
u495.FoxfireChakra = {
    ["Id"] = "S",
    ["Name"] = "FoxfireChakra",
    ["ValueMulti"] = 90,
    ["Color"] = Color3.fromRGB(255, 80, 65),
    ["_AddFX"] = function(p613, p614, p615) --[[Function name: _AddFX, line 2583]]
        p613:_RemoveFX(p614, p615)
        local v616 = game.ServerStorage.Mutation_FX.FoxfireChakra:GetChildren()
        local v617 = nil
        for _, v618 in v616 do
            if v618.Name == "Flames" then
                v617 = v618
                break
            end
        end
        if p615 then
            for _, v619 in v616 do
                local v620 = v619:Clone()
                v620.Parent = p615
                v620.Enabled = true
                v620:AddTag("Cleanup_FoxfireChakra")
            end
        end
        local v621 = 0
        for _, v622 in p614:GetDescendants() do
            if v622:IsA("BasePart") and v622 ~= p615 then
                v621 = v621 + 1
                if v621 % 2 == 0 then
                    local v623 = v616[math.random(1, #v616)]:Clone()
                    v623.Parent = v622
                    v623.Enabled = true
                    v623:AddTag("Cleanup_FoxfireChakra")
                end
                if v621 % 3 == 0 and v617 then
                    local v624 = v617:Clone()
                    v624.Parent = v622
                    v624.Enabled = true
                    v624:AddTag("Cleanup_FoxfireChakra")
                end
            end
        end
    end,
    ["_RemoveFX"] = function(_, p625, p626) --[[Function name: _RemoveFX, line 2628]]
        local function v629(p627) --[[Anonymous function at line 2629]]
            for _, v628 in p627:GetDescendants() do
                if v628:HasTag("Cleanup_FoxfireChakra") then
                    v628:Destroy()
                end
            end
        end
        if p626 then
            v629(p626)
        end
        if p625 then
            v629(p625)
        end
    end
}
u495.CorruptChakra = {
    ["Id"] = "T",
    ["Name"] = "CorruptChakra",
    ["ValueMulti"] = 15,
    ["Color"] = Color3.fromRGB(0, 85, 255),
    ["_AddFX"] = function(p630, p631, p632) --[[Function name: _AddFX, line 2648]]
        p630:_RemoveFX(p631, p632)
        local v633 = game.ServerStorage.Mutation_FX.CorruptChakra:GetChildren()
        if p632 then
            for _, v634 in v633 do
                local v635 = v634:Clone()
                v635.Parent = p632
                v635.Enabled = true
                v635:AddTag("Cleanup_CorruptChakra")
            end
        end
        local v636 = 0
        for _, v637 in p631:GetDescendants() do
            if v637:IsA("BasePart") and v637 ~= p632 then
                v636 = v636 + 1
                if v636 % 3 == 0 then
                    local v638 = v633[math.random(1, #v633)]:Clone()
                    v638.Parent = v637
                    v638.Enabled = true
                    v638:AddTag("Cleanup_CorruptChakra")
                end
            end
        end
    end,
    ["_RemoveFX"] = function(_, p639, p640) --[[Function name: _RemoveFX, line 2677]]
        local function v643(p641) --[[Anonymous function at line 2678]]
            for _, v642 in p641:GetDescendants() do
                if v642:HasTag("Cleanup_CorruptChakra") then
                    v642:Destroy()
                end
            end
        end
        if p640 then
            v643(p640)
        end
        if p639 then
            v643(p639)
        end
    end
}
u495.CorruptFoxfireChakra = {
    ["Id"] = "U",
    ["Name"] = "CorruptFoxfireChakra",
    ["ValueMulti"] = 90,
    ["Color"] = Color3.fromRGB(0, 0, 255),
    ["_AddFX"] = function(p644, p645, p646) --[[Function name: _AddFX, line 2697]]
        p644:_RemoveFX(p645, p646)
        local v647 = game.ServerStorage.Mutation_FX.CorruptFoxfireChakra:GetChildren()
        local v648 = nil
        for _, v649 in v647 do
            if v649.Name == "Flames" then
                v648 = v649
                break
            end
        end
        if p646 then
            for _, v650 in v647 do
                local v651 = v650:Clone()
                v651.Parent = p646
                v651.Enabled = true
                v651:AddTag("Cleanup_CorruptFoxfireChakra")
            end
        end
        local v652 = 0
        for _, v653 in p645:GetDescendants() do
            if v653:IsA("BasePart") and v653 ~= p646 then
                v652 = v652 + 1
                if v652 % 2 == 0 then
                    local v654 = v647[math.random(1, #v647)]:Clone()
                    v654.Parent = v653
                    v654.Enabled = true
                    v654:AddTag("Cleanup_CorruptFoxfireChakra")
                end
                if v652 % 3 == 0 and v648 then
                    local v655 = v648:Clone()
                    v655.Parent = v653
                    v655.Enabled = true
                    v655:AddTag("Cleanup_CorruptFoxfireChakra")
                end
            end
        end
    end,
    ["_RemoveFX"] = function(_, p656, p657) --[[Function name: _RemoveFX, line 2742]]
        local function v660(p658) --[[Anonymous function at line 2743]]
            for _, v659 in p658:GetDescendants() do
                if v659:HasTag("Cleanup_CorruptFoxfireChakra") then
                    v659:Destroy()
                end
            end
        end
        if p657 then
            v660(p657)
        end
        if p656 then
            v660(p656)
        end
    end
}
u495.Static = {
    ["Id"] = "V",
    ["Name"] = "Static",
    ["ValueMulti"] = 8,
    ["Color"] = Color3.fromRGB(255, 255, 0),
    ["_AddFX"] = function(p661, p662, p663) --[[Function name: _AddFX, line 2762]]
        p661:_RemoveFX(p662, p663)
        if p663 then
            for _, v664 in game.ServerStorage.Mutation_FX.Static:GetChildren() do
                local v665 = v664:Clone()
                v665.Parent = p663
                v665:AddTag("Cleanup_Static")
            end
        end
    end,
    ["_RemoveFX"] = function(_, _, p666) --[[Function name: _RemoveFX, line 2775]]
        if p666 then
            for _, v667 in p666:GetChildren() do
                if v667:HasTag("Cleanup_Static") then
                    v667:Destroy()
                end
            end
        end
    end
}
u495.HarmonisedChakra = {
    ["Id"] = "W",
    ["Name"] = "HarmonisedChakra",
    ["ValueMulti"] = 35,
    ["Color"] = Color3.fromRGB(170, 85, 255),
    ["_AddFX"] = function(p668, p669, p670) --[[Function name: _AddFX, line 2791]]
        p668:_RemoveFX(p669, p670)
        local v671 = game.ServerStorage.Mutation_FX.HarmonisedChakra:GetChildren()
        if p670 then
            for _, v672 in v671 do
                local v673 = v672:Clone()
                v673.Parent = p670
                v673.Enabled = true
                v673:AddTag("Cleanup_HarmonisedChakra")
            end
        end
        local v674 = 0
        for _, v675 in p669:GetDescendants() do
            if v675:IsA("BasePart") and v675 ~= p670 then
                v674 = v674 + 1
                if v674 % 3 == 0 then
                    local v676 = v671[math.random(1, #v671)]:Clone()
                    v676.Parent = v675
                    v676.Enabled = true
                    v676:AddTag("Cleanup_HarmonisedChakra")
                end
            end
        end
    end,
    ["_RemoveFX"] = function(_, p677, p678) --[[Function name: _RemoveFX, line 2820]]
        local function v681(p679) --[[Anonymous function at line 2821]]
            for _, v680 in p679:GetDescendants() do
                if v680:HasTag("Cleanup_HarmonisedChakra") then
                    v680:Destroy()
                end
            end
        end
        if p678 then
            v681(p678)
        end
        if p677 then
            v681(p677)
        end
    end
}
u495.HarmonisedFoxfireChakra = {
    ["Id"] = "X",
    ["Name"] = "HarmonisedFoxfireChakra",
    ["ValueMulti"] = 190,
    ["Color"] = Color3.fromRGB(170, 85, 255),
    ["_AddFX"] = function(p682, p683, p684) --[[Function name: _AddFX, line 2840]]
        p682:_RemoveFX(p683, p684)
        local v685 = game.ServerStorage.Mutation_FX.HarmonisedFoxfireChakra:GetChildren()
        local v686 = nil
        for _, v687 in v685 do
            if v687.Name == "Flames" then
                v686 = v687
                break
            end
        end
        if p684 then
            for _, v688 in v685 do
                local v689 = v688:Clone()
                v689.Parent = p684
                v689.Enabled = true
                v689:AddTag("Cleanup_HarmonisedFoxfireChakra")
            end
        end
        local v690 = 0
        for _, v691 in p683:GetDescendants() do
            if v691:IsA("BasePart") and v691 ~= p684 then
                v690 = v690 + 1
                if v690 % 2 == 0 then
                    local v692 = v685[math.random(1, #v685)]:Clone()
                    v692.Parent = v691
                    v692.Enabled = true
                    v692:AddTag("Cleanup_HarmonisedFoxfireChakra")
                end
                if v690 % 3 == 0 and v686 then
                    local v693 = v686:Clone()
                    v693.Parent = v691
                    v693.Enabled = true
                    v693:AddTag("Cleanup_HarmonisedFoxfireChakra")
                end
            end
        end
    end,
    ["_RemoveFX"] = function(_, p694, p695) --[[Function name: _RemoveFX, line 2885]]
        local function v698(p696) --[[Anonymous function at line 2886]]
            for _, v697 in p696:GetDescendants() do
                if v697:HasTag("Cleanup_HarmonisedFoxfireChakra") then
                    v697:Destroy()
                end
            end
        end
        if p695 then
            v698(p695)
        end
        if p694 then
            v698(p694)
        end
    end
}
u495.Pasta = {
    ["Id"] = "PA",
    ["Name"] = "Pasta",
    ["ValueMulti"] = 3,
    ["Color"] = Color3.fromRGB(255, 223, 128),
    ["_AddFX"] = function(p699, p700, p701) --[[Function name: _AddFX, line 2905]]
        p699:_RemoveFX(p700, p701)
        local v702 = {}
        for _, v703 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
            if v703.Name == "Pasta" then
                table.insert(v702, v703)
            end
        end
        if p701 then
            for _, v704 in v702 do
                if not p701:FindFirstChild(v704.Name) then
                    local v705 = v704:Clone()
                    v705.Parent = p701
                    v705.Enabled = true
                    v705:AddTag("Cleanup_Pasta")
                end
            end
        end
    end,
    ["_RemoveFX"] = function(_, p706, p707) --[[Function name: _RemoveFX, line 2929]]
        local function v710(p708) --[[Anonymous function at line 2930]]
            for _, v709 in p708:GetDescendants() do
                if v709:HasTag("Cleanup_Pasta") then
                    v709:Destroy()
                end
            end
        end
        if p707 then
            v710(p707)
        end
        if p706 then
            v710(p706)
        end
    end
}
u495.Sauce = {
    ["Id"] = "SA",
    ["Name"] = "Sauce",
    ["ValueMulti"] = 3,
    ["Color"] = Color3.fromRGB(200, 45, 35),
    ["_AddFX"] = function(p711, p712, p713) --[[Function name: _AddFX, line 2948]]
        p711:_RemoveFX(p712, p713)
        local v714 = {}
        for _, v715 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
            if v715.Name == "Sauce" then
                table.insert(v714, v715)
            end
        end
        if p713 then
            for _, v716 in v714 do
                if not p713:FindFirstChild(v716.Name) then
                    local v717 = v716:Clone()
                    v717.Parent = p713
                    v717.Enabled = true
                    v717:AddTag("Cleanup_Sauce")
                end
            end
        end
    end,
    ["_RemoveFX"] = function(_, p718, p719) --[[Function name: _RemoveFX, line 2972]]
        local function v722(p720) --[[Anonymous function at line 2973]]
            for _, v721 in p720:GetDescendants() do
                if v721:HasTag("Cleanup_Sauce") then
                    v721:Destroy()
                end
            end
        end
        if p719 then
            v722(p719)
        end
        if p718 then
            v722(p718)
        end
    end
}
u495.Meatball = {
    ["Id"] = "MB",
    ["Name"] = "Meatball",
    ["ValueMulti"] = 3,
    ["Color"] = Color3.fromRGB(139, 69, 19),
    ["_AddFX"] = function(p723, p724, p725) --[[Function name: _AddFX, line 2991]]
        p723:_RemoveFX(p724, p725)
        local v726 = {}
        for _, v727 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
            if v727.Name == "Meatball" then
                table.insert(v726, v727)
            end
        end
        if p725 then
            for _, v728 in v726 do
                if not p725:FindFirstChild(v728.Name) then
                    local v729 = v728:Clone()
                    v729.Parent = p725
                    v729.Enabled = true
                    v729:AddTag("Cleanup_Meatball")
                end
            end
        end
    end,
    ["_RemoveFX"] = function(_, p730, p731) --[[Function name: _RemoveFX, line 3015]]
        local function v734(p732) --[[Anonymous function at line 3016]]
            for _, v733 in p732:GetDescendants() do
                if v733:HasTag("Cleanup_Meatball") then
                    v733:Destroy()
                end
            end
        end
        if p731 then
            v734(p731)
        end
        if p730 then
            v734(p730)
        end
    end
}
u495.Spaghetti = {
    ["Id"] = "SP",
    ["Name"] = "Spaghetti",
    ["ValueMulti"] = 15,
    ["Color"] = Color3.fromRGB(255, 140, 70),
    ["_AddFX"] = function(p735, p736, p737) --[[Function name: _AddFX, line 3034]]
        p735:_RemoveFX(p736, p737)
        local v738 = game.ServerStorage.Mutation_FX.Spaghetti:GetChildren()
        if p737 then
            for _, v739 in v738 do
                if not p737:FindFirstChild(v739.Name) then
                    local v740 = v739:Clone()
                    v740.Parent = p737
                    v740.Enabled = true
                    v740:AddTag("Cleanup_Spaghetti")
                end
            end
        end
    end,
    ["_RemoveFX"] = function(_, p741, p742) --[[Function name: _RemoveFX, line 3051]]
        local function v745(p743) --[[Anonymous function at line 3052]]
            for _, v744 in p743:GetDescendants() do
                if v744:HasTag("Cleanup_Spaghetti") then
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
u495.Eclipsed = {
    ["Id"] = "EC",
    ["Name"] = "Eclipsed",
    ["ValueMulti"] = 20,
    ["Color"] = Color3.fromRGB(44, 111, 162),
    ["_AddFX"] = function(p746, p747, p748) --[[Function name: _AddFX, line 3070]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        p746:_RemoveFX(p747, p748)
        if p748 then
            for _, v749 in game.ServerStorage.Mutation_FX.Eclipsed:GetChildren() do
                local v750 = v749:Clone()
                v750.Parent = p748
                v750.Enabled = true
                v750:AddTag("Cleanup_Eclipsed")
            end
        end
        for _, v751 in p747:GetDescendants() do
            if (v751:IsA("BasePart") or v751:IsA("UnionOperation")) and (not v751:HasTag("Effect") and (not v751.Transparency or v751.Transparency ~= 1)) then
                u13[v751] = u13[v751] or v751.Color
                v751.Color = v751.Color:Lerp(Color3.fromRGB(0, 0, 0), 0.45)
                v751:AddTag("EclipsedVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p752, p753) --[[Function name: _RemoveFX, line 3096]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        if p753 then
            for _, v754 in p753:GetChildren() do
                if v754:HasTag("Cleanup_Eclipsed") then
                    v754:Destroy()
                end
            end
        end
        for _, v755 in p752:GetDescendants() do
            if (v755:IsA("BasePart") or v755:IsA("UnionOperation")) and v755:HasTag("EclipsedVisual") then
                v755.Color = u13[v755] or v755.Color
                u13[v755] = nil
                v755:RemoveTag("EclipsedVisual")
            end
        end
    end
}
u495.Enlightened = {
    ["Id"] = "EN",
    ["Name"] = "Enlightened",
    ["ValueMulti"] = 35,
    ["Color"] = Color3.fromRGB(255, 255, 255),
    ["_AddFX"] = function(p756, p757, p758) --[[Function name: _AddFX, line 3123]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        p756:_RemoveFX(p757, p758)
        local v759 = Color3.fromRGB(218, 133, 65)
        local v760 = {}
        for _, v761 in p757:GetDescendants() do
            if (v761:IsA("BasePart") or v761:IsA("UnionOperation")) and not v761:HasTag("Effect") then
                local v762 = v761.Color
                v760[v762] = (v760[v762] or 0) + 1
            end
        end
        local v763 = 0
        for v764, v765 in pairs(v760) do
            if v763 <= v765 then
                v759 = v764
                v763 = v765
            end
        end
        for _, v766 in p757:GetDescendants() do
            if (v766:IsA("BasePart") or v766:IsA("UnionOperation")) and (not v766:HasTag("Effect") and (not v766.Transparency or v766.Transparency ~= 1) and v766.Color == v759) then
                u13[v766] = u13[v766] or v766.Color
                v766.Color = Color3.fromRGB(218, 133, 65)
                u16[v766] = u16[v766] or v766.Material
                v766.Material = Enum.Material.Neon
                v766:AddTag("EnlightenedVisual")
            end
        end
        if p758 then
            for _, v767 in game.ServerStorage.Mutation_FX.Enlightened:GetChildren() do
                local v768 = v767:Clone()
                v768.Parent = p758
                v768.Enabled = true
                v768:AddTag("Cleanup_Enlightened")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p769, p770) --[[Function name: _RemoveFX, line 3173]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        local function v773(p771) --[[Anonymous function at line 3175]]
            for _, v772 in p771:GetDescendants() do
                if v772:HasTag("Cleanup_Enlightened") then
                    v772:Destroy()
                end
            end
        end
        if p770 then
            v773(p770)
        end
        if p769 then
            v773(p769)
        end
        for _, v774 in p769:GetDescendants() do
            if (v774:IsA("BasePart") or v774:IsA("UnionOperation")) and v774:HasTag("EnlightenedVisual") then
                v774.Color = u13[v774] or v774.Color
                u13[v774] = nil
                v774:RemoveTag("EnlightenedVisual")
                if u16[v774] then
                    v774.Material = u16[v774]
                    u16[v774] = nil
                end
            end
        end
    end
}
u495.Tranquil = {
    ["Id"] = "TQ",
    ["Name"] = "Tranquil",
    ["ValueMulti"] = 20,
    ["Color"] = Color3.fromRGB(255, 255, 255),
    ["_AddFX"] = function(p775, p776, p777) --[[Function name: _AddFX, line 3206]]
        p775:_RemoveFX(p776, p777)
        local v778 = p776:FindFirstChild("Item_Seed")
        local v779 = not (v778 and v778:IsA("NumberValue")) and 0 or v778.Value
        local v780 = Random.new(v779)
        local v781 = game.ServerStorage.Mutation_FX.Tranquil:GetChildren()
        local v782 = 0
        for _, v783 in p776:GetDescendants() do
            if (v783:IsA("BasePart") or v783:IsA("UnionOperation")) and not v783:HasTag("Effect") then
                v782 = v782 + 1
                if v782 % 5 == 0 or v782 == 1 then
                    local v784 = v781[v780:NextInteger(1, #v781)]:Clone()
                    v784.Enabled = true
                    v784.Rate = v780:NextInteger(30, 50) * 0.01
                    v784.Parent = v783
                    v784:AddTag("Cleanup_Tranquil")
                end
            end
        end
    end,
    ["_RemoveFX"] = function(_, p785, p786) --[[Function name: _RemoveFX, line 3231]]
        local function v789(p787) --[[Anonymous function at line 3233]]
            for _, v788 in p787:GetDescendants() do
                if v788:HasTag("Cleanup_Tranquil") then
                    v788:Destroy()
                end
            end
        end
        if p786 then
            v789(p786)
        end
        if p785 then
            v789(p785)
        end
    end
}
u495.Corrupt = {
    ["Id"] = "CR",
    ["Name"] = "Corrupt",
    ["ValueMulti"] = 20,
    ["Color"] = Color3.fromRGB(176, 23, 26),
    ["_AddFX"] = function(p790, p791, p792) --[[Function name: _AddFX, line 3250]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        p790:_RemoveFX(p791, p792)
        if p792 then
            for _, v793 in game.ServerStorage.Mutation_FX.Corrupt:GetChildren() do
                local v794 = v793:Clone()
                v794.Parent = p792
                v794:AddTag("Cleanup_Infected")
                if v794:IsA("ParticleEmitter") then
                    v794.Enabled = true
                end
            end
        end
        for _, v795 in p791:GetDescendants() do
            if (v795:IsA("BasePart") or v795:IsA("UnionOperation")) and (not v795:HasTag("Effect") and (not v795.Transparency or v795.Transparency ~= 1)) then
                u13[v795] = u13[v795] or v795.Color
                v795.Color = v795.Color:Lerp(Color3.fromRGB(176, 23, 26), 0.5)
                v795:AddTag("CorruptVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p796, p797) --[[Function name: _RemoveFX, line 3275]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        local function v800(p798) --[[Anonymous function at line 3276]]
            for _, v799 in p798:GetDescendants() do
                if v799:HasTag("Cleanup_Corrupt") then
                    v799:Destroy()
                end
            end
        end
        if p797 then
            v800(p797)
        end
        for _, v801 in p796:GetDescendants() do
            if (v801:IsA("BasePart") or v801:IsA("UnionOperation")) and v801:HasTag("CorruptVisual") then
                v801.Color = u13[v801] or v801.Color
                u13[v801] = nil
                v801:RemoveTag("CorruptVisual")
                if u16[v801] then
                    v801.Material = u16[v801]
                    u16[v801] = nil
                end
            end
        end
    end
}
u495.Toxic = {
    ["Id"] = "TX",
    ["Name"] = "Toxic",
    ["ValueMulti"] = 12,
    ["Color"] = Color3.fromRGB(85, 255, 0),
    ["_AddFX"] = function(p802, p803, p804) --[[Function name: _AddFX, line 3304]]
        p802:_RemoveFX(p803, p804)
        if p804 then
            for _, v805 in game.ServerStorage.Mutation_FX.Toxic:GetChildren() do
                local v806 = v805:Clone()
                v806.Parent = p804
                v806.Enabled = true
                v806:AddTag("Cleanup_Toxic")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p807, p808) --[[Function name: _RemoveFX, line 3318]]
        local function v811(p809) --[[Anonymous function at line 3319]]
            for _, v810 in p809:GetDescendants() do
                if v810:HasTag("Cleanup_Toxic") then
                    v810:Destroy()
                end
            end
        end
        if p808 then
            v811(p808)
        end
        if p807 then
            v811(p807)
        end
    end
}
u495.Acidic = {
    ["Id"] = "AC",
    ["Name"] = "Acidic",
    ["ValueMulti"] = 15,
    ["Color"] = Color3.fromRGB(224, 245, 129),
    ["_AddFX"] = function(p812, p813, p814) --[[Function name: _AddFX, line 3336]]
        p812:_RemoveFX(p813, p814)
        if p814 then
            for _, v815 in game.ServerStorage.Mutation_FX.Acidic:GetChildren() do
                local v816 = v815:Clone()
                v816.Parent = p814
                v816.Enabled = true
                v816:AddTag("Cleanup_Acidic")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p817, p818) --[[Function name: _RemoveFX, line 3349]]
        local function v821(p819) --[[Anonymous function at line 3350]]
            for _, v820 in p819:GetDescendants() do
                if v820:HasTag("Cleanup_Acidic") then
                    v820:Destroy()
                end
            end
        end
        if p818 then
            v821(p818)
        end
        if p817 then
            v821(p817)
        end
    end
}
u495.Oil = {
    ["Id"] = "OL",
    ["Name"] = "Oil",
    ["ValueMulti"] = 15,
    ["Color"] = Color3.fromRGB(52, 52, 77),
    ["_AddFX"] = function(p822, p823, p824) --[[Function name: _AddFX, line 3367]]
        p822:_RemoveFX(p823, p824)
        if p824 then
            for _, v825 in game.ServerStorage.Mutation_FX.Oil:GetChildren() do
                local v826 = v825:Clone()
                v826.Parent = p824
                v826.Enabled = true
                v826:AddTag("Cleanup_Oil")
                v826:AddTag("Effect")
            end
        end
        for _, v827 in p823:GetDescendants() do
            if (v827:IsA("BasePart") or v827:IsA("UnionOperation")) and not v827:HasTag("Effect") then
                v827:AddTag("OilVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p828, p829) --[[Function name: _RemoveFX, line 3387]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        if p829 then
            for _, v830 in p829:GetChildren() do
                if v830:HasTag("Cleanup_Oil") then
                    v830:Destroy()
                end
            end
        end
        for _, v831 in p828:GetDescendants() do
            if (v831:IsA("BasePart") or v831:IsA("UnionOperation")) and v831:HasTag("OilVisual") then
                v831:RemoveTag("OilVisual")
                local v832 = u16[v831]
                if v832 then
                    v831.Material = v832
                    u16[v831] = nil
                end
            end
        end
    end
}
u495.Boil = {
    ["Id"] = "BOL",
    ["Name"] = "Boil",
    ["ValueMulti"] = 15,
    ["Color"] = Color3.fromRGB(150, 178, 225),
    ["_AddFX"] = function(p833, p834, p835) --[[Function name: _AddFX, line 3416]]
        p833:_RemoveFX(p834, p835)
        if p835 then
            for _, v836 in game.ServerStorage.Mutation_FX.Boil:GetChildren() do
                local v837 = v836:Clone()
                v837.Parent = p835
                v837.Enabled = true
                v837:AddTag("Cleanup_Boil")
                v837:AddTag("Effect")
            end
        end
    end,
    ["_RemoveFX"] = function(_, _, p838) --[[Function name: _RemoveFX, line 3431]]
        if p838 then
            for _, v839 in p838:GetChildren() do
                if v839:HasTag("Cleanup_Boil") then
                    v839:Destroy()
                end
            end
        end
    end
}
u495.Fortune = {
    ["Id"] = "FR",
    ["Name"] = "Fortune",
    ["ValueMulti"] = 50,
    ["Color"] = Color3.fromRGB(255, 192, 5),
    ["_AddFX"] = function(p840, p841, p842) --[[Function name: _AddFX, line 3446]]
        p840:_RemoveFX(p841, p842)
        if p842 then
            for _, v843 in game.ServerStorage.Mutation_FX.Fortune:GetChildren() do
                local v844 = v843:Clone()
                v844.Parent = p842
                v844.Enabled = true
                v844:AddTag("Cleanup_Fortune")
                v844:AddTag("Effect")
            end
        end
    end,
    ["_RemoveFX"] = function(_, _, p845) --[[Function name: _RemoveFX, line 3461]]
        if p845 then
            for _, v846 in p845:GetChildren() do
                if v846:HasTag("Cleanup_Fortune") then
                    v846:Destroy()
                end
            end
        end
    end
}
u495.Bloom = {
    ["Id"] = "BL",
    ["Name"] = "Bloom",
    ["ValueMulti"] = 8,
    ["Color"] = Color3.fromRGB(170, 255, 0),
    ["_AddFX"] = function(p847, p848, p849) --[[Function name: _AddFX, line 3476]]
        p847:_RemoveFX(p848, p849)
        local v850 = game.ServerStorage.Mutation_FX.Bloom:GetChildren()
        if p849 then
            for _, v851 in v850 do
                if not p849:FindFirstChild(v851.Name) then
                    local v852 = v851:Clone()
                    v852.Parent = p849
                    v852.Enabled = true
                    v852:AddTag("Cleanup_Bloom")
                    v852:AddTag("Effect")
                end
            end
        end
        local v853 = {}
        for _, v854 in p848:GetDescendants() do
            if v854:IsA("BasePart") and v854 ~= p849 then
                table.insert(v853, v854)
            end
        end
        (function(p855) --[[Function name: Shuffle, line 3503]]
            for v856 = #p855, 2, -1 do
                local v857 = math.random(1, v856)
                local v858 = p855[v857]
                local v859 = p855[v856]
                p855[v856] = v858
                p855[v857] = v859
            end
            return p855
        end)(v853)
        local v860 = #v853 * 0.25 + 0.5
        for v861 = 1, math.floor(v860) do
            local v862 = v853[v861]
            local v863 = v850[math.random(1, #v850)]:Clone()
            v863.Parent = v862
            v863.Enabled = true
            v863:AddTag("Cleanup_Bloom")
            v863:AddTag("Effect")
        end
    end,
    ["_RemoveFX"] = function(_, p864, p865) --[[Function name: _RemoveFX, line 3524]]
        local function v868(p866) --[[Anonymous function at line 3525]]
            for _, v867 in p866:GetDescendants() do
                if v867:HasTag("Cleanup_Bloom") then
                    v867:Destroy()
                end
            end
        end
        if p865 then
            v868(p865)
        end
        if p864 then
            v868(p864)
        end
    end
}
u495.Jackpot = {
    ["Id"] = "JA",
    ["Name"] = "Jackpot",
    ["ValueMulti"] = 15,
    ["Color"] = Color3.fromRGB(132, 245, 112),
    ["_AddFX"] = function(p869, p870, p871) --[[Function name: _AddFX, line 3545]]
        p869:_RemoveFX(p870, p871)
        if p871 then
            for _, v872 in game.ServerStorage.Mutation_FX.Jackpot:GetChildren() do
                local v873 = v872:Clone()
                v873.Parent = p871
                v873:AddTag("Cleanup_Jackpot")
                if v873:IsA("ParticleEmitter") then
                    v873.Enabled = true
                end
            end
        end
    end,
    ["_RemoveFX"] = function(_, _, p874) --[[Function name: _RemoveFX, line 3558]]
        local function v877(p875) --[[Anonymous function at line 3559]]
            for _, v876 in p875:GetDescendants() do
                if v876:HasTag("Cleanup_Jackpot") then
                    v876:Destroy()
                end
            end
        end
        if p874 then
            v877(p874)
        end
    end
}
u495.Blitzshock = {
    ["Id"] = "BS",
    ["Name"] = "Blitzshock",
    ["ValueMulti"] = 50,
    ["Color"] = Color3.fromRGB(0, 192, 245),
    ["_AddFX"] = function(p878, p879, p880) --[[Function name: _AddFX, line 3576]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u13
        --]]
        p878:_RemoveFX(p879, p880)
        if p880 then
            for _, v881 in game.ServerStorage.Mutation_FX.Blitzshock:GetChildren() do
                local v882 = v881:Clone()
                v882.Parent = p880
                v882:AddTag("Cleanup_Blitzshock")
                if v882:IsA("ParticleEmitter") then
                    v882.Enabled = true
                end
            end
        end
        for _, v883 in p879:GetDescendants() do
            if (v883:IsA("BasePart") or v883:IsA("UnionOperation")) and (not v883:HasTag("Effect") and (not v883.Transparency or v883.Transparency ~= 1)) then
                u16[v883] = u16[v883] or v883.Material
                v883.Material = Enum.Material.Neon
                u13[v883] = u13[v883] or v883.Color
                v883.Color = v883.Color:Lerp(Color3.fromRGB(0, 170, 255), 0.5)
                v883:AddTag("BlitzshockVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p884, p885) --[[Function name: _RemoveFX, line 3604]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        local function v888(p886) --[[Anonymous function at line 3606]]
            for _, v887 in p886:GetDescendants() do
                if v887:HasTag("Cleanup_Blitzshock") then
                    v887:Destroy()
                end
            end
        end
        if p885 then
            v888(p885)
        end
        if p884 then
            v888(p884)
        end
        for _, v889 in p884:GetDescendants() do
            if (v889:IsA("BasePart") or v889:IsA("UnionOperation")) and v889:HasTag("BlitzshockVisual") then
                v889.Color = u13[v889] or v889.Color
                u13[v889] = nil
                v889:RemoveTag("BlitzshockVisual")
                if u16[v889] then
                    v889.Material = u16[v889]
                    u16[v889] = nil
                end
            end
        end
    end
}
u495.Junkshock = {
    ["Id"] = "JS",
    ["Name"] = "Junkshock",
    ["ValueMulti"] = 45,
    ["Color"] = Color3.fromRGB(147, 247, 0),
    ["_AddFX"] = function(p890, p891, p892) --[[Function name: _AddFX, line 3638]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u13
        --]]
        p890:_RemoveFX(p891, p892)
        if p892 then
            for _, v893 in game.ServerStorage.Mutation_FX.Junkshock:GetChildren() do
                local v894 = v893:Clone()
                v894.Parent = p892
                v894:AddTag("Cleanup_Junkshock")
                if v894:IsA("ParticleEmitter") then
                    v894.Enabled = true
                end
            end
        end
        for _, v895 in p891:GetDescendants() do
            if (v895:IsA("BasePart") or v895:IsA("UnionOperation")) and (not v895:HasTag("Effect") and (not v895.Transparency or v895.Transparency ~= 1)) then
                u16[v895] = u16[v895] or v895.Material
                v895.Material = Enum.Material.Neon
                u13[v895] = u13[v895] or v895.Color
                v895.Color = v895.Color:Lerp(Color3.fromRGB(0, 255, 36), 0.5)
                v895:AddTag("JunkshockVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p896, p897) --[[Function name: _RemoveFX, line 3663]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        local function v900(p898) --[[Anonymous function at line 3664]]
            for _, v899 in p898:GetDescendants() do
                if v899:HasTag("Cleanup_Junkshock") then
                    v899:Destroy()
                end
            end
        end
        if p897 then
            v900(p897)
        end
        if p896 then
            v900(p896)
        end
        for _, v901 in p896:GetDescendants() do
            if (v901:IsA("BasePart") or v901:IsA("UnionOperation")) and v901:HasTag("JunkshockVisual") then
                v901.Color = u13[v901] or v901.Color
                u13[v901] = nil
                v901:RemoveTag("JunkshockVisual")
                if u16[v901] then
                    v901.Material = u16[v901]
                    u16[v901] = nil
                end
            end
        end
    end
}
u495.Touchdown = {
    ["Id"] = "TD",
    ["Name"] = "Touchdown",
    ["ValueMulti"] = 105,
    ["Color"] = Color3.fromRGB(203, 95, 0),
    ["_AddFX"] = function(p902, p903, p904) --[[Function name: _AddFX, line 3696]]
        p902:_RemoveFX(p903, p904)
        if p904 then
            for _, v905 in game.ServerStorage.Mutation_FX.Touchdown:GetChildren() do
                local v906 = v905:Clone()
                v906.Parent = p904
                v906.Enabled = true
                v906:AddTag("Cleanup_Touchdown")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p907, p908) --[[Function name: _RemoveFX, line 3711]]
        local function v911(p909) --[[Anonymous function at line 3713]]
            for _, v910 in p909:GetDescendants() do
                if v910:HasTag("Cleanup_Touchdown") then
                    v910:Destroy()
                end
            end
        end
        if p908 then
            v911(p908)
        end
        if p907 then
            v911(p907)
        end
    end
}
u495.Subzero = {
    ["Id"] = "SZ",
    ["Name"] = "Subzero",
    ["ValueMulti"] = 40,
    ["Color"] = Color3.fromRGB(0, 255, 255),
    ["_AddFX"] = function(p912, p913, p914) --[[Function name: _AddFX, line 3730]]
        --[[
        Upvalues:
            [1] = u96
            [2] = u16
            [3] = u17
            [4] = u13
        --]]
        p912:_RemoveFX(p913, p914)
        u96(p912, p913, p914, 0.4)
        if p914 then
            for _, v915 in game.ServerStorage.Mutation_FX.Subzero:GetChildren() do
                local v916 = v915:Clone()
                v916.Parent = p914
                v916:AddTag("Cleanup_Subzero")
                if v916:IsA("ParticleEmitter") then
                    v916.Enabled = true
                end
            end
        end
        for _, v917 in p913:GetChildren() do
            if v917:IsA("BasePart") or v917:IsA("UnionOperation") then
                v917.Reflectance = 0.35
            end
        end
        for _, v918 in p913:GetDescendants() do
            if (v918:IsA("BasePart") or v918:IsA("UnionOperation")) and (not v918:HasTag("Effect") and (not v918.Transparency or v918.Transparency ~= 1)) then
                u16[v918] = u16[v918] or v918.Material
                v918.Material = Enum.Material.Plastic
                u17[v918] = u17[v918] or v918.MaterialVariant
                v918.MaterialVariant = "Studs 2x2 Plastic Metal"
                u13[v918] = u13[v918] or v918.Color
                v918.Color = v918.Color:Lerp(Color3.fromRGB(0, 255, 255), 0.5)
                v918:AddTag("SubzeroVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(p919, p920, p921) --[[Function name: _RemoveFX, line 3768]]
        --[[
        Upvalues:
            [1] = u105
            [2] = u13
            [3] = u17
            [4] = u16
        --]]
        u105(p919, p920, p921)
        local function v924(p922) --[[Anonymous function at line 3773]]
            for _, v923 in p922:GetDescendants() do
                if v923:HasTag("Cleanup_Subzero") then
                    v923:Destroy()
                end
            end
        end
        if p921 then
            v924(p921)
        end
        if p920 then
            v924(p920)
        end
        for _, v925 in p920:GetDescendants() do
            if v925:IsA("BasePart") or v925:IsA("UnionOperation") then
                v925.Reflectance = 0
                if v925:HasTag("SubzeroVisual") then
                    v925.Color = u13[v925] or v925.Color
                    u13[v925] = nil
                    v925:RemoveTag("SubzeroVisual")
                    v925.MaterialVariant = u17[v925] or v925.MaterialVariant
                    u17[v925] = nil
                    if u16[v925] then
                        v925.Material = u16[v925]
                        u16[v925] = nil
                    end
                end
            end
        end
    end
}
u495.Lightcycle = {
    ["Id"] = "lc",
    ["Name"] = "Lightcycle",
    ["ValueMulti"] = 50,
    ["Color"] = Color3.fromRGB(255, 255, 255),
    ["_AddFX"] = function(p926, p927, p928) --[[Function name: _AddFX, line 3811]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        p926:_RemoveFX(p927, p928)
        p927:AddTag("Lightcycle_Mutation")
        for _, v929 in p927:GetDescendants() do
            if (v929:IsA("BasePart") or v929:IsA("UnionOperation")) and not v929:HasTag("Effect") then
                local _ = v929.Color
                u13[v929] = u13[v929] or v929.Color
                v929:AddTag("StoplightVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p930, _) --[[Function name: _RemoveFX, line 3828]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        p930:RemoveTag("Lightcycle_Mutation")
        for _, v931 in p930:GetDescendants() do
            if (v931:IsA("BasePart") or v931:IsA("UnionOperation")) and v931:HasTag("StoplightVisual") then
                local v932 = u13[v931]
                if v932 then
                    v931.Color = v932
                end
                v931:RemoveTag("StoplightVisual")
            end
        end
    end
}
u495.Aromatic = {
    ["Id"] = "ar",
    ["Name"] = "Aromatic",
    ["ValueMulti"] = 3,
    ["Color"] = Color3.fromRGB(162, 145, 57),
    ["_AddFX"] = function(p933, p934, p935) --[[Function name: _AddFX, line 3851]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        p933:_RemoveFX(p934, p935)
        if p935 then
            for _, v936 in game.ServerStorage.Mutation_FX.Aromatic:GetChildren() do
                local v937 = v936:Clone()
                v937.Parent = p935
                v937:AddTag("Cleanup_Aromatic")
                if v937:IsA("ParticleEmitter") then
                    v937.Enabled = true
                end
            end
        end
        for _, v938 in p934:GetDescendants() do
            if (v938:IsA("BasePart") or v938:IsA("UnionOperation")) and (not v938:HasTag("Effect") and (not v938.Transparency or v938.Transparency ~= 1)) then
                u13[v938] = u13[v938] or v938.Color
                v938.Color = v938.Color:Lerp(Color3.fromRGB(162, 145, 57), 0.3)
                v938:AddTag("AromaticVisual")
            end
        end
    end,
    ["_RemoveFX"] = function(_, p939, p940) --[[Function name: _RemoveFX, line 3879]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
        --]]
        local function v943(p941) --[[Anonymous function at line 3881]]
            for _, v942 in p941:GetDescendants() do
                if v942:HasTag("Cleanup_Aromatic") then
                    v942:Destroy()
                end
            end
        end
        if p940 then
            v943(p940)
        end
        if p939 then
            v943(p939)
        end
        for _, v944 in p939:GetDescendants() do
            if (v944:IsA("BasePart") or v944:IsA("UnionOperation")) and v944:HasTag("AromaticVisual") then
                v944.Color = u13[v944] or v944.Color
                u13[v944] = nil
                v944:RemoveTag("AromaticVisual")
                if u16[v944] then
                    v944.Material = u16[v944]
                    u16[v944] = nil
                end
            end
        end
    end
}
local u945 = {}
local u946 = {}
for v947, v948 in u495 do
    u945[v947] = v948.Id
end
for v949, v950 in u495 do
    if u946[v950.Id] then
        error((("MutationHandler | Duplicate Enum for %* and %*"):format(v949, u946[v950.Id])))
    end
    u946[v950.Id] = v949
end
table.freeze(u945)
table.freeze(u946)
function u11.GetMutationsToEnums(_) --[[Anonymous function at line 3926]]
    --[[
    Upvalues:
        [1] = u945
    --]]
    return u945
end
function u11.GetEnumsToMutations(_) --[[Anonymous function at line 3928]]
    --[[
    Upvalues:
        [1] = u946
    --]]
    return u946
end
function u11.GetMutations(_) --[[Anonymous function at line 3931]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u495
    --]]
    return u6:DeepCopy(u495)
end
function u11.AddMutation(_, p951, p952) --[[Anonymous function at line 3937]]
    if p951 then
        p951:SetAttribute(p952.Name, true)
    else
        warn("MutationHandler:AddMutation | No plant")
    end
end
function u11.RemoveMutation(_, p953, p954) --[[Anonymous function at line 3948]]
    if p953 then
        p953:SetAttribute(p954.Name, nil)
    else
        warn("MutationHandler:RemoveMutation | No plant")
    end
end
function u11.GetPlantMutations(_, p955) --[[Anonymous function at line 3959]]
    --[[
    Upvalues:
        [1] = u495
    --]]
    local v956 = {}
    for _, v957 in u495 do
        if p955:GetAttribute(v957.Name) then
            table.insert(v956, v957)
        end
    end
    return v956
end
function u11.GetPlantMutationsAsEnums(_, p958) --[[Anonymous function at line 3970]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v959 = {}
    for _, v960 in u11:GetPlantMutations(p958) do
        local v961 = v960.Id
        table.insert(v959, v961)
    end
    return v959
end
function u11.GetMutationsAsString(_, p962, p963) --[[Anonymous function at line 3981]]
    --[[
    Upvalues:
        [1] = u495
    --]]
    local v964 = ""
    for _, v965 in u495 do
        local v966 = v965.Name
        if p962:GetAttribute(v966) then
            if v964 ~= "" then
                v964 = v964 .. ", "
            end
            v964 = v964 .. v966
        end
    end
    if v964 ~= "" and p963 then
        v964 = "[" .. v964 .. "]"
    end
    return v964
end
function u11.ExtractMutationsFromEnumArray(_, p967) --[[Anonymous function at line 3999]]
    --[[
    Upvalues:
        [1] = u946
        [2] = u495
    --]]
    local v968 = {}
    for _, v969 in p967 do
        local v970 = u946[v969]
        if v970 then
            local v971 = u495[v970]
            table.insert(v968, v971)
        else
            warn((("MutationHandler:ExtractMutationsFromEnumArray | Mutation does not exist for %*"):format(v969)))
        end
    end
    return v968
end
function u11.ExtractMutationsFromString(_, p972) --[[Anonymous function at line 4015]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v973 = {}
    if not p972 or p972 == "" then
        return v973
    end
    local v974 = p972:gsub("%[", ""):gsub("%]", ""):gsub("%s+", "")
    for v975 in string.gmatch(v974, "([^,]+)") do
        local v976 = false
        for _, v977 in u11:GetMutations() do
            if v977.Name == v975 then
                table.insert(v973, v977)
                v976 = true
            end
        end
        if not v976 then
            warn((("MutationHandler:ExtractMutationsFromString | Mutation name: %* does not exist"):format(v975)))
        end
    end
    return v973
end
function u11.TransferMutations(_, p978, p979) --[[Anonymous function at line 4044]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    for _, v980 in u11:GetMutations() do
        if p978:GetAttribute(v980.Name) then
            u11:AddMutation(p979, v980)
            u11:RemoveMutation(p978, v980)
        end
    end
    p979:SetAttribute("WeightMulti", p978:GetAttribute("WeightMulti") or 1)
end
function u11.CalcValueMultiFromMuts(_, p981) --[[Anonymous function at line 4056]]
    local v982 = 1
    for _, v983 in p981 do
        v982 = v982 + (v983.ValueMulti - 1)
    end
    return math.max(1, v982)
end
function u11.CalcValueMulti(_, p984) --[[Anonymous function at line 4070]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return u11:CalcValueMultiFromMuts((u11:GetPlantMutations(p984)))
end
function u11.SetToolName(_, u985) --[[Anonymous function at line 4077]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u11
    --]]
    if u985:IsA("Tool") then
        task.spawn(function() --[[Anonymous function at line 4080]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u985
                [3] = u7
                [4] = u11
            --]]
            local v986 = game:GetService("ServerScriptService")
            local v987 = require(v986.Modules.InventoryService)
            local v988 = require(u2.Data.EnumRegistry.InventoryServiceEnums)
            local v989
            if u985:FindFirstChild("Item_String") then
                v989 = u985.Item_String.Value
            else
                v989 = nil
            end
            local v990, v991
            if u985:GetAttribute(v988.OWNER) then
                local v992 = v987:GetToolData(u985)
                v989 = v989 or v992.ItemName
                v990 = v992.Variant or "Normal"
                v991 = v992.Seed
            else
                local v993 = u985:WaitForChild("Variant", 0.3)
                if not v993 then
                    return
                end
                local v994 = u985:WaitForChild("Item_Seed", 0.3)
                if not v994 then
                    return
                end
                v990 = v993.Value
                v991 = v994.Value
            end
            if v990 and (v991 and v989) then
                local v995 = u7.Calculate_Weight(v991, v989) * (u985:GetAttribute("WeightMulti") or 1)
                local v996 = u11:GetMutationsAsString(u985)
                if v990 and (v990 ~= "" and v990 ~= "Normal") then
                    v996 = v996 .. (#v996 > 0 and ", " or "") .. v990
                end
                u985.Name = (v996 == "" and "" or (("[%*] "):format(v996) or "")) .. v989 .. " [" .. string.format("%.2f", v995) .. "kg]"
            end
        end)
    end
end
local u997 = {}
for _, v998 in u495 do
    u997[v998.Name] = v998.Name
end
u11.MutationNames = u997
local u999 = {}
function u11.CheckTimedPlants(_) --[[Anonymous function at line 4134]]
    --[[
    Upvalues:
        [1] = u999
        [2] = u8
        [3] = u9
        [4] = u10
        [5] = u11
        [6] = u495
    --]]
    local v1000 = require(game.ServerStorage.Data_Module)
    local v1001 = workspace:GetServerTimeNow()
    for v1002, _ in u999 do
        local v1003 = u8(v1002)
        if v1003 then
            local v1004 = v1000.GetFruitData(v1003, v1002)
            local v1005 = u9.MutationTimes
            if not v1004 then
                v1004 = v1000.GetPlantData(v1003, v1002)
                v1005 = u10.MutationTimes
            end
            if v1004 then
                if v1004[v1005] then
                    local v1006 = 0
                    for v1007, v1008 in v1004[v1005] do
                        local v1009 = u11:GetEnumsToMutations()[v1007]
                        local v1010 = u495[v1009]
                        if v1010 then
                            local v1011 = v1010.TimeData
                            if v1011 and (v1011.TimeToChange and v1011.AddMutationName) then
                                v1006 = v1006 + 1
                                if v1001 - v1008 >= v1011.TimeToChange then
                                    v1002:SetAttribute(v1011.AddMutationName, true)
                                end
                            else
                                warn((("Invalid or nil TimeData for %*, despite being in mutaionTimes"):format(v1009)))
                            end
                        else
                            warn((("No mutation for %*:%*"):format(v1007, v1009)))
                        end
                    end
                    if v1006 <= 0 then
                        warn((("%* in timedPlants, but no valid muts!"):format(v1002.Name)))
                    end
                else
                    warn(("No Mutation Times for %* >"):format(v1002.Name), v1002)
                end
            else
                warn(("No Plant Data for %* >"):format((v1002:GetFullName())), v1002)
            end
        end
    end
end
local function u1025(p1012) --[[Anonymous function at line 4200]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u10
        [4] = u11
        [5] = u495
        [6] = u999
    --]]
    if p1012:IsA("Tool") then
        return
    elseif p1012:HasTag("FoodModel") then
        return
    elseif p1012:HasTag("TESTING") then
        return
    else
        local v1013 = require(game.ServerStorage.Data_Module)
        local v1014 = u8(p1012)
        if v1014 then
            local v1015 = v1013.GetFruitData(v1014, p1012)
            local v1016 = u9.MutationTimes
            if not v1015 then
                v1015 = v1013.GetPlantData(v1014, p1012)
                v1016 = u10.MutationTimes
            end
            if v1015 then
                local v1017 = workspace:GetServerTimeNow()
                local v1018 = math.floor(v1017)
                v1015[v1016] = v1015[v1016] or {}
                for v1019, _ in v1015[v1016] do
                    local v1020 = u11:GetEnumsToMutations()[v1019]
                    local v1021 = u495[v1020]
                    if not (p1012:GetAttribute(v1020) and v1021.TimeData) then
                        v1015[v1016][v1019] = nil
                    end
                end
                for v1022, _ in p1012:GetAttributes() do
                    local v1023 = u495[v1022]
                    if v1023 and v1023.TimeData then
                        local v1024 = u11:GetMutationsToEnums()[v1022]
                        if not v1015[v1016][v1024] then
                            v1015[v1016][v1024] = v1018
                        end
                    end
                end
                if next(v1015[v1016]) == nil then
                    v1015[v1016] = nil
                    if u999[p1012] then
                        u999[p1012] = nil
                        return
                    end
                elseif not u999[p1012] then
                    u999[p1012] = true
                end
            else
                warn(("No Plant Data for %* >"):format((p1012:GetFullName())), p1012)
            end
        else
            warn("No player for plant >", p1012)
            return
        end
    end
end
local u1026 = {}
local function v1032(u1027) --[[Anonymous function at line 4279]]
    --[[
    Upvalues:
        [1] = u997
        [2] = u1026
        [3] = u1025
        [4] = u129
        [5] = u11
        [6] = u999
        [7] = u13
        [8] = u16
    --]]
    local u1028 = require(script.MutationCombos)
    if u1027 then
        u1027.AttributeChanged:Connect(function(p1029) --[[Anonymous function at line 4290]]
            --[[
            Upvalues:
                [1] = u997
                [2] = u1026
                [3] = u1027
                [4] = u1025
                [5] = u1028
                [6] = u129
                [7] = u11
            --]]
            if u997[p1029] then
                if not u1026[u1027] then
                    u1026[u1027] = true
                    u1025(u1027)
                    task.defer(function() --[[Anonymous function at line 4297]]
                        --[[
                        Upvalues:
                            [1] = u1028
                            [2] = u1027
                            [3] = u129
                            [4] = u11
                            [5] = u1026
                        --]]
                        u1028:HandleCombos(u1027)
                        u129(u1027)
                        u11:SetToolName(u1027)
                        u1026[u1027] = nil
                    end)
                end
            else
                return
            end
        end)
        u1025(u1027)
        u129(u1027)
        u11:SetToolName(u1027)
        u1027.Destroying:Once(function() --[[Anonymous function at line 4323]]
            --[[
            Upvalues:
                [1] = u1026
                [2] = u1027
                [3] = u999
                [4] = u13
                [5] = u16
            --]]
            u1026[u1027] = nil
            u999[u1027] = nil
            for _, v1030 in u1027:GetDescendants() do
                if v1030:IsA("BasePart") then
                    u13[v1030] = nil
                    u16[v1030] = nil
                end
            end
        end)
        u1027.DescendantRemoving:Connect(function(p1031) --[[Anonymous function at line 4337]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
            --]]
            u13[p1031] = nil
            u16[p1031] = nil
        end)
    else
        warn("MutationHandler.MutatableAdded | No plant")
    end
end
if u3:IsServer() then
    v1:GetInstanceAddedSignal("Harvestable"):Connect(v1032)
    v1:GetInstanceAddedSignal("FruitTool"):Connect(v1032)
    v1:GetInstanceAddedSignal("FoodGenerated"):Connect(v1032)
    v1:GetInstanceAddedSignal("PlantScaled"):Connect(function(p1033) --[[Anonymous function at line 4350]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u129
        --]]
        if u11:CanBeMutated(p1033) then
            if p1033:IsA("Model") or p1033:IsA("Tool") then
                u129(p1033)
                u11:SetToolName(p1033)
            end
        else
            return
        end
    end)
    task.spawn(function() --[[Anonymous function at line 4361]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        while true do
            task.wait(60)
            xpcall(function() --[[Anonymous function at line 4364]]
                --[[
                Upvalues:
                    [1] = u11
                --]]
                u11:CheckTimedPlants()
            end, warn)
        end
    end)
end
return u11