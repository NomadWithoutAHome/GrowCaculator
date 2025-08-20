#!/usr/bin/env python3
"""
Test script to replicate Roblox Lua floating-point behavior
Roblox uses single-precision (32-bit) floats, while Python uses double-precision (64-bit)
"""

import struct
import math

def lua_float(value):
    """Convert a Python float to single-precision (32-bit) like Roblox Lua"""
    # Pack as 32-bit float, then unpack back to get the precision loss
    return struct.unpack('f', struct.pack('f', value))[0]

def lua_round(value):
    """Roblox math.round() implementation - rounds to nearest integer"""
    # Lua's math.round uses "round half away from zero" behavior
    if value >= 0:
        return math.floor(value + 0.5)
    else:
        return math.ceil(value - 0.5)

def calculate_plant_value_lua_style(base_price, base_weight, variant_multiplier, weight, mutation_multi=1.0):
    """Calculate plant value using Lua-style floating point precision"""
    
    print("🔬 LUA-STYLE CALCULATION:")
    print("=" * 50)
    
    # Convert all inputs to single-precision like Roblox
    base_price_lua = lua_float(base_price)
    base_weight_lua = lua_float(base_weight)
    variant_multiplier_lua = lua_float(variant_multiplier)
    weight_lua = lua_float(weight)
    mutation_multi_lua = lua_float(mutation_multi)
    
    print(f"Input precision conversion:")
    print(f"  base_price: {base_price} → {base_price_lua}")
    print(f"  base_weight: {base_weight} → {base_weight_lua}")
    print(f"  variant_multiplier: {variant_multiplier} → {variant_multiplier_lua}")
    print(f"  weight: {weight} → {weight_lua}")
    print(f"  mutation_multi: {mutation_multi} → {mutation_multi_lua}")
    print()
    
    # Step 1: Calculate base value (v14 = v11 * p8 * v13)
    step1 = lua_float(base_price_lua * mutation_multi_lua)
    base_value = lua_float(step1 * variant_multiplier_lua)
    print(f"Step 1 - Base value:")
    print(f"  {base_price_lua} × {mutation_multi_lua} × {variant_multiplier_lua}")
    print(f"  = {base_value} (as 32-bit float)")
    print()
    
    # Step 2: Calculate weight ratio (v15 = p7 / v12)
    weight_ratio = lua_float(weight_lua / base_weight_lua)
    print(f"Step 2 - Weight ratio:")
    print(f"  {weight_lua} ÷ {base_weight_lua} = {weight_ratio}")
    print()
    
    # Step 3: Clamp ratio (v16 = math.clamp(v15, 0.95, 100000000))
    clamp_min = lua_float(0.95)
    clamp_max = lua_float(100000000)
    clamped_ratio = max(clamp_min, min(weight_ratio, clamp_max))
    clamped_ratio = lua_float(clamped_ratio)
    print(f"Step 3 - Clamped ratio:")
    print(f"  max({clamp_min}, min({weight_ratio}, {clamp_max})) = {clamped_ratio}")
    print()
    
    # Step 4: Calculate final value (v17 = v14 * (v16 * v16))
    ratio_squared = lua_float(clamped_ratio * clamped_ratio)
    final_value = lua_float(base_value * ratio_squared)
    print(f"Step 4 - Final calculation:")
    print(f"  {base_value} × ({clamped_ratio} × {clamped_ratio})")
    print(f"  = {base_value} × {ratio_squared}")
    print(f"  = {final_value}")
    print()
    
    # Step 5: Round using Lua's math.round
    result = lua_round(final_value)
    print(f"Step 5 - Lua-style rounding:")
    print(f"  math.round({final_value}) = {result}")
    print()
    
    return int(result)

def calculate_plant_value_python_style(base_price, base_weight, variant_multiplier, weight, mutation_multi=1.0):
    """Calculate using Python's default double-precision"""
    
    print("🐍 PYTHON-STYLE CALCULATION:")
    print("=" * 50)
    
    base_value = base_price * mutation_multi * variant_multiplier
    weight_ratio = weight / base_weight
    clamped_ratio = max(0.95, min(weight_ratio, 100000000))
    final_value = base_value * (clamped_ratio * clamped_ratio)
    result = round(final_value)
    
    print(f"All calculations in double precision:")
    print(f"  base_value = {base_value}")
    print(f"  weight_ratio = {weight_ratio}")
    print(f"  clamped_ratio = {clamped_ratio}")
    print(f"  final_value = {final_value}")
    print(f"  rounded = {result}")
    print()
    
    return result

def main():
    print("🧪 ROBLOX LUA vs PYTHON PRECISION TEST")
    print("=" * 60)
    print()
    
    # Test case: Silver Carrot 0.32kg
    base_price = 20
    base_weight = 0.275
    variant_multiplier = 5
    weight = 0.32
    mutation_multi = 1.0
    
    print("📋 TEST CASE: Silver Carrot")
    print(f"Base Price: {base_price}")
    print(f"Base Weight: {base_weight}")
    print(f"Variant Multiplier: {variant_multiplier}")
    print(f"Actual Weight: {weight}")
    print(f"Mutation Multiplier: {mutation_multi}")
    print()
    
    # Calculate both ways
    lua_result = calculate_plant_value_lua_style(base_price, base_weight, variant_multiplier, weight, mutation_multi)
    python_result = calculate_plant_value_python_style(base_price, base_weight, variant_multiplier, weight, mutation_multi)
    
    print("🏁 RESULTS COMPARISON:")
    print("=" * 30)
    print(f"Lua-style (32-bit):     {lua_result}")
    print(f"Python-style (64-bit):  {python_result}")
    print(f"In-game result:         132")
    print()
    
    print("🎯 ANALYSIS:")
    if lua_result == 132:
        print("✅ Lua-style precision matches the game!")
    elif python_result == 132:
        print("✅ Python-style precision matches the game!")
    else:
        print("❓ Neither matches exactly - there may be other factors")
        print(f"   Lua difference: {lua_result - 132}")
        print(f"   Python difference: {python_result - 132}")

if __name__ == "__main__":
    main()
