#!/usr/bin/env python3
"""
Script to rename crop image files to match the template naming convention.
Converts from: crop-burningbud.webp -> crop-burning-bud.webp
"""

import os
import re
from pathlib import Path

def convert_to_hyphenated(filename):
    """Convert filename like 'crop-burningbud.webp' to 'crop-burning-bud.webp'"""
    if not filename.startswith('crop-') or not filename.endswith('.webp'):
        return filename
    
    # Remove 'crop-' prefix and '.webp' suffix
    name_part = filename[5:-5]
    
    # Find camelCase boundaries and insert hyphens
    # This regex finds where a lowercase letter is followed by an uppercase letter
    hyphenated = re.sub(r'([a-z])([A-Z])', r'\1-\2', name_part)
    
    # Also handle cases where numbers follow letters
    hyphenated = re.sub(r'([a-zA-Z])(\d)', r'\1-\2', hyphenated)
    
    # Handle special cases for common patterns
    special_cases = {
        'ofthe': 'of-the',
        'inthe': 'in-the',
        'onthe': 'on-the',
        'withthe': 'with-the',
        'andthe': 'and-the'
    }
    
    for old, new in special_cases.items():
        hyphenated = hyphenated.replace(old, new)
    
    return f"crop-{hyphenated}.webp"

def main():
    img_dir = Path("static/img")
    
    if not img_dir.exists():
        print(f"Error: {img_dir} directory not found!")
        return
    
    # Get all crop image files
    crop_files = [f for f in img_dir.iterdir() if f.name.startswith('crop-') and f.name.endswith('.webp')]
    
    print(f"Found {len(crop_files)} crop image files")
    print("Renaming files to match template naming convention...")
    print()
    
    renamed_count = 0
    skipped_count = 0
    
    for file_path in crop_files:
        old_name = file_path.name
        new_name = convert_to_hyphenated(old_name)
        
        if old_name == new_name:
            print(f"✓ {old_name} (already correct)")
            skipped_count += 1
            continue
        
        new_path = file_path.parent / new_name
        
        # Check if target name already exists
        if new_path.exists():
            print(f"⚠ {old_name} -> {new_name} (target already exists, skipping)")
            skipped_count += 1
            continue
        
        try:
            file_path.rename(new_path)
            print(f"✓ {old_name} -> {new_name}")
            renamed_count += 1
        except Exception as e:
            print(f"✗ {old_name} -> {new_name} (error: {e})")
    
    print()
    print(f"Renamed: {renamed_count} files")
    print(f"Skipped: {skipped_count} files")
    print("Done!")

if __name__ == "__main__":
    main()
