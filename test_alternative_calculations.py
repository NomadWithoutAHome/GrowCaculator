#!/usr/bin/env python3
"""
Test alternative calculation orders and rounding methods that might explain the 132 vs 135 difference
"""

import struct
import math

def lua_float(value):
    """Convert to single-precision float like Roblox"""
    return struct.unpack('f', struct.pack('f', value))[0]

def lua_round(value):
    """Roblox math.round() implementation"""
    if value >= 0:
        return math.floor(value + 0.5)
    else:
        return math.ceil(value - 0.5)

def test_different_calculation_orders():
    """Test different orders of operations to see if any produces 132"""
    
    print("🧪 TESTING ALTERNATIVE CALCULATION METHODS")
    print("=" * 60)
    
    # Base values
    base_price = 20
    base_weight = 0.275
    variant_multiplier = 5
    weight = 0.32
    mutation_multi = 1.0
    
    print(f"Target: 132 (game result)")
    print(f"Current: 135 (our result)")
    print(f"Difference: {135 - 132} = 3")
    print()
    
    # Test 1: Maybe rounding happens earlier?
    print("🔬 Test 1: Early rounding of intermediate values")
    base_value = base_price * mutation_multi * variant_multiplier
    weight_ratio = weight / base_weight
    # Round the weight ratio early
    weight_ratio_rounded = round(weight_ratio, 6)  # Round to 6 decimal places
    clamped_ratio = max(0.95, min(weight_ratio_rounded, 100000000))
    final_value = base_value * (clamped_ratio * clamped_ratio)
    result1 = round(final_value)
    print(f"  Weight ratio rounded to 6 decimals: {weight_ratio_rounded}")
    print(f"  Final result: {result1}")
    print()
    
    # Test 2: Maybe there's truncation instead of rounding?
    print("🔬 Test 2: Using truncation (math.floor) instead of rounding")
    base_value = base_price * mutation_multi * variant_multiplier
    weight_ratio = weight / base_weight
    clamped_ratio = max(0.95, min(weight_ratio, 100000000))
    final_value = base_value * (clamped_ratio * clamped_ratio)
    result2 = math.floor(final_value)
    print(f"  Using math.floor: {result2}")
    print()
    
    # Test 3: Maybe there's a ceiling function?
    print("🔬 Test 3: Using ceiling (math.ceil)")
    result3 = math.ceil(final_value)
    print(f"  Using math.ceil: {result3}")
    print()
    
    # Test 4: What if there's a different base price or weight in game?
    print("🔬 Test 4: Testing small variations in base values")
    for price_adj in [-1, -0.5, 0, 0.5, 1]:
        for weight_adj in [-0.001, -0.0005, 0, 0.0005, 0.001]:
            test_price = base_price + price_adj
            test_weight = base_weight + weight_adj
            
            base_value = test_price * mutation_multi * variant_multiplier
            weight_ratio = weight / test_weight
            clamped_ratio = max(0.95, min(weight_ratio, 100000000))
            final_value = base_value * (clamped_ratio * clamped_ratio)
            result = round(final_value)
            
            if result == 132:
                print(f"  ✅ MATCH FOUND! Price: {test_price}, Base Weight: {test_weight}")
                print(f"     Final calculation: {final_value} → {result}")
                break
        else:
            continue
        break
    else:
        print("  ❌ No exact match found with small value adjustments")
    print()
    
    # Test 5: What if the calculation is done with integer arithmetic somewhere?
    print("🔬 Test 5: Testing integer-based intermediate calculations")
    # Maybe the base value is calculated as int first?
    base_value_int = int(base_price * mutation_multi * variant_multiplier)
    weight_ratio = weight / base_weight
    clamped_ratio = max(0.95, min(weight_ratio, 100000000))
    final_value = base_value_int * (clamped_ratio * clamped_ratio)
    result5 = round(final_value)
    print(f"  Base value as int: {base_value_int}")
    print(f"  Final result: {result5}")
    print()
    
    # Test 6: What if there's a percentage-based calculation?
    print("🔬 Test 6: Reverse engineering - what value would give us 132?")
    target = 132
    # Working backwards: if final = base_value * ratio^2, and target = 132
    # Then ratio^2 = target / base_value
    base_value = base_price * mutation_multi * variant_multiplier
    required_ratio_squared = target / base_value
    required_ratio = math.sqrt(required_ratio_squared)
    required_weight = required_ratio * base_weight
    
    print(f"  To get {target}:")
    print(f"  Required ratio²: {required_ratio_squared}")
    print(f"  Required ratio: {required_ratio}")
    print(f"  Required weight: {required_weight}")
    print(f"  Actual weight: {weight}")
    print(f"  Weight difference: {weight - required_weight}")
    print()
    
    # Test 7: Maybe there's a different variant multiplier?
    print("🔬 Test 7: Testing if Silver multiplier might be different")
    target = 132
    weight_ratio = weight / base_weight
    ratio_squared = weight_ratio * weight_ratio
    # target = base_price * mutation_multi * variant_multi * ratio_squared
    # variant_multi = target / (base_price * mutation_multi * ratio_squared)
    required_variant_multi = target / (base_price * mutation_multi * ratio_squared)
    print(f"  Required variant multiplier: {required_variant_multi}")
    print(f"  Current variant multiplier: {variant_multiplier}")
    print(f"  Difference: {variant_multiplier - required_variant_multi}")

if __name__ == "__main__":
    test_different_calculation_orders()
