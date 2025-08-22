#!/usr/bin/env python3
"""
Script to find remaining files that need to be renamed from no-hyphens to hyphenated format.
"""

import os
from pathlib import Path

def main():
    img_dir = Path("static/img")
    
    # Get all crop files currently in the directory
    existing_files = [f.name for f in img_dir.iterdir() if f.name.startswith('crop-') and f.name.endswith('.webp')]
    
    # Files that are showing 404 errors (what the template expects)
    expected_files = [
        "crop-burning-bud.webp",
        "crop-blue-lollipop.webp", 
        "crop-fruit-ball.webp",
        "crop-glow-shroom.webp",
        "crop-star-fruit.webp", 
        "crop-stone-bite.webp",
        "crop-sun-coil.webp",
        "crop-zen-flare.webp",
        "crop-vein-petal.webp",
        "crop-nectar-shade.webp",
        "crop-passion-fruit.webp",
        "crop-sugar-glaze.webp",
        "crop-mono-blooma.webp",
        "crop-moon-flower.webp",
        "crop-moon-glow.webp",
        "crop-honey-suckle.webp",
        "crop-hino-mai.webp"
    ]
    
    print("Finding files that need to be renamed...")
    print("=" * 50)
    
    renames_needed = []
    
    for expected in expected_files:
        if expected not in existing_files:
            # Try to find the no-hyphen version
            no_hyphen = expected.replace("-", "")
            if no_hyphen in existing_files:
                renames_needed.append((no_hyphen, expected))
                print(f"🔄 FOUND: {no_hyphen} -> {expected}")
            else:
                print(f"❌ MISSING: {expected} (and no no-hyphen version found)")
        else:
            print(f"✅ EXISTS: {expected}")
    
    print()
    print(f"Found {len(renames_needed)} files that need renaming")
    
    if renames_needed:
        print("\nAttempting to rename files...")
        for old_name, new_name in renames_needed:
            old_path = img_dir / old_name
            new_path = img_dir / new_name
            
            try:
                old_path.rename(new_path)
                print(f"✅ RENAMED: {old_name} -> {new_name}")
            except Exception as e:
                print(f"❌ ERROR: {old_name} -> {new_name} ({e})")

if __name__ == "__main__":
    main()
