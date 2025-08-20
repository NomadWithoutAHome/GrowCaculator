#!/usr/bin/env python3
"""
Test multiple plant calculations to see if there's a consistent factor
"""

def calculate_with_factor(base_price, base_weight, variant_multiplier, weight, factor=1.0, mutation_multi=1.0):
    """Calculate plant value with an optional factor applied to base price"""
    adjusted_price = base_price * factor
    base_value = adjusted_price * mutation_multi * variant_multiplier
    weight_ratio = weight / base_weight
    clamped_ratio = max(0.95, min(weight_ratio, 100000000))
    final_value = base_value * (clamped_ratio * clamped_ratio)
    return round(final_value)

def main():
    print("🧪 TESTING CONSISTENT FACTOR ACROSS CALCULATIONS")
    print("=" * 60)
    
    # Test case: Silver Carrot 0.32kg
    base_price = 20
    base_weight = 0.275
    variant_multiplier = 5
    weight = 0.32
    game_result = 132
    
    print("📊 FINDING THE EXACT FACTOR:")
    print(f"Game result: {game_result}")
    print(f"Our result:  {calculate_with_factor(base_price, base_weight, variant_multiplier, weight)}")
    print()
    
    # Find the exact factor that would give us 132
    for factor in [0.970, 0.975, 0.9777, 0.9778, 0.9779, 0.980, 0.985]:
        result = calculate_with_factor(base_price, base_weight, variant_multiplier, weight, factor)
        print(f"Factor {factor:.4f}: {result} {'✅' if result == game_result else ''}")
    
    print()
    
    # Let's try to find the exact factor
    print("🎯 PRECISE FACTOR CALCULATION:")
    # Working backwards to find exact factor needed
    # game_result = factor * base_price * variant_multiplier * (weight/base_weight)²
    weight_ratio = weight / base_weight
    ratio_squared = weight_ratio * weight_ratio
    base_calculation = base_price * variant_multiplier * ratio_squared
    required_factor = game_result / base_calculation
    
    print(f"Required factor: {required_factor:.10f}")
    test_result = calculate_with_factor(base_price, base_weight, variant_multiplier, weight, required_factor)
    print(f"Test with exact factor: {test_result}")
    
    # Check if this could be a known mathematical constant
    print()
    print("🔍 CHECKING AGAINST KNOWN CONSTANTS:")
    constants = {
        "√(15/16)": (15/16)**0.5,
        "31/32": 31/32,
        "√(0.955)": 0.955**0.5,
        "0.975": 0.975,
        "62/64": 62/64,
        "125/128": 125/128,
        "√(61/64)": (61/64)**0.5,
    }
    
    for name, value in constants.items():
        test_result = calculate_with_factor(base_price, base_weight, variant_multiplier, weight, value)
        match = "✅ EXACT MATCH!" if test_result == game_result else ""
        print(f"{name:12}: {value:.10f} → {test_result} {match}")
    
    print()
    print("🤔 POSSIBLE EXPLANATIONS:")
    print("1. Trading/selling tax (like 2.5% reduction)")
    print("2. Shop/vendor fee")
    print("3. Rounding differences in intermediate calculations")
    print("4. Different variant multiplier than what's in the source")
    print("5. Hidden game mechanics not visible in source files")

if __name__ == "__main__":
    main()
