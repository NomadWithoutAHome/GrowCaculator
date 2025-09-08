-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

--Decompiled by Medal, I take no credit I only Made The dumper and I I.. I iron man
local v_u_1 = require(game.ReplicatedStorage.Modules.StringUtils)
local v2 = {}
local v_u_3 = {
	{ "Normal", 1000, 1 },
	{ "Silver", 20, 5 },
	{ "Gold", 10, 20 },
	{ "Rainbow", 1, 50 }
}
v2.VariantNames = {}
local v_u_4 = {
	{
		"Carrot",
		0.275,
		20,
		100
	},
	{
		"Strawberry",
		0.3,
		15,
		100
	},
	{
		"Blueberry",
		0.2,
		20,
		100
	},
	{
		"Orange Tulip",
		0.05,
		850,
		55
	},
	{
		"Tomato",
		0.5,
		30,
		100
	},
	{
		"Corn",
		2,
		40,
		100
	},
	{
		"Daffodil",
		0.2,
		1000,
		45
	},
	{
		"Watermelon",
		7,
		3000,
		70
	},
	{
		"Pumpkin",
		8,
		3400,
		80
	},
	{
		"Apple",
		3,
		275,
		50
	},
	{
		"Bamboo",
		4,
		4000,
		35
	},
	{
		"Coconut",
		14,
		400,
		70
	},
	{
		"Cactus",
		7,
		3400,
		100
	},
	{
		"Dragon Fruit",
		12,
		4750,
		100
	},
	{
		"Mango",
		15,
		6500,
		200
	},
	{
		"Grape",
		3,
		7850,
		200
	},
	{
		"Mushroom",
		25,
		151000,
		220
	},
	{
		"Pepper",
		5,
		8000,
		200
	},
	{
		"Cacao",
		8,
		12000,
		250
	},
	{
		"Beanstalk",
		10,
		28000,
		300
	},
	{
		"Coolcool Beanbeanstalk",
		5,
		28000,
		300
	},
	{
		"Ember Lily",
		12,
		66666,
		450
	},
	{
		"Sugar Apple",
		9,
		48000,
		200
	},
	{
		"Burning Bud",
		12,
		70000,
		500
	},
	{
		"Giant Pinecone",
		5,
		72000,
		375
	},
	{
		"Elder Strawberry",
		6,
		90000,
		280
	},
	{
		"Romanesco",
		8,
		166000,
		160
	},
	{
		"Broccoli",
		4,
		55555,
		100
	},
	{
		"Potato",
		4,
		90000,
		150
	},
	{
		"Brussels Sprout",
		3,
		120000,
		150
	},
	{
		"Cocomango",
		15,
		180000,
		200
	},
	{
		"Cauliflower",
		5,
		50,
		150
	},
	{
		"Rafflesia",
		8,
		3500,
		80
	},
	{
		"Green Apple",
		3,
		300,
		200
	},
	{
		"Avocado",
		6.5,
		350,
		300
	},
	{
		"Banana",
		1.5,
		2000,
		100
	},
	{
		"Pineapple",
		3,
		2000,
		70
	},
	{
		"Kiwi",
		5,
		2750,
		300
	},
	{
		"Bell Pepper",
		8,
		5500,
		325
	},
	{
		"Prickly Pear",
		7,
		7000,
		375
	},
	{
		"Loquat",
		6.5,
		8000,
		200
	},
	{
		"Pitcher Plant",
		12,
		52000,
		275
	},
	{
		"Feijoa",
		10,
		13000,
		400
	},
	{
		"Wild Carrot",
		1.3,
		25000,
		100
	},
	{
		"Pear",
		3,
		20000,
		120
	},
	{
		"Cantaloupe",
		5.5,
		34000,
		250
	},
	{
		"Parasol Flower",
		6,
		200000,
		350
	},
	{
		"Rosy Delight",
		10,
		69000,
		450
	},
	{
		"Elephant Ears",
		18,
		77000,
		500
	},
	{
		"Delphinium",
		0.3,
		24000,
		100
	},
	{
		"Lily of the Valley",
		6,
		49120,
		400
	},
	{
		"Traveler\'s Fruit",
		15,
		59000,
		500
	},
	{
		"Peace Lily",
		0.6,
		24000,
		100
	},
	{
		"Aloe Vera",
		5.5,
		69000,
		350
	},
	{
		"Guanabana",
		4,
		70500,
		400
	},
	{
		"Chocolate Carrot",
		0.275,
		11000,
		100
	},
	{
		"Red Lollipop",
		4,
		50000,
		65
	},
	{
		"Blue Lollipop",
		1,
		50000,
		65
	},
	{
		"Candy Sunflower",
		1.5,
		80000,
		85
	},
	{
		"Easter Egg",
		3,
		2500,
		20
	},
	{
		"Candy Blossom",
		3,
		100000,
		40
	},
	{
		"Peach",
		2,
		300,
		70
	},
	{
		"Raspberry",
		0.75,
		100,
		70
	},
	{
		"Papaya",
		3,
		1000,
		60
	},
	{
		"Banana",
		1.5,
		1750,
		100
	},
	{
		"Passionfruit",
		3,
		3550,
		40
	},
	{
		"Soul Fruit",
		25,
		7750,
		200
	},
	{
		"Cursed Fruit",
		30,
		25750,
		200
	},
	{
		"Cranberry",
		1,
		3500,
		50
	},
	{
		"Durian",
		8,
		7500,
		200
	},
	{
		"Eggplant",
		5,
		12000,
		220
	},
	{
		"Lotus",
		20,
		35000,
		650
	},
	{
		"Venus Fly Trap",
		10,
		85000,
		650
	},
	{
		"Nightshade",
		0.5,
		3500,
		100
	},
	{
		"Glowshroom",
		0.75,
		300,
		100
	},
	{
		"Mint",
		1,
		5250,
		150
	},
	{
		"Moonflower",
		2,
		9500,
		200
	},
	{
		"Starfruit",
		3,
		15000,
		250
	},
	{
		"Moonglow",
		7,
		25000,
		400
	},
	{
		"Moon Blossom",
		3,
		66666,
		400
	},
	{
		"Crimson Vine",
		1,
		1250,
		100
	},
	{
		"Moon Melon",
		8,
		18000,
		300
	},
	{
		"Blood Banana",
		1.5,
		6000,
		200
	},
	{
		"Celestiberry",
		2,
		10000,
		200
	},
	{
		"Moon Mango",
		15,
		50000,
		300
	},
	{
		"Rose",
		1,
		5000,
		100
	},
	{
		"Foxglove",
		2,
		20000,
		250
	},
	{
		"Lilac",
		3,
		35000,
		250
	},
	{
		"Pink Lily",
		6,
		65000,
		400
	},
	{
		"Purple Dahlia",
		12,
		75000,
		400
	},
	{
		"Sunflower",
		16.5,
		160000,
		600
	},
	{
		"Lavender",
		0.275,
		25000,
		90
	},
	{
		"Nectarshade",
		0.8,
		50000,
		100
	},
	{
		"Nectarine",
		3,
		48000,
		200
	},
	{
		"Hive Fruit",
		8,
		62000,
		300
	},
	{
		"Manuka Flower",
		0.3,
		25000,
		200
	},
	{
		"Dandelion",
		4,
		50000,
		300
	},
	{
		"Lumira",
		6,
		85000,
		350
	},
	{
		"Honeysuckle",
		12,
		100000,
		400
	},
	{
		"Crocus",
		0.275,
		30000,
		150
	},
	{
		"Succulent",
		5,
		25000,
		175
	},
	{
		"Violet Corn",
		3,
		50000,
		250
	},
	{
		"Bendboo",
		18,
		155000,
		275
	},
	{
		"Cocovine",
		14,
		66666,
		275
	},
	{
		"Dragon Pepper",
		6,
		88888,
		300
	},
	{
		"Bee Balm",
		1,
		18000,
		200
	},
	{
		"Nectar Thorn",
		7,
		44444,
		350
	},
	{
		"Suncoil",
		10,
		80000,
		400
	},
	{
		"Liberty Lily",
		6.5,
		30000,
		350
	},
	{
		"Firework Flower",
		20,
		151000,
		450
	},
	{
		"Stonebite",
		1,
		35000,
		200
	},
	{
		"Paradise Petal",
		2.75,
		25000,
		250
	},
	{
		"Horned Dinoshroom",
		5,
		69000,
		275
	},
	{
		"Boneboo",
		15,
		141141,
		300
	},
	{
		"Firefly Fern",
		5,
		72000,
		400
	},
	{
		"Fossilight",
		4,
		88000,
		500
	},
	{
		"Bone Blossom",
		3,
		200000,
		40
	},
	{
		"Horsetail",
		3,
		30000,
		75
	},
	{
		"Lingonberry",
		0.5,
		35000,
		150
	},
	{
		"Amber Spine",
		6,
		55000,
		250
	},
	{
		"Grand Volcania",
		7,
		70555,
		400
	},
	{
		"Noble Flower",
		5,
		20000,
		250
	},
	{
		"Ice Cream Bean",
		4,
		4500,
		200
	},
	{
		"Lime",
		1,
		1000,
		125
	},
	{
		"White Mulberry",
		3,
		3000,
		200
	},
	{
		"Merica Mushroom",
		30,
		40000,
		20
	},
	{
		"Monoblooma",
		0.5,
		22000,
		150
	},
	{
		"Serenity",
		0.25,
		30000,
		150
	},
	{
		"Taro Flower",
		7,
		120000,
		300
	},
	{
		"Zen Rocks",
		18,
		150000,
		300
	},
	{
		"Hinomai",
		10,
		80000,
		400
	},
	{
		"Maple Apple",
		3.5,
		77777,
		350
	},
	{
		"Zenflare",
		1.4,
		25000,
		90
	},
	{
		"Sakura Bush",
		1.5,
		28575,
		90
	},
	{
		"Soft Sunshine",
		2,
		45000,
		200
	},
	{
		"Spiked Mango",
		15,
		67500,
		400
	},
	{
		"Enkaku",
		5,
		62000,
		200
	},
	{
		"Dezen",
		2,
		29250,
		40
	},
	{
		"Lucky Bamboo",
		5,
		65000,
		300
	},
	{
		"Tranquil Bloom",
		4,
		93333,
		120
	},
	{
		"Onion",
		1.5,
		10000,
		50
	},
	{
		"Jalapeno",
		4,
		30000,
		150
	},
	{
		"Crown Melon",
		4.5,
		50000,
		250
	},
	{
		"Sugarglaze",
		5,
		70000,
		300
	},
	{
		"Tall Asparagus",
		8,
		100000,
		400
	},
	{
		"Grand Tomato",
		8,
		88000,
		300
	},
	{
		"Artichoke",
		1.5,
		30000,
		75
	},
	{
		"Taco Fern",
		9,
		75000,
		80
	},
	{
		"Twisted Tangle",
		3,
		20000,
		80
	},
	{
		"Veinpetal",
		9,
		60000,
		70
	},
	{
		"Rhubarb",
		2,
		15000,
		80
	},
	{
		"Badlands Pepper",
		3.5,
		45000,
		125
	},
	{
		"King Cabbage",
		9,
		120000,
		400
	},
	{
		"Spring Onion",
		1.5,
		30000,
		75
	},
	{
		"Butternut Squash",
		5,
		35000,
		200
	},
	{
		"Pricklefruit",
		8,
		80000,
		300
	},
	{
		"Bitter Melon",
		3.5,
		77000,
		200
	},
	{
		"Golden Egg",
		8,
		250000,
		50
	},
	{
		"Flare Daisy",
		1.5,
		25000,
		125
	},
	{
		"Duskpuff",
		3,
		35000,
		150
	},
	{
		"Mangosteen",
		1.5,
		50000,
		150
	},
	{
		"Poseidon Plant",
		3,
		65555,
		400
	},
	{
		"Gleamroot",
		2.5,
		75000,
		200
	},
	{
		"Princess Thorn",
		12,
		111111,
		500
	},
	{
		"Mandrake",
		3,
		50000,
		80
	},
	{
		"Canary Melon",
		8,
		65000,
		300
	},
	{
		"Amberheart",
		4,
		175000,
		200
	},
	{
		"Crown of Thorns",
		0.85,
		25000,
		100
	},
	{
		"Calla Lily",
		8,
		67676,
		150
	},
	{
		"Cyclamen",
		9,
		95000,
		350
	},
	{
		"Glowpod",
		3,
		30000,
		200
	},
	{
		"Flare Melon",
		4,
		50000,
		200
	},
	{
		"Willowberry",
		4,
		73500,
		250
	},
	{
		"Sunbulb",
		3,
		20000,
		125
	},
	{
		"Glowthorn",
		3,
		35000,
		140
	},
	{
		"Lightshoot",
		2,
		40444,
		290
	},
	{
		"Briar Rose",
		7,
		75000,
		450
	},
	{
		"Spirit Flower",
		6,
		135000,
		500
	},
	{
		"Wispwing",
		10,
		180000,
		500
	},
	{
		"Mega Mushroom",
		70,
		500,
		2000000
	},
	{
		"Cherry Blossom",
		3,
		500,
		400
	},
	{
		"Purple Cabbage",
		5,
		500,
		70
	},
	{
		"Lemon",
		1,
		350,
		50
	},
	{
		"Pink Tulip",
		0.05,
		850,
		55
	},
	{
		"Dragon Sapling",
		8,
		69000,
		275
	},
	{
		"Sinisterdrip",
		5,
		69000,
		275
	},
	{
		"Fruitball",
		6,
		35000,
		90
	},
	{
		"Log Pumpkin",
		10,
		18000,
		120
	},
	{
		"Aura Flora",
		2.9,
		29000,
		270
	},
	{
		"Mutant Carrot",
		10,
		18000,
		90
	},
	{
		"Cyclamen",
		9,
		6500,
		160
	},
	{
		"King Palm",
		6,
		15000,
		140
	},
	{
		"Crown of Thorns",
		0.85,
		3500,
		70
	},
	{
		"Glowpod",
		3,
		7500,
		90
	},
	{
		"Willowberry",
		4,
		7500,
		140
	},
	{
		"Calla Lily",
		8,
		7500,
		180
	},
	{
		"Spectralis",
		3,
		7500,
		90
	},
	{
		"Flare Melon",
		4,
		12500,
		120
	},
	{
		"Spirit Lantern",
		10,
		7500,
		60
	},
	{
		"Aurora Vine",
		4.5,
		120000,
		100
	},
	{
		"Snaparino Beanarini",
		4,
		35000,
		100
	},
	{
		"Shimmersprout",
		1,
		350,
		50
	},
	{
		"Pomegranate",
		2,
		350,
		135
	},
	{
		"Horned Melon",
		3,
		8500,
		90
	},
	{
		"Untold Bell",
		3,
		15000,
		145
	},
	{
		"Emerald Bud",
		5,
		7500,
		125
	},
	{
		"Ackee",
		1.5,
		5500,
		105
	}
}
for _, v5 in v_u_3 do
	local v6 = v2.VariantNames
	local v7 = v5[1]
	table.insert(v6, v7)
