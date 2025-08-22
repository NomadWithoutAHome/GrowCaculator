#!/usr/bin/env python3
"""
Script to fix specific crop image naming patterns to match template expectations.
"""

import os
from pathlib import Path

def main():
    img_dir = Path("static/img")
    
    if not img_dir.exists():
        print(f"Error: {img_dir} directory not found!")
        return
    
    # Define the specific renaming patterns needed
    rename_patterns = {
        # Multi-word plants that need hyphens
        'crop-lilyof-thevalley.webp': 'crop-lily-of-the-valley.webp',
        'crop-venusflytrap.webp': 'crop-venus-fly-trap.webp',
        'crop-horneddinoshroom.webp': 'crop-horned-dino-shroom.webp',
        'crop-giantpinecone.webp': 'crop-giant-pine-cone.webp',
        'crop-grandtomato.webp': 'crop-grand-tomato.webp',
        'crop-grandvolcania.webp': 'crop-grand-volcania.webp',
        'crop-greenapple.webp': 'crop-green-apple.webp',
        'crop-hivefruit.webp': 'crop-hive-fruit.webp',
        'crop-icecreambean.webp': 'crop-ice-cream-bean.webp',
        'crop-kingcabbage.webp': 'crop-king-cabbage.webp',
        'crop-kingpalm.webp': 'crop-king-palm.webp',
        'crop-libertylily.webp': 'crop-liberty-lily.webp',
        'crop-violetcorn.webp': 'crop-violet-corn.webp',
        'crop-wildcarrot.webp': 'crop-wild-carrot.webp',
        'crop-whitemulberry.webp': 'crop-white-mulberry.webp',
        'crop-zenrocks.webp': 'crop-zen-rocks.webp',
        'crop-aloevera.webp': 'crop-aloe-vera.webp',
        'crop-amberspine.webp': 'crop-amber-spine.webp',
        'crop-amberheart.webp': 'crop-amber-heart.webp',
        'crop-auraflora.webp': 'crop-aura-flora.webp',
        'crop-badlandspepper.webp': 'crop-badlands-pepper.webp',
        'crop-beebalm.webp': 'crop-bee-balm.webp',
        'crop-bellpepper.webp': 'crop-bell-pepper.webp',
        'crop-bittermelon.webp': 'crop-bitter-melon.webp',
        'crop-bloodbanana.webp': 'crop-blood-banana.webp',
        'crop-boneblossom.webp': 'crop-bone-blossom.webp',
        'crop-bluellipop.webp': 'crop-blue-lollipop.webp',
        'crop-butternutsquash.webp': 'crop-butternut-squash.webp',
        'crop-canarymelon.webp': 'crop-canary-melon.webp',
        'crop-candyblossom.webp': 'crop-candy-blossom.webp',
        'crop-cherryblossom.webp': 'crop-cherry-blossom.webp',
        'crop-candysunflower.webp': 'crop-candy-sunflower.webp',
        'crop-chocolatecarrot.webp': 'crop-chocolate-carrot.webp',
        'crop-crimsonvine.webp': 'crop-crimson-vine.webp',
        'crop-cursedfruit.webp': 'crop-cursed-fruit.webp',
        'crop-crownmelon.webp': 'crop-crown-melon.webp',
        'crop-dragonfruit.webp': 'crop-dragon-fruit.webp',
        'crop-dragonpepper.webp': 'crop-dragon-pepper.webp',
        'crop-dragonsapling.webp': 'crop-dragon-sapling.webp',
        'crop-easteregg.webp': 'crop-easter-egg.webp',
        'crop-elephantears.webp': 'crop-elephant-ears.webp',
        'crop-emberlily.webp': 'crop-ember-lily.webp',
        'crop-fireflyfern.webp': 'crop-firefly-fern.webp',
        'crop-fireworkflower.webp': 'crop-firework-flower.webp',
        'crop-fossilight.webp': 'crop-fossil-light.webp',
        'crop-fruitball.webp': 'crop-fruit-ball.webp',
        'crop-glowshroom.webp': 'crop-glow-shroom.webp',
        'crop-hinomai.webp': 'crop-hino-mai.webp',
        'crop-honeysuckle.webp': 'crop-honey-suckle.webp',
        'crop-libertylily.webp': 'crop-liberty-lily.webp',
        'crop-mapleapple.webp': 'crop-maple-apple.webp',
        'crop-megamushroom.webp': 'crop-mega-mushroom.webp',
        'crop-monoblooma.webp': 'crop-mono-blooma.webp',
        'crop-moonblossom.webp': 'crop-moon-blossom.webp',
        'crop-moonflower.webp': 'crop-moon-flower.webp',
        'crop-moonglow.webp': 'crop-moon-glow.webp',
        'crop-moonmango.webp': 'crop-moon-mango.webp',
        'crop-moonmelon.webp': 'crop-moon-melon.webp',
        'crop-nectarshade.webp': 'crop-nectar-shade.webp',
        'crop-nectarthorn.webp': 'crop-nectar-thorn.webp',
        'crop-nobleflower.webp': 'crop-noble-flower.webp',
        'crop-orangetulip.webp': 'crop-orange-tulip.webp',
        'crop-paradisepetal.webp': 'crop-paradise-petal.webp',
        'crop-parasolflower.webp': 'crop-parasol-flower.webp',
        'crop-passionfruit.webp': 'crop-passion-fruit.webp',
        'crop-peacelily.webp': 'crop-peace-lily.webp',
        'crop-pinklily.webp': 'crop-pink-lily.webp',
        'crop-pinktulip.webp': 'crop-pink-tulip.webp',
        'crop-pitcherplant.webp': 'crop-pitcher-plant.webp',
        'crop-pricklypear.webp': 'crop-prickly-pear.webp',
        'crop-purplecabbage.webp': 'crop-purple-cabbage.webp',
        'crop-purpledahlia.webp': 'crop-purple-dahlia.webp',
        'crop-redlollipop.webp': 'crop-red-lollipop.webp',
        'crop-rosydelight.webp': 'crop-rosy-delight.webp',
        'crop-sakurabush.webp': 'crop-sakura-bush.webp',
        'crop-softsunshine.webp': 'crop-soft-sunshine.webp',
        'crop-soulfruit.webp': 'crop-soul-fruit.webp',
        'crop-spikedmango.webp': 'crop-spiked-mango.webp',
        'crop-starfruit.webp': 'crop-star-fruit.webp',
        'crop-stonebite.webp': 'crop-stone-bite.webp',
        'crop-sugarapple.webp': 'crop-sugar-apple.webp',
        'crop-sugarglaze.webp': 'crop-sugar-glaze.webp',
        'crop-suncoil.webp': 'crop-sun-coil.webp',
        'crop-tacofern.webp': 'crop-taco-fern.webp',
        'crop-tallasparagus.webp': 'crop-tall-asparagus.webp',
        'crop-taroflower.webp': 'crop-taro-flower.webp',
        'crop-travelersfruit.webp': 'crop-travelers-fruit.webp',
        'crop-twistedtangle.webp': 'crop-twisted-tangle.webp',
        'crop-veinpetal.webp': 'crop-vein-petal.webp',
        'crop-violetcorn.webp': 'crop-violet-corn.webp',
        'crop-zenflare.webp': 'crop-zen-flare.webp',
        'crop-zenrocks.webp': 'crop-zen-rocks.webp',
    }
    
    print(f"Found {len(rename_patterns)} files that need renaming")
    print("Renaming files to match template naming convention...")
    print()
    
    renamed_count = 0
    skipped_count = 0
    
    for old_name, new_name in rename_patterns.items():
        old_path = img_dir / old_name
        new_path = img_dir / new_name
        
        if not old_path.exists():
            print(f"⚠ {old_name} (file not found, skipping)")
            skipped_count += 1
            continue
        
        if new_path.exists():
            print(f"⚠ {old_name} -> {new_name} (target already exists, skipping)")
            skipped_count += 1
            continue
        
        try:
            old_path.rename(new_path)
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
