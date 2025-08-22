#!/usr/bin/env python3
"""
Script to identify which crop image files are actually missing.
Based on the 404 errors from the server logs.
"""

import os
from pathlib import Path

def main():
    img_dir = Path("static/img")
    
    # List of files that showed 404 errors in the logs
    files_with_404_errors = [
        "crop-amberheart.webp",
        "crop-aura-flora.webp", 
        "crop-badlands-pepper.webp",
        "crop-bitter-melon.webp",
        "crop-blue-lollipop.webp",
        "crop-burning-bud.webp",
        "crop-broccoli.webp",
        "crop-butternut-squash.webp",
        "crop-canary-melon.webp",
        "crop-cyclamen.webp",
        "crop-duskpuff.webp",
        "crop-elder-strawberry.webp",
        "crop-flare-daisy.webp",
        "crop-fossilight.webp",
        "crop-fruitball.webp",
        "crop-giant-pinecone.webp",
        "crop-gleamroot.webp",
        "crop-glowshroom.webp",
        "crop-golden-egg.webp",
        "crop-hinomai.webp",
        "crop-honeysuckle.webp",
        "crop-horned-dinoshroom.webp",
        "crop-ice-cream-bean.webp",
        "crop-king-cabbage.webp",
        "crop-king-palm.webp",
        "crop-log-pumpkin.webp",
        "crop-lucky-bamboo.webp",
        "crop-mandrake.webp",
        "crop-mangosteen.webp",
        "crop-manuka-flower.webp",
        "crop-merica-mushroom.webp",
        "crop-monoblooma.webp",
        "crop-moonflower.webp",
        "crop-moonglow.webp",
        "crop-mutant-carrot.webp",
        "crop-nectarshade.webp",
        "crop-passionfruit.webp",
        "crop-potato.webp",
        "crop-poseidon-plant.webp",
        "crop-pricklefruit.webp",
        "crop-princess-thorn.webp",
        "crop-rhubarb.webp",
        "crop-romanesco.webp",
        "crop-sinisterdrip.webp",
        "crop-serenity.webp",
        "crop-stonebite.webp",
        "crop-spring-onion.webp",
        "crop-starfruit.webp",
        "crop-sugarglaze.webp",
        "crop-suncoil.webp",
        "crop-tranquil-bloom.webp",
        "crop-traveler%27s-fruit.webp",  # URL encoded apostrophe
        "crop-veinpetal.webp",
        "crop-white-mulberry.webp",
        "crop-zenflare.webp"
    ]
    
    print("Checking which files are actually missing...")
    print("=" * 50)
    
    missing_files = []
    renamed_files = []
    
    for filename in files_with_404_errors:
        # Handle URL encoded apostrophe
        if "%27" in filename:
            filename = filename.replace("%27", "'")
            
        file_path = img_dir / filename
        
        if not file_path.exists():
            # Check if there's a similar file without hyphens (not renamed yet)
            no_hyphen_name = filename.replace("-", "")
            no_hyphen_path = img_dir / no_hyphen_name
            
            if no_hyphen_path.exists():
                renamed_files.append((no_hyphen_name, filename))
                print(f"🔄 NEEDS RENAMING: {no_hyphen_name} -> {filename}")
            else:
                missing_files.append(filename)
                print(f"❌ MISSING: {filename}")
        else:
            print(f"✅ EXISTS: {filename}")
    
    print()
    print("=" * 50)
    print(f"Summary:")
    print(f"✅ Files that exist: {len(files_with_404_errors) - len(missing_files) - len(renamed_files)}")
    print(f"🔄 Files that need renaming: {len(renamed_files)}")
    print(f"❌ Files that are actually missing: {len(missing_files)}")
    
    if renamed_files:
        print()
        print("Files that need to be renamed:")
        for old_name, new_name in renamed_files:
            print(f"  {old_name} -> {new_name}")
    
    if missing_files:
        print()
        print("Files that are actually missing:")
        for filename in missing_files:
            print(f"  {filename}")

if __name__ == "__main__":
    main()