end
local v_u_8 = {
	{ "Gold", 4, 20 },
	{ "Rainbow", 1, 50 }
}
local v_u_9 = {
	{ "Common", Color3.new(0.666667, 0.666667, 0.666667) },
	{ "Uncommon", Color3.new(0.32549, 0.666667, 0.384314) },
	{ "Rare", Color3.new(0.027451, 0.466667, 1) },
	{ "Legendary", Color3.new(1, 1, 0) },
	{ "Mythical", Color3.new(0.666667, 0.333333, 1) },
	{ "Divine", Color3.fromRGB(255, 85, 0) },
	{ "Prismatic", Color3.fromHSV(0, 1, 1), true },
	{ "Transcendent", Color3.fromHSV(0.7, 1, 1), true }
}
local v_u_10 = {
	{
		"Carrot Seed",
		"Carrot",
		1.1,
		"Common",
		3248692171,
		10,
		5,
		3269339926
	},
	{
		"Strawberry Seed",
		"Strawberry",
		2,
		"Common",
		3248695947,
		50,
		3,
		3269339924
	},
	{
		"Tomato Seed",
		"Tomato",
		4,
		"Rare",
		3248696942,
		800,
		1,
		3269339929
	},
	{
		"Blueberry Seed",
		"Blueberry",
		3,
		"Uncommon",
		3248690960,
		400,
		3,
		3269339931
	},
	{
		"Orange Tulip Seed",
		"Orange Tulip",
		3,
		"Common",
		3265927408,
		100,
		0,
		3269339925
	},
	{
		"Corn Seed",
		"Corn",
		5,
		"Rare",
		3248692845,
		1300,
		0,
		3269339919
	},
	{
		"Pumpkin Seed",
		"Pumpkin",
		10,
		"Legendary",
		3248695199,
		3000,
		0,
		3269339934
	},
	{
		"Daffodil Seed",
		"Daffodil",
		10,
		"Common",
		3265927978,
		100,
		0,
		3269339921
	},
	{
		"Watermelon Seed",
		"Watermelon",
		7,
		"Legendary",
		3248697546,
		2500,
		0,
		3269339904
	},
	{
		"Apple Seed",
		"Apple",
		14,
		"Legendary",
		3248716238,
		3250,
		0,
		3269339923
	},
	{
		"Bamboo Seed",
		"Bamboo",
		3,
		"Uncommon",
		3261009117,
		4000,
		3,
		3269339922
	},
	{
		"Purple Cabbage Seed",
		"Purple Cabbage",
		40,
		"Mythical",
		3273005969,
		5250,
		0,
		3273008000
	},
	{
		"Coconut Seed",
		"Coconut",
		20,
		"Mythical",
		3248744789,
		4750,
		0,
		3269339918
	},
	{
		"Cactus Seed",
		"Cactus",
		100,
		"Legendary",
		3260940714,
		17000,
		0,
		3269339920
	},
	{
		"Eggplant Seed",
		"Eggplant",
		16,
		"Mythical",
		3273006109,
		30000,
		0,
		3273007733
	},
	{
		"Dragon Fruit Seed",
		"Dragon Fruit",
		40,
		"Mythical",
		3253012192,
		27000,
		0,
		3269339909
	},
	{
		"Mango Seed",
		"Mango",
		70,
		"Mythical",
		3259333414,
		50000,
		0,
		3269339912
	},
	{
		"Grape Seed",
		"Grape",
		20,
		"Mythical",
		3261068725,
		4750,
		0,
		3269339905
	},
	{
		"Pepper Seed",
		"Pepper",
		2,
		"Rare",
		3277675404,
		25000,
		3,
		3277675837
	},
	{
		"Cacao Seed",
		"Cacao",
		2,
		"Rare",
		3282870834,
		50,
		3,
		3282871246
	},
	{
		"Beanstalk Seed",
		"Beanstalk",
		2,
		"Rare",
		3284390402,
		50,
		3,
		3284390954
	},
	{
		"Coolcool Coolcool Beanbeanstalk Seed",
		"Coolcool Beanbeanstalk",
		2,
		"Rare",
		0,
		50,
		3,
		0
	},
	{
		"Burning Bud Seed",
		"Burning Bud",
		2,
		"Rare",
		3316826714,
		50,
		3,
		3316827012
	},
	{
		"Red Lollipop Seed",
		"Red Lollipop",
		1.5,
		"Rare",
		3268186603,
		100,
		0,
		nil
	},
	{
		"Blue Lollipop Seed",
		"Blue Lollipop",
		1.5,
		"Rare",
		3268186832,
		100,
		0,
		nil
	},
	{
		"Candy Sunflower Seed",
		"Candy Sunflower",
		1.5,
		"Legendary",
		3268187175,
		500,
		0,
		nil
	},
	{
		"Candy Blossom Seed",
		"Candy Blossom",
		10,
		"Divine",
		3268187638,
		8000,
		0,
		nil
	},
	{
		"Peach Seed",
		"Peach",
		10,
		"Rare",
		0,
		10000,
		0,
		nil
	},
	{
		"Raspberry Seed",
		"Raspberry",
		10,
		"Rare",
		0,
		10000,
		0,
		nil
	},
	{
		"Pineapple Seed",
		"Pineapple",
		10,
		"Rare",
		3312005774,
		10000,
		0,
		3312005892
	},
	{
		"Papaya Seed",
		"Papaya",
		10,
		"Rare",
		3265927598,
		10000,
		0,
		nil
	},
	{
		"Banana Seed",
		"Banana",
		10,
		"Rare",
		3269001250,
		8000,
		0,
		3312010696
	},
	{
		"Passionfruit Seed",
		"Passionfruit",
		10,
		"Rare",
		3265927598,
		10000,
		0,
		nil
	},
	{
		"Soul Fruit Seed",
		"Soul Fruit",
		10000000,
		"Robux",
		1,
		0,
		0,
		nil
	},
	{
		"Cursed Fruit Seed",
		"Cursed Fruit",
		10000000,
		"Robux",
		1,
		0,
		0,
		nil
	},
	{
		"Cranberry Seed",
		"Cranberry",
		10,
		"Rare",
		0,
		10000,
		0,
		nil
	},
	{
		"Durian Seed",
		"Durian",
		2,
		"Common",
		0,
		50,
		3,
		nil
	},
	{
		"Lotus Seed",
		"Lotus",
		2,
		"Common",
		0,
		50,
		3,
		nil
	},
	{
		"Venus Fly Trap Seed",
		"Venus Fly Trap",
		10,
		"Rare",
		0,
		10000,
		0,
		nil
	},
	{
		"Nightshade Seed",
		"Nightshade",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Glowshroom Seed",
		"Glowshroom",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Mint Seed",
		"Mint",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Moonflower Seed",
		"Moonflower",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Starfruit Seed",
		"Starfruit",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Moonglow Seed",
		"Moonglow",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Moon Blossom Seed",
		"Moon Blossom",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Mega Mushroom Seed",
		"Mega Mushroom",
		10,
		"Divine",
		0,
		10000,
		0,
		nil
	},
	{
		"Mushroom Seed",
		"Mushroom",
		10,
		"Rare",
		3273973729,
		10000,
		0,
		3273973524
	},
	{
		"Succulent Seed",
		"Succulent",
		2,
		"Common",
		0,
		50,
		3,
		nil
	},
	{
		"Lemon Seed",
		"Lemon",
		4,
		"Rare",
		0,
		800,
		1,
		nil
	},
	{
		"Cherry Blossom Seed",
		"Cherry Blossom",
		2,
		"Common",
		0,
		50,
		3,
		nil
	},
	{
		"Avocado Seed",
		"Avocado",
		2,
		"Rare",
		3312011056,
		50,
		3,
		3312011436
	},
	{
		"Pink Tulip Seed",
		"Pink Tulip",
		15,
		"Common",
		3265927598,
		100,
		0,
		nil
	},
	{
		"Crocus Seed",
		"Crocus",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Crimson Vine Seed",
		"Crimson Vine",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Moon Melon Seed",
		"Moon Melon",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Blood Banana Seed",
		"Blood Banana",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Moon Mango Seed",
		"Moon Mango",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Celestiberry Seed",
		"Celestiberry",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Purple Dahlia Seed",
		"Purple Dahlia",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Pink Lily Seed",
		"Pink Lily",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Hive Fruit Seed",
		"Hive Fruit",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Sunflower Seed",
		"Sunflower",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Rose Seed",
		"Rose",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Foxglove Seed",
		"Foxglove",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Bee Balm Seed",
		"Bee Balm",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Noble Flower Seed",
		"Noble Flower",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Honeysuckle Seed",
		"Honeysuckle",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Nectar Thorn Seed",
		"Nectar Thorn",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Elephant Ears Seed",
		"Elephant Ears",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Horsetail Seed",
		"Horsetail",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Traveler\'s Fruit Seed",
		"Traveler\'s Fruit",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Dandelion Seed",
		"Dandelion",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Manuka Flower Seed",
		"Manuka Flower",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Delphinium Seed",
		"Delphinium",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Peace Lily Seed",
		"Peace Lily",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Bendboo Seed",
		"Bendboo",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Violet Corn Seed",
		"Violet Corn",
		5,
		"Rare",
		0,
		1300,
		0,
		nil
	},
	{
		"Parasol Flower Seed",
		"Parasol Flower",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Lavender Seed",
		"Lavender",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Nectarine Seed",
		"Nectarine",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Ember Lily Seed",
		"Ember Lily",
		10,
		"Common",
		3300984139,
		100,
		0,
		3300985820
	},
	{
		"Nectarshade Seed",
		"Nectarshade",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Lumira Seed",
		"Lumira",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Suncoil Seed",
		"Suncoil",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Prickly Pear Seed",
		"Prickly Pear",
		10,
		"Common",
		3312013208,
		100,
		0,
		3312013360
	},
	{
		"Green Apple Seed",
		"Green Apple",
		10,
		"Legendary",
		3312008833,
		100,
		0,
		3312008995
	},
	{
		"Sugar Apple Seed",
		"Sugar Apple",
		10,
		"Legendary",
		3304968889,
		100,
		0,
		3304969010
	},
	{
		"Dragon Pepper Seed",
		"Dragon Pepper",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Cocovine Seed",
		"Cocovine",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Loquat Seed",
		"Loquat",
		10,
		"Legendary",
		3312014286,
		100,
		0,
		3312014416
	},
	{
		"Ice Cream Bean Seed",
		"Ice Cream Bean",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Lime Seed",
		"Lime",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Kiwi Seed",
		"Kiwi",
		10,
		"Legendary",
		3312011732,
		100,
		0,
		3312011920
	},
	{
		"Feijoa Seed",
		"Feijoa",
		10,
		"Legendary",
		3312013874,
		100,
		0,
		3312014052
	},
	{
		"Cantaloupe Seed",
		"Cantaloupe",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Cauliflower Seed",
		"Cauliflower",
		10,
		"Legendary",
		3312007044,
		100,
		0,
		3312007405
	},
	{
		"Wild Carrot Seed",
		"Wild Carrot",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Rosy Delight Seed",
		"Rosy Delight",
		10,
		"Divine",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Bell Pepper Seed",
		"Bell Pepper",
		10,
		"Divine",
		3312012483,
		100,
		0,
		3312012716
	},
	{
		"Aloe Vera Seed",
		"Aloe Vera",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Rafflesia Seed",
		"Rafflesia",
		10,
		"Legendary",
		3317729900,
		100,
		0,
		3317750415
	},
	{
		"White Mulberry Seed",
		"White Mulberry",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Lily of the Valley Seed",
		"Lily of the Valley",
		10,
		"Divine",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Guanabana Seed",
		"Guanabana",
		10,
		"Divine",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Pitcher Plant Seed",
		"Pitcher Plant",
		10,
		"Legendary",
		3317730202,
		100,
		0,
		3317750224
	},
	{
		"Bone Blossom Seed",
		"Bone Blossom",
		10,
		"Transcendent",
		0,
		100,
		0,
		0
	},
	{
		"Stonebite Seed",
		"Stonebite",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Firefly Fern Seed",
		"Firefly Fern",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Horned Dinoshroom Seed",
		"Horned Dinoshroom",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Grand Volcania Seed",
		"Grand Volcania",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Paradise Petal Seed",
		"Paradise Petal",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Boneboo Seed",
		"Boneboo",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Merica Mushroom Seed",
		"Merica Mushroom",
		10,
		"Legendary",
		0,
		10000,
		0,
		0
	},
	{
		"Liberty Lily Seed",
		"Liberty Lily",
		10,
		"Rare",
		0,
		10000,
		0,
		0
	},
	{
		"Firework Flower Seed",
		"Firework Flower",
		10,
		"Rare",
		0,
		10000,
		0,
		0
	},
	{
		"Fossilight Seed",
		"Fossilight",
		10,
		"Rare",
		0,
		10000,
		0,
		0
	},
	{
		"Amber Spine Seed",
		"Amber Spine",
		10,
		"Rare",
		0,
		10000,
		0,
		0
	},
	{
		"Giant Pinecone Seed",
		"Giant Pinecone",
		10,
		"Prismatic",
		3330562080,
		100,
		0,
		3330562261
	},
	{
		"Lingonberry Seed",
		"Lingonberry",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Spiked Mango Seed",
		"Spiked Mango",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Serenity Seed",
		"Serenity",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Zenflare Seed",
		"Zenflare",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Monoblooma Seed",
		"Monoblooma",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Maple Apple Seed",
		"Maple Apple",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Soft Sunshine Seed",
		"Soft Sunshine",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Zen Rocks Seed",
		"Zen Rocks",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Dragon Sapling Seed",
		"Dragon Sapling",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Hinomai Seed",
		"Hinomai",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Sinisterdrip Seed",
		"Sinisterdrip",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Lucky Bamboo Seed",
		"Lucky Bamboo",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Trainquil Bloom Seed",
		"Trainquil Bloom",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Veinpetal Seed",
		"Veinpetal",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Elder Strawberry Seed",
		"Elder Strawberry",
		10,
		"Legendary",
		3345148119,
		100,
		0,
		3345148525
	},
	{
		"Dezen Seed",
		"Dezen",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Sakura Bush Seed",
		"Sakura Bush",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Enkaku Seed",
		"Enkaku",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Fruitball Seed",
		"Fruitball",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Onion Seed",
		"Onion",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Jalapeno Seed",
		"Jalapeno",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Artichoke Seed",
		"Artichoke",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Grand Tomato Seed",
		"Grand Tomato",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Tall Asparagus Seed",
		"Tall Asparagus",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Crown Melon Seed",
		"Crown Melon",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Sugarglaze Seed",
		"Sugarglaze",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Taco Fern Seed",
		"Taco Fern",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Potato Seed",
		"Potato",
		10,
		"Legendary",
		3388363390,
		100,
		0,
		3388449849
	},
	{
		"Broccoli Seed",
		"Broccoli",
		10,
		"Legendary",
		3388363071,
		100,
		0,
		3388448748
	},
	{
		"Bitter Melon Seed",
		"Bitter Melon",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Rhubarb Seed",
		"Rhubarb",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Spring Onion Seed",
		"Spring Onion",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Log Pumpkin Seed",
		"Log Pumpkin",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"King Cabbage Seed",
		"King Cabbage",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Badlands Pepper Seed",
		"Badlands Pepper",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Butternut Squash Seed",
		"Butternut Squash",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Pricklefruit Seed",
		"Pricklefruit",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Canary Melon Seed",
		"Canary Melon",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Poseidon Plant Seed",
		"Poseidon Plant",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Gleamroot Seed",
		"Gleamroot",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Aura Flora Seed",
		"Aura Flora",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Mangosteen Seed",
		"Mangosteen",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Mandrake Seed",
		"Mandrake",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Golden Egg Seed",
		"Golden Egg",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Mutant Carrot Seed",
		"Mutant Carrot",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Princess Thorn Seed",
		"Princess Thorn",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Cyclamen Seed",
		"Cyclamen",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Amberheart Seed",
		"Amberheart",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Flare Daisy Seed",
		"Flare Daisy",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Duskpuff Seed",
		"Duskpuff",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"King Palm Seed",
		"King Palm",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Romanesco Seed",
		"Romanesco",
		10,
		"Legendary",
		3372004188,
		100,
		0,
		3372004716
	},
	{
		"Crown of Thorns Seed",
		"Crown of Thorns",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Glowpod Seed",
		"Glowpod",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Willowberry Seed",
		"Willowberry",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Calla Lily Seed",
		"Calla Lily",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Spectralis Seed",
		"Spectralis",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Flare Melon Seed",
		"Flare Melon",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Lightshoot Seed",
		"Lightshoot",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Spirit Lantern Seed",
		"Spirit Lantern",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Aurora Vine Seed",
		"Aurora Vine",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Snaparino Beanarini Seed",
		"Snaparino Beanarini",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Shimmersprout Seed",
		"Shimmersprout",
		4,
		"Rare",
		0,
		800,
		1,
		nil
	},
	{
		"Pomegranate Seed",
		"Pomegranate",
		4,
		"Rare",
		0,
		800,
		1,
		nil
	},
	{
		"Glowthorn Seed",
		"Glowthorn",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Horned Melon Seed",
		"Horned Melon",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Briar Rose Seed",
		"Briar Rose",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Spirit Flower Seed",
		"Spirit Flower",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Untold Bell Seed",
		"Untold Bell",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Emerald Bud Seed",
		"Emerald Bud",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Cocomango Seed",
		"Cocomango",
		10,
		"Rare",
		3388359799,
		100,
		0,
		3388451065
	},
	{
		"Wispwing Seed",
		"Wispwing",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Ackee Seed",
		"Ackee",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Brussels Sprout Seed",
		"Brussels Sprout",
		10,
		"Rare",
		3388360759,
		100,
		0,
		3388450348
	},
	{
		"Sunbulb Seed",
		"Sunbulb",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	}
}
function v2.Return_All_Data()
	-- upvalues: (copy) v_u_4
	return v_u_4
