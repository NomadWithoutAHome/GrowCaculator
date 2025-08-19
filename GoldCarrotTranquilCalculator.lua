-- Zenith Script: Gold Carrot with Tranquil Mutation Calculator
-- Dynamically fetches data from GrowCalculator game modules

-- Get references to game modules
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ItemModule = require(ReplicatedStorage.Item_Module)
local MutationHandler = require(ReplicatedStorage.Modules.MutationHandler)

-- Function to get plant data dynamically
local function getPlantData(plantName)
    local plantData = ItemModule.Return_Data(plantName)
    if not plantData then
        warn("Could not find plant data for:", plantName)
        return nil
    end
    
    return {
        name = plantData[1],
        baseWeight = plantData[2],
        basePrice = plantData[3],
        rarity = plantData[4]
    }
end

-- Function to get variant data dynamically
local function getVariantData(variantName)
    local variants = ItemModule.VariantNames
    if not variants then
        -- Fallback to hardcoded variants if VariantNames is not accessible
        local fallbackVariants = {
            ["Normal"] = {weight = 1000, multiplier = 1},
            ["Silver"] = {weight = 20, multiplier = 5},
            ["Gold"] = {weight = 10, multiplier = 20},
            ["Rainbow"] = {weight = 1, multiplier = 50}
        }
        return fallbackVariants[variantName]
    end
    
    for _, variant in pairs(variants) do
        if variant[1] == variantName then
            return {
                weight = variant[2],
                multiplier = variant[3]
            }
        end
    end
    
    warn("Could not find variant data for:", variantName)
    return nil
end

-- Function to get mutation data dynamically
local function getMutationData(mutationName)
    local mutations = MutationHandler:GetMutations()
    if not mutations then
        warn("Could not access mutations")
        return nil
    end
    
    -- Find the mutation by name
    local mutationData = mutations[mutationName]
    if not mutationData then
        warn("Could not find mutation data for:", mutationName)
        return nil
    end
    
    return {
        name = mutationData.Name,
        valueMultiplier = mutationData.ValueMulti,
        id = mutationData.Id
    }
end

-- Function to calculate plant value (based on CalculatePlantValue.lua)
local function calculatePlantValue(plantData, variantData, weight, mutationData, fruitVersion)
    local basePrice = plantData.basePrice
    local baseWeight = plantData.baseWeight
    
    -- Calculate growth factor (weight / base weight)²
    local growthFactor = weight / baseWeight
    local clampedGrowthFactor = math.clamp(growthFactor, 0.95, 100000000)
    local growthMultiplier = clampedGrowthFactor * clampedGrowthFactor
    
    -- Calculate final value
    local finalValue = basePrice * growthMultiplier * variantData.multiplier * mutationData.valueMultiplier
    
    -- Apply fruit version cap if applicable
    if (fruitVersion or 0) >= 1 then
        finalValue = math.min(finalValue, 1000000000000)
    end
    
    return math.round(finalValue)
end

-- Function to calculate weight (based on Calculate_Weight.lua)
local function calculateWeight(seed, plantData)
    math.randomseed(seed)
    local baseWeight = plantData.baseWeight
    local rarity = plantData.rarity
    
    local weight = math.random(700, 1400) * 0.001
    
    -- Check for rare weight boost (1 in rarity chance)
    if math.random(1, rarity) == 1 then
        weight = weight * math.random(3, 4)
    end
    
    return baseWeight * weight, weight
end

-- Main calculation function
local function calculateGoldCarrotTranquil(seed, targetWeight)
    print("=== Gold Carrot with Tranquil Mutation Calculator ===")
    print("Dynamically fetching data from GrowCalculator modules...")
    print()
    
    -- Dynamically fetch all required data
    local plantData = getPlantData("Carrot")
    local variantData = getVariantData("Gold")
    local mutationData = getMutationData("Tranquil")
    
    -- Validate that we got all required data
    if not plantData then
        print("ERROR: Could not fetch Carrot data")
        return nil, nil
    end
    
    if not variantData then
        print("ERROR: Could not fetch Gold variant data")
        return nil, nil
    end
    
    if not mutationData then
        print("ERROR: Could not fetch Tranquil mutation data")
        return nil, nil
    end
    
    print("✓ Successfully fetched data from modules:")
    print("  Plant: " .. plantData.name .. " (Base Weight: " .. plantData.baseWeight .. ", Base Price: " .. plantData.basePrice .. ", Rarity: " .. plantData.rarity .. ")")
    print("  Variant: Gold (Weight: " .. variantData.weight .. ", Multiplier: " .. variantData.multiplier .. "x)")
    print("  Mutation: " .. mutationData.name .. " (ID: " .. mutationData.id .. ", Value Multiplier: " .. mutationData.valueMultiplier .. "x)")
    print()
    
    -- Calculate base weight and actual weight
    local baseWeight, actualWeight = calculateWeight(seed, plantData)
    local finalWeight = targetWeight or actualWeight
    
    print("Seed:", seed)
    print("Base Weight:", baseWeight)
    print("Actual Weight:", actualWeight)
    print("Target Weight:", finalWeight)
    print()
    
    -- Calculate value
    local value = calculatePlantValue(
        plantData,           -- plantData
        variantData,         -- variantData
        finalWeight,         -- weight
        mutationData,        -- mutationData
        0                    -- fruitVersion (0 for no version)
    )
    
    print("=== Value Calculation ===")
    print("Base Price:", plantData.basePrice)
    print("Gold Variant Multiplier:", variantData.multiplier .. "x")
    print("Tranquil Mutation Multiplier:", mutationData.valueMultiplier .. "x")
    print("Growth Factor:", string.format("%.2f", (finalWeight / baseWeight) * (finalWeight / baseWeight)))
    print()
    print("Final Value:", value)
    print()
    
    -- Show breakdown
    local breakdown = plantData.basePrice * (finalWeight / baseWeight) * (finalWeight / baseWeight) * variantData.multiplier * mutationData.valueMultiplier
    print("Breakdown:")
    print("  Base Price × Growth Factor² × Gold Multiplier × Tranquil Multiplier")
    print("  " .. plantData.basePrice .. " × " .. string.format("%.2f", (finalWeight / baseWeight) * (finalWeight / baseWeight)) .. " × " .. variantData.multiplier .. " × " .. mutationData.valueMultiplier)
    print("  = " .. breakdown)
    
    return value, finalWeight
end

-- Example usage with sample values
print("=== Gold Carrot with Tranquil Mutation Calculator ===")
print("Running with sample seed and weight...")
print()

-- Use sample values instead of user input
local sampleSeed = 12345
local sampleWeight = 0.5  -- You can change this to test different weights

-- Calculate and display results
local value, weight = calculateGoldCarrotTranquil(sampleSeed, sampleWeight)

if value then
    print()
    print("=== Summary ===")
    print("Gold Carrot with Tranquil Mutation:")
    print("Seed:", sampleSeed)
    print("Weight:", weight)
    print("Value:", value)
    print()
    print("To calculate with different values, modify the sampleSeed and sampleWeight variables above.")
else
    print("Failed to calculate value. Check the error messages above.")
end

print("Script completed successfully!")
