#!/usr/bin/env python3
"""
Regenerate JSON data files from GrowCalculator game source files
Run this script whenever the game files are updated
"""

import re
import json
from pathlib import Path

def extract_plant_data(file_path):
    """Extract plant data from Item_Module.lua file"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    pattern = r'{\s*"([^"]+)",\s*([0-9.]+),\s*([0-9]+),\s*([0-9]+)\s*}'
    plants = re.findall(pattern, content)
    
    plant_data = {}
    for name, weight, price, rarity in plants:
        plant_data[name] = {
            "base_weight": float(weight),
            "base_price": int(price),
            "rarity": int(rarity)
        }
    
    return plant_data

def extract_mutation_data(file_path):
    """Extract mutation data from MutationHandler.lua file"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Find all mutation blocks
    mutation_pattern = r'u495\.(\w+)\s*=\s*{\s*\["Id"\]\s*=\s*"([^"]+)",\s*\["Name"\]\s*=\s*"([^"]+)",\s*\["ValueMulti"\]\s*=\s*([0-9]+),'
    mutations = re.findall(mutation_pattern, content, re.MULTILINE | re.DOTALL)
    
    # If the above doesn't work, try a simpler approach
    if not mutations:
        # Alternative pattern - look for mutations in the u495 table
        alt_pattern = r'u495\.(\w+)\s*=\s*{\s*\["Id"\]\s*=\s*"([^"]+)",\s*\["Name"\]\s*=\s*"([^"]+)",\s*\["ValueMulti"\]\s*=\s*([0-9]+)'
        mutations = re.findall(alt_pattern, content, re.MULTILINE | re.DOTALL)
    
    mutation_data = {}
    for mutation_name, mutation_id, name, value_multi in mutations:
        mutation_data[name] = {
            "id": mutation_id,
            "name": name,
            "value_multi": int(value_multi)
        }
    
    return mutation_data

def main():
    print("🔄 Regenerating JSON data files from game source...")
    
    # Extract and save plant data
    try:
        plant_data = extract_plant_data("Source/Fruit/Item_Module.lua")
        with open('plants.json', 'w', encoding='utf-8') as f:
            json.dump(plant_data, f, indent=2, ensure_ascii=False)
        print(f"✅ Plants: {len(plant_data)} extracted to plants.json")
    except Exception as e:
        print(f"❌ Error extracting plants: {e}")
    
    # Extract and save mutation data
    try:
        mutation_data = extract_mutation_data("Source/Fruit/MutationHandler.lua")
        with open('mutations.json', 'w', encoding='utf-8') as f:
            json.dump(mutation_data, f, indent=2, ensure_ascii=False)
        print(f"✅ Mutations: {len(mutation_data)} extracted to mutations.json")
    except Exception as e:
        print(f"❌ Error extracting mutations: {e}")
    
    # Create variants.json (this is static)
    variants_data = {
        "Normal": {"weight": 1000, "multiplier": 1},
        "Silver": {"weight": 20, "multiplier": 5},
        "Gold": {"weight": 10, "multiplier": 20},
        "Rainbow": {"weight": 1, "multiplier": 50}
    }
    
    try:
        with open('variants.json', 'w', encoding='utf-8') as f:
            json.dump(variants_data, f, indent=2, ensure_ascii=False)
        print(f"✅ Variants: {len(variants_data)} extracted to variants.json")
    except Exception as e:
        print(f"❌ Error extracting variants: {e}")
    
    print("\n🎯 Data regeneration complete!")
    print("You can now run 'python grow_calculator.py' to use the updated data.")

if __name__ == "__main__":
    main()
