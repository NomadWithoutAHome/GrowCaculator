#!/usr/bin/env python3
"""
MutationHandler.lua Parser
Extracts all mutations from the Lua file and creates a formatted JSON file.
"""

import re
import json
from pathlib import Path

def parse_mutations_from_lua(lua_file_path):
    """
    Parse mutations from MutationHandler.lua file.
    
    Args:
        lua_file_path (str): Path to the MutationHandler.lua file
        
    Returns:
        dict: Dictionary of mutations with their value multipliers
    """
    mutations = {}
    
    try:
        with open(lua_file_path, 'r', encoding='utf-8') as file:
            content = file.read()
        
        print(f"📁 Successfully read {lua_file_path}")
        print(f"📊 File size: {len(content):,} characters")
        
        # Pattern to match mutation definitions in the u495 table
        # Looks for: ["MutationName"] = { ... ["ValueMulti"] = number, ...
        pattern = r'u495\.(\w+)\s*=\s*{[^}]*?\["ValueMulti"\]\s*=\s*(\d+(?:\.\d+)?)'
        
        # Also match direct assignments like u495["MutationName"] = {...}
        pattern2 = r'u495\["(\w+)"\]\s*=\s*{[^}]*?\["ValueMulti"\]\s*=\s*(\d+(?:\.\d+)?)'
        
        # Find all matches using both patterns
        matches1 = re.findall(pattern, content, re.DOTALL)
        matches2 = re.findall(pattern2, content, re.DOTALL)
        
        all_matches = matches1 + matches2
        
        print(f"🔍 Found {len(all_matches)} mutations using regex patterns")
        
        # Process matches
        for mutation_name, value_multi in all_matches:
            # Convert value to float
            try:
                value = float(value_multi)
                mutations[mutation_name] = {
                    "value_multi": value
                }
                print(f"   ✅ {mutation_name}: {value}x")
            except ValueError:
                print(f"   ❌ Failed to parse value for {mutation_name}: {value_multi}")
        
        # Manual verification - look for any missed mutations in the u495 table
        print("\n🔍 Performing manual verification...")
        
        # Find the u495 table section
        u495_match = re.search(r'local u495 = {(.*?)^}', content, re.DOTALL | re.MULTILINE)
        if u495_match:
            u495_content = u495_match.group(1)
            
            # Look for any mutation definitions we might have missed
            manual_pattern = r'\["?(\w+)"?\]\s*=\s*{[^}]*?\["ValueMulti"\]\s*=\s*(\d+(?:\.\d+)?)'
            manual_matches = re.findall(manual_pattern, u495_content, re.DOTALL)
            
            for mutation_name, value_multi in manual_matches:
                if mutation_name not in mutations:
                    try:
                        value = float(value_multi)
                        mutations[mutation_name] = {
                            "value_multi": value
                        }
                        print(f"   🆕 Found additional: {mutation_name}: {value}x")
                    except ValueError:
                        print(f"   ❌ Failed to parse additional value for {mutation_name}: {value_multi}")
        
        # Also check for mutations defined after the main u495 table
        after_table_pattern = r'u495\.(\w+)\s*=\s*{[^}]*?\["ValueMulti"\]\s*=\s*(\d+(?:\.\d+)?)'
        after_matches = re.findall(after_table_pattern, content, re.DOTALL)
        
        for mutation_name, value_multi in after_matches:
            if mutation_name not in mutations:
                try:
                    value = float(value_multi)
                    mutations[mutation_name] = {
                        "value_multi": value
                    }
                    print(f"   🆕 Found post-table: {mutation_name}: {value}x")
                except ValueError:
                    print(f"   ❌ Failed to parse post-table value for {mutation_name}: {value_multi}")
        
        # Check for variable assignments like v502 = {...} followed by u495.Amber = v502
        variable_pattern = r'local (v\d+) = {[^}]*?\["ValueMulti"\]\s*=\s*(\d+(?:\.\d+)?)[^}]*?\["Name"\]\s*=\s*"(\w+)"'
        var_matches = re.findall(variable_pattern, content, re.DOTALL)
        
        for var_name, value_multi, mutation_name in var_matches:
            if mutation_name not in mutations:
                try:
                    value = float(value_multi)
                    mutations[mutation_name] = {
                        "value_multi": value
                    }
                    print(f"   🆕 Found variable assignment: {mutation_name}: {value}x")
                except ValueError:
                    print(f"   ❌ Failed to parse variable value for {mutation_name}: {value_multi}")
        
        # Also look for the pattern where Name comes before ValueMulti
        name_first_pattern = r'\["Name"\]\s*=\s*"(\w+)"[^}]*?\["ValueMulti"\]\s*=\s*(\d+(?:\.\d+)?)'
        name_first_matches = re.findall(name_first_pattern, content, re.DOTALL)
        
        for mutation_name, value_multi in name_first_matches:
            if mutation_name not in mutations:
                try:
                    value = float(value_multi)
                    mutations[mutation_name] = {
                        "value_multi": value
                    }
                    print(f"   🆕 Found name-first pattern: {mutation_name}: {value}x")
                except ValueError:
                    print(f"   ❌ Failed to parse name-first value for {mutation_name}: {value_multi}")
        
        print(f"\n✅ Total mutations extracted: {len(mutations)}")
        
        return mutations
        
    except FileNotFoundError:
        print(f"❌ Error: File not found: {lua_file_path}")
        return {}
    except Exception as e:
        print(f"❌ Error reading file: {e}")
        return {}

def save_mutations_to_json(mutations, output_file):
    """
    Save mutations dictionary to a formatted JSON file.
    
    Args:
        mutations (dict): Dictionary of mutations
        output_file (str): Path to output JSON file
    """
    try:
        # Sort mutations alphabetically for consistent output
        sorted_mutations = dict(sorted(mutations.items()))
        
        with open(output_file, 'w', encoding='utf-8') as file:
            json.dump(sorted_mutations, file, indent=2, ensure_ascii=False)
        
        print(f"💾 Successfully saved mutations to {output_file}")
        return True
        
    except Exception as e:
        print(f"❌ Error saving JSON file: {e}")
        return False

def main():
    """Main function to parse mutations and create JSON file."""
    print("🧬 MutationHandler.lua Parser")
    print("=" * 50)
    
    # Define file paths
    lua_file = "MutationHandler.lua"
    json_file = "mutations_parsed.json"
    
    # Check if input file exists
    if not Path(lua_file).exists():
        print(f"❌ Error: {lua_file} not found!")
        print("   Make sure you're running this script from the project root directory.")
        return
    
    # Parse mutations from Lua file
    print(f"🔄 Parsing mutations from {lua_file}...")
    mutations = parse_mutations_from_lua(lua_file)
    
    if not mutations:
        print("❌ No mutations found or failed to parse file!")
        return
    
    # Save to JSON file
    print(f"\n💾 Saving mutations to {json_file}...")
    success = save_mutations_to_json(mutations, json_file)
    
    if success:
        print(f"\n🎉 SUCCESS!")
        print(f"   📁 Created: {json_file}")
        print(f"   📊 Mutations: {len(mutations)}")
        print(f"\n📋 Sample of extracted mutations:")
        
        # Show first 5 mutations as preview
        for i, (name, data) in enumerate(mutations.items()):
            if i >= 5:
                print(f"   ... and {len(mutations) - 5} more")
                break
            print(f"   • {name}: {data['value_multi']}x")
    else:
        print("❌ Failed to save JSON file!")

if __name__ == "__main__":
    main()