end
function v2.Return_All_Seeds()
	-- upvalues: (copy) v_u_10
	return v_u_10
end
function v2.Return_All_Seed_Rarities()
	-- upvalues: (copy) v_u_9
	return v_u_9
end
function v2.Return_Seed_Data(p11)
	-- upvalues: (copy) v_u_10
	for _, v12 in pairs(v_u_10) do
		if v12[1] == p11 then
			return v12
		end
	end
	return nil
end
function v2.Return_Rarity_Data(p13)
	-- upvalues: (copy) v_u_9
	for _, v14 in pairs(v_u_9) do
		if v14[1] == p13 then
			return v14
		end
	end
end
function v2.Return_Variant_Multiplier(p15)
	-- upvalues: (copy) v_u_3
	for _, v16 in pairs(v_u_3) do
		if v16[1] == p15 then
			return v16[3]
		end
	end
	return 0
end
function v2.Return_Random_Variant(p17)
	-- upvalues: (copy) v_u_3
	local v18 = math.max(p17, 1)
	local v19 = 0
	for _, v20 in v_u_3 do
		v19 = v19 + v20[2] / (v20[1] == "Normal" and v18 and v18 or 1)
	end
	local v21 = math.random(0, v19)
	local v22 = 0
	for _, v23 in v_u_3 do
		v22 = v22 + v23[2] / (v23[1] == "Normal" and v18 and v18 or 1)
		if v21 <= v22 then
			return v23[1]
		end
	end
end
function v2.Return_Random_Super_Variant()
	-- upvalues: (copy) v_u_8
	local v24 = 0
	for _, v25 in ipairs(v_u_8) do
		v24 = v24 + v25[2]
	end
	local v26 = math.random(1, v24)
	local v27 = 0
	for _, v28 in ipairs(v_u_8) do
		v27 = v27 + v28[2]
		if v26 <= v27 then
			return v28[1]
		end
	end
end
function v2.Return_Data(p29)
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	local v30 = v_u_1:StipFlavourText(p29)
	for _, v31 in v_u_4 do
		if v31[1] == v30 then
			return v31
		end
	end
	return nil
end
return v2
