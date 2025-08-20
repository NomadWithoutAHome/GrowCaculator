# grow_calculator_logic.py
import json
from typing import List


class PlantCalculator:
    def __init__(self):
        # Load plant data
        with open('data/plants.json', 'r', encoding='utf-8') as f:
            self.plants = json.load(f)
            print(f"✅ Loaded {len(self.plants)} plants from plants.json")
        with open('data/variants.json', 'r', encoding='utf-8') as f:
            self.variants = json.load(f)
            print(f"✅ Loaded {len(self.variants)} variants from variants.json")
        with open('data/mutations.json', 'r', encoding='utf-8') as f:
            self.mutations = json.load(f)
            print(f"✅ Loaded {len(self.mutations)} mutations from mutations.json")


    def calculate_mutation_multiplier(self, selected_mutations: list[str]) -> float:
        """
        Calculate mutation multiplier using the CORRECT game formula from MutationHandler.lua
        Formula: total = 1 + (mut1-1) + (mut2-1) + (mut3-1) + ...
        This is ADDITIVE, not multiplicative!
        """
        if not selected_mutations:
            return 1.0

        # From MutationHandler.lua line 3903: v982 = v982 + (v983.ValueMulti - 1)
        total = 1.0
        for mutation_name in selected_mutations:
            mutation_data = self.mutations.get(mutation_name)
            if not mutation_data:
                continue
            
            value_multi = mutation_data["value_multi"]
            # Add (ValueMulti - 1) to total, as per game source code
            total = total + (value_multi - 1)
        
        # Ensure minimum value is 1
        return max(1.0, total)

    def calculate_plant_value(self, plant_name: str, variant: str,
                              weight: float, mutation_multi: float,
                              fruit_version: int = 0) -> int:
        """
        Calculate plant value using the EXACT formula from CalculatePlantValue.lua
        Lines 17-27 of the source code
        """
        plant_data = self.plants[plant_name]
        variant_data = self.variants[variant]

        # From CalculatePlantValue.lua:
        # v11 = v10[3] (base price)
        # v12 = v10[2] (base weight) 
        # v13 = variant multiplier
        # v14 = v11 * p8 * v13 (base price * mutation_multi * variant_multi)
        # v15 = p7 / v12 (weight / base_weight)
        # v16 = math.clamp(v15, 0.95, 100000000)
        # v17 = v14 * (v16 * v16)
        
        base_price = plant_data["base_price"]  # v11
        base_weight = plant_data["base_weight"]  # v12
        variant_multiplier = variant_data["multiplier"]  # v13
        
        # v14 = base_price * mutation_multi * variant_multi
        base_value = base_price * mutation_multi * variant_multiplier
        
        # v15 = weight / base_weight
        weight_ratio = weight / base_weight
        
        # v16 = math.clamp(weight_ratio, 0.95, 100000000)
        clamped_ratio = max(0.95, min(weight_ratio, 100000000))
        
        # v17 = base_value * (clamped_ratio * clamped_ratio)
        final_value = base_value * (clamped_ratio * clamped_ratio)
        
        # Apply fruit version cap if applicable
        if fruit_version >= 1:
            final_value = min(final_value, 1000000000000)

        return round(final_value)

    def get_plant_names(self) -> List[str]:
        return sorted(self.plants.keys())

    def get_variant_names(self) -> List[str]:
        return list(self.variants.keys())

    def get_mutation_names(self) -> List[str]:
        return sorted(self.mutations.keys())
