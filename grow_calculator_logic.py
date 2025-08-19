# grow_calculator_logic.py
import json
from typing import List


class PlantCalculator:
    def __init__(self):
        # Load plant data
        with open('plants.json', 'r', encoding='utf-8') as f:
            self.plants = json.load(f)
            print(f"✅ Loaded {len(self.plants)} plants from plants.json")
        with open('variants.json', 'r', encoding='utf-8') as f:
            self.variants = json.load(f)
            print(f"✅ Loaded {len(self.variants)} variants from variants.json")
        with open('mutations.json', 'r', encoding='utf-8') as f:
            self.mutations = json.load(f)
            print(f"✅ Loaded {len(self.mutations)} mutations from mutations.json")


    def calculate_mutation_multiplier(self, selected_mutations: list[str]) -> float:
        if not selected_mutations:
            return 1.0

        zero_value = {"Rotten", "Ghostly"}
        if any(m in zero_value for m in selected_mutations):
            return 0.0

        total = 1.0
        exclusive_groups = {
            "size": ["Giant", "Tiny"],
            "element": ["Shocked", "Wet", "Burnt"],
            "growth": ["Twisted", "Verdant", "Albino"],
        }
        group_best = {group: 1.0 for group in exclusive_groups}
        specials = {"Shiny": 50, "Golden": 20, "Rainbow": 100}

        for m in selected_mutations:
            data = self.mutations.get(m)
            if not data:
                continue
            val = data["value_multi"]

            if m in specials:
                total *= specials[m]
                continue

            placed = False
            for group, members in exclusive_groups.items():
                if m in members:
                    group_best[group] = max(group_best[group], val)
                    placed = True
                    break

            if not placed:
                total *= val

        for v in group_best.values():
            total *= v

        return total

    def calculate_plant_value(self, plant_name: str, variant: str,
                              weight: float, mutation_multi: float,
                              fruit_version: int = 0) -> int:
        plant_data = self.plants[plant_name]
        variant_data = self.variants[variant]

        base_price = plant_data["base_price"]
        base_weight = plant_data["base_weight"]
        variant_multiplier = variant_data["multiplier"]

        growth_factor = weight / base_weight
        clamped_growth_factor = max(0.95, min(growth_factor, 1e8))
        growth_multiplier = clamped_growth_factor ** 2

        final_value = base_price * growth_multiplier * variant_multiplier * mutation_multi
        if fruit_version >= 1:
            final_value = min(final_value, 1_000_000_000_000)

        return round(final_value)

    def get_plant_names(self) -> List[str]:
        return sorted(self.plants.keys())

    def get_variant_names(self) -> List[str]:
        return list(self.variants.keys())

    def get_mutation_names(self) -> List[str]:
        return sorted(self.mutations.keys())
