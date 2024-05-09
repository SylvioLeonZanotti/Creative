-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	["vehiclevip"] = {
		["Index"] = "bluecard",
		["Name"] = "Veículo 30 Dias",
		["Description"] = "Usado para adiquirir um veículo até <green>60 diamantes</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["geode"] = {
		["Index"] = "geode",
		["Name"] = "Geodo",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["contrabandbox1"] = {
		["Index"] = "package",
		["Name"] = "Pacote",
		["Description"] = "<green>Contrabando - 1</green>",
		["Type"] = "Comum",
		["Weight"] = 0.50
	},
	["contrabandbox2"] = {
		["Index"] = "package",
		["Name"] = "Pacote",
		["Description"] = "<green>Contrabando - 2</green>",
		["Type"] = "Comum",
		["Weight"] = 0.50
	},
	["ammobox"] = {
		["Index"] = "package",
		["Name"] = "Pacote",
		["Description"] = "<green>Munições</green>",
		["Type"] = "Comum",
		["Weight"] = 0.50
	},
	["ammobox2"] = {
		["Index"] = "package",
		["Name"] = "Pacote",
		["Description"] = "<green>Munições</green>",
		["Type"] = "Comum",
		["Weight"] = 0.50
	},
	["weaponbox"] = {
		["Index"] = "package",
		["Name"] = "Pacote",
		["Description"] = "<green>Armas</green>",
		["Type"] = "Comum",
		["Weight"] = 0.50
	},
	["fabric"] = {
		["Index"] = "fabric",
		["Name"] = "Tecido",
		["Type"] = "Comum",
		["Economy"] = 100,
		["Weight"] = 0.05
	},
	["leather"] = {
		["Index"] = "leather",
		["Name"] = "Couro",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 20
	},
	["racetrophy"] = {
		["Index"] = "racetrophy",
		["Name"] = "Troféu",
		["Type"] = "Comum",
		["Weight"] = 7.25,
		["Economy"] = 3150
	},
	["races"] = {
		["Index"] = "races",
		["Name"] = "Credencial",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 2500
	},
	["c4"] = {
		["Index"] = "c4",
		["Name"] = "C4",
		["Type"] = "Usável",
		["Weight"] = 2.75,
		["Economy"] = 825
	},
	["key"] = {
		["Index"] = "key",
		["Name"] = "Chaves",
		["Type"] = "Comum",
		["Weight"] = 0.25
	},
	["paper"] = {
		["Index"] = "paper",
		["Name"] = "Papel",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 120
	},
	["oilbarrel"] = {
		["Index"] = "oilbarrel",
		["Name"] = "Barril de Petróleo",
		["Type"] = "Comum",
		["Weight"] = 17.25,
		["Economy"] = 1875,
		["Max"] = 1
	},
	["oilgallon"] = {
		["Index"] = "oilgallon",
		["Name"] = "Galão de Petróleo",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 5.25,
		["Economy"] = 875,
		["Max"] = 3
	},
	["packagebox"] = {
		["Index"] = "package",
		["Name"] = "Pacote",
		["Type"] = "Comum",
		["Durability"] = 1,
		["Weight"] = 7.25,
		["Max"] = 1
	},
	["adrenaline"] = {
		["Index"] = "adrenaline",
		["Name"] = "Adrenalina",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 925
	},
	["recyclable"] = {
		["Index"] = "recyclable",
		["Name"] = "Material Reciclável",
		["Type"] = "Comum",
		["Weight"] = 0.015,
		["Economy"] = 5
	},
	["ration"] = {
		["Index"] = "ration",
		["Name"] = "Ração Animal",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 125
	},
	["coyote1star"] = {
		["Index"] = "box1star",
		["Name"] = "Coyote",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 1000
	},
	["coyote2star"] = {
		["Index"] = "box2star",
		["Name"] = "Coyote",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 1000
	},
	["coyote3star"] = {
		["Index"] = "box3star",
		["Name"] = "Coyote",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 1000
	},
	["mtlion1star"] = {
		["Index"] = "box1star",
		["Name"] = "Puma",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 1000
	},
	["mtlion2star"] = {
		["Index"] = "box2star",
		["Name"] = "Puma",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 1000
	},
	["mtlion3star"] = {
		["Index"] = "box3star",
		["Name"] = "Puma",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 1000
	},
	["boar1star"] = {
		["Index"] = "box1star",
		["Name"] = "Javali",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 1000
	},
	["boar2star"] = {
		["Index"] = "box2star",
		["Name"] = "Javali",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 1000
	},
	["boar3star"] = {
		["Index"] = "box3star",
		["Name"] = "Javali",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 1000
	},
	["deer1star"] = {
		["Index"] = "box1star",
		["Name"] = "Cervo",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 1000
	},
	["deer2star"] = {
		["Index"] = "box2star",
		["Name"] = "Cervo",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 1000
	},
	["deer3star"] = {
		["Index"] = "box3star",
		["Name"] = "Cervo",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 1000
	},
	["coal"] = {
		["Index"] = "coal",
		["Name"] = "Carvão",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 5
	},
	["gunpowder"] = {
		["Index"] = "gunpowder",
		["Name"] = "Pólvora",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 50
	},
	["scrap"] = {
		["Index"] = "scrap",
		["Name"] = "Sucata",
		["Type"] = "Comum",
		["Weight"] = 0.025,
		["Economy"] = 1
	},
	["treasurebox"] = {
		["Index"] = "treasurebox",
		["Name"] = "Baú do Tesouro",
		["Type"] = "Usável",
		["Weight"] = 4.25,
		["Economy"] = 3000
	},
	["fishingrod"] = {
		["Index"] = "fishingrod",
		["Name"] = "Vara de Pescar",
		["Type"] = "Usável",
		["Weight"] = 1.25,
		["Economy"] = 725
	},
	["worm"] = {
		["Index"] = "worm",
		["Name"] = "Minhoca",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 5
	},
	["anchovy"] = {
		["Index"] = "anchovy",
		["Name"] = "Anchova",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 45
	},
	["catfish"] = {
		["Index"] = "catfish",
		["Name"] = "Peixe-Gato",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 45
	},
	["herring"] = {
		["Index"] = "herring",
		["Name"] = "Arenque",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 50
	},
	["orangeroughy"] = {
		["Index"] = "orangeroughy",
		["Name"] = "Peixe Relógio",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 45
	},
	["salmon"] = {
		["Index"] = "salmon",
		["Name"] = "Salmão",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 55
	},
	["sardine"] = {
		["Index"] = "sardine",
		["Name"] = "Sardinha",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 35
	},
	["smallshark"] = {
		["Index"] = "smallshark",
		["Name"] = "Tubarão Pequeno",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 100
	},
	["smalltrout"] = {
		["Index"] = "smalltrout",
		["Name"] = "Truta Pequena",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 40
	},
	["yellowperch"] = {
		["Index"] = "yellowperch",
		["Name"] = "Poleiro Amarelo",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 45
	},
	["sewingkit"] = {
		["Index"] = "sewingkit",
		["Name"] = "Kit de Costura",
		["Description"] = "Utilizado para reparar mochilas <b>Pequenas</b>, <b>Médias</b> e <b>Grandes</b>.",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 70000,
		["Clear"] = true
	},
	["suitcase"] = {
		["Index"] = "suitcase",
		["Name"] = "Maleta",
		["Type"] = "Usável",
		["Weight"] = 1.0,
		["Economy"] = 275,
		["Unique"] = true,
		["Drops"] = true
	},
	["backpack"] = {
		["Index"] = "backpack",
		["Name"] = "Mochila",
		["Description"] = "Um compartimento sobressalente com <b>25 Kg</b> utilizado para guardar seus pertences valiosos.",
		["Type"] = "Usável",
		["Weight"] = 2.5,
		["Economy"] = 4000,
		["Unique"] = true
	},
	["sapphire_ore"] = {
		["Index"] = "sapphire_ore",
		["Name"] = "Minério de Safira",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 80
	},
	["emerald_ore"] = {
		["Index"] = "emerald_ore",
		["Name"] = "Minério de Esmeralda",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 80
	},
	["ruby_ore"] = {
		["Index"] = "ruby_ore",
		["Name"] = "Minério de Ruby",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 80
	},
	["gold_ore"] = {
		["Index"] = "gold_ore",
		["Name"] = "Minério de Ouro",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 70
	},
	["iron_ore"] = {
		["Index"] = "iron_ore",
		["Name"] = "Minério de Ferro",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 50
	},
	["lead_ore"] = {
		["Index"] = "lead_ore",
		["Name"] = "Minério de Chumbo",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 50
	},
	["sulfur_ore"] = {
		["Index"] = "sulfur_ore",
		["Name"] = "Minério de Enxofre",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 50
	},
	["tin_ore"] = {
		["Index"] = "tin_ore",
		["Name"] = "Minério de Estanho",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 50
	},
	["diamond_ore"] = {
		["Index"] = "diamond_ore",
		["Name"] = "Minério de Diamante",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 70
	},
	["copper_ore"] = {
		["Index"] = "copper_ore",
		["Name"] = "Minério de Cobre",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 60
	},
	["sapphire_pure"] = {
		["Index"] = "sapphire_pure",
		["Name"] = "Safira Lapidada",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 80
	},
	["emerald_pure"] = {
		["Index"] = "emerald_pure",
		["Name"] = "Esmeralda Lapidada",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 80
	},
	["ruby_pure"] = {
		["Index"] = "ruby_pure",
		["Name"] = "Ruby Lapidado",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 80
	},
	["gold_pure"] = {
		["Index"] = "gold_pure",
		["Name"] = "Barra de Ouro",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 70
	},
	["iron_pure"] = {
		["Index"] = "iron_pure",
		["Name"] = "Barra de Ferro",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 50
	},
	["lead_pure"] = {
		["Index"] = "lead_pure",
		["Name"] = "Barra de Chumbo",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 50
	},
	["sulfur_pure"] = {
		["Index"] = "sulfur_pure",
		["Name"] = "Enxofre",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 50
	},
	["tin_pure"] = {
		["Index"] = "tin_pure",
		["Name"] = "Barra de Estanho",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 50
	},
	["diamond_pure"] = {
		["Index"] = "diamond_pure",
		["Name"] = "Diamante Lapidado",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 70
	},
	["copper_pure"] = {
		["Index"] = "copper_pure",
		["Name"] = "Barra de Cobre",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 60
	},
	["binoculars"] = {
		["Index"] = "binoculars",
		["Name"] = "Binóculos",
		["Type"] = "Usável",
		["Durability"] = 20,
		["Weight"] = 1.0,
		["Economy"] = 425
	},
	["camera"] = {
		["Index"] = "camera",
		["Name"] = "Câmera",
		["Type"] = "Usável",
		["Durability"] = 20,
		["Weight"] = 1.0,
		["Economy"] = 425
	},
	["chips"] = {
		["Index"] = "chips",
		["Name"] = "Ficha",
		["Type"] = "Usável",
		["Weight"] = 0.0
	},
	["creditcard"] = {
		["Index"] = "creditcard",
		["Name"] = "Cartão de Crédito",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Clear"] = true,
		["Economy"] = 10
	},
	["diagram"] = {
		["Index"] = "diagram",
		["Name"] = "Diagrama",
		["Description"] = "Aumenta <b>10kg</b> de um compartimento.",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 14000,
		["Clear"] = true,
		["Drops"] = true
	},
	["propertys"] = {
		["Index"] = "propertys",
		["Name"] = "Cartão de Segurança",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Clear"] = true,
		["Economy"] = 10
	},
	["megaphone"] = {
		["Index"] = "megaphone",
		["Name"] = "Megafone",
		["Type"] = "Usável",
		["Durability"] = 15,
		["Weight"] = 3.25,
		["Economy"] = 525
	},
	["repairkit01"] = {
		["Index"] = "repairkit01",
		["Name"] = "Kit de Reparos - Comum",
		["Type"] = "Comum",
		["Weight"] = 3.25,
		["Economy"] = 725
	},
	["repairkit02"] = {
		["Index"] = "repairkit02",
		["Name"] = "Kit de Reparos - Raro",
		["Type"] = "Comum",
		["Weight"] = 3.75,
		["Economy"] = 1725
	},
	["repairkit03"] = {
		["Index"] = "repairkit03",
		["Name"] = "Kit de Reparos - Épico",
		["Type"] = "Comum",
		["Weight"] = 4.25,
		["Economy"] = 5225
	},
	["repairkit04"] = {
		["Index"] = "repairkit04",
		["Name"] = "Kit de Reparos - Lendário",
		["Type"] = "Comum",
		["Weight"] = 5.75,
		["Economy"] = 9725
	},
	["WEAPON_PICKAXE"] = {
		["Index"] = "pickaxe",
		["Name"] = "Picareta",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 2.25,
		["Economy"] = 525
	},
	["WEAPON_PICKAXE_PLUS"] = {
		["Index"] = "pickaxe_plus",
		["Name"] = "Picareta de Diamante",
		["Description"] = "Reduz o tempo de minerar. de <b>10 Segundos</b> para  <b>3 Segundos</b> + Aumenta o Ganho de Itens da <b>Mineração</b>",
		["Repair"] = "repairkit02",
		["Type"] = "Comum",
		["Durability"] = 15,
		["Weight"] = 2.25,
		["Economy"] = 87500
	},
	["badge01"] = {
		["Index"] = "badge01",
		["Name"] = "Distintivo",
		["Description"] = "<green>San Andreas Police Department</green>",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 10
	},
	["badge02"] = {
		["Index"] = "badge02",
		["Name"] = "Distintivo",
		["Description"] = "<green>Emergency Medical Services</green>",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 10
	},
	["nigirizushi"] = {
		["Index"] = "nigirizushi",
		["Name"] = "Nigirizushi",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 0.65,
		["Economy"] = 75,
		["Scape"] = true,
		["Max"] = 3
	},
	["sushi"] = {
		["Index"] = "sushi",
		["Name"] = "Sushi",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 0.65,
		["Economy"] = 75,
		["Scape"] = true,
		["Max"] = 3
	},
	["cupcake"] = {
		["Index"] = "cupcake",
		["Name"] = "Cupcake",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.55,
		["Economy"] = 75,
		["Scape"] = true,
		["Max"] = 3
	},
	["milkshake"] = {
		["Index"] = "milkshake",
		["Name"] = "Milk-shake",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 0.85,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 3
	},
	["milkshakepeanut"] = {
		["Index"] = "milkshakepeanut",
		["Name"] = "Milk-shake de Paçoca",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 0.85,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 3
	},
	["cappuccino"] = {
		["Index"] = "cappuccino",
		["Name"] = "Cappuccino",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 0.65,
		["Economy"] = 150,
		["Scape"] = true,
		["Max"] = 3
	},
	["applelove"] = {
		["Index"] = "applelove",
		["Name"] = "Maça do Amor",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 0.55,
		["Economy"] = 75,
		["Scape"] = true,
		["Max"] = 3
	},
	["credential"] = {
		["Index"] = "credential",
		["Name"] = "Credencial",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 625
	},
	["nitro"] = {
		["Index"] = "nitro",
		["Name"] = "Nitro",
		["Type"] = "Usável",
		["Weight"] = 7.25,
		["Economy"] = 1275
	},
	["postit"] = {
		["Index"] = "postit",
		["Name"] = "Post-It",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 20
	},
	["attachsFlashlight"] = {
		["Index"] = "attachsFlashlight",
		["Name"] = "Lanterna Tatica",
		["Type"] = "Usável",
		["Weight"] = 1.15,
		["Economy"] = 750
	},
	["attachsCrosshair"] = {
		["Index"] = "attachsCrosshair",
		["Name"] = "Mira Holográfica",
		["Type"] = "Usável",
		["Weight"] = 1.15,
		["Economy"] = 750
	},
	["attachsSilencer"] = {
		["Index"] = "attachsSilencer",
		["Name"] = "Silenciador",
		["Type"] = "Usável",
		["Weight"] = 1.15,
		["Economy"] = 750
	},
	["attachsMagazine"] = {
		["Index"] = "attachsMagazine",
		["Name"] = "Pente Estendido",
		["Type"] = "Usável",
		["Weight"] = 1.15,
		["Economy"] = 750
	},
	["attachsGrip"] = {
		["Index"] = "attachsGrip",
		["Name"] = "Empunhadura",
		["Type"] = "Usável",
		["Weight"] = 1.15,
		["Economy"] = 750
	},
	["attachsMuzzleFat"] = {
		["Index"] = "attachsMuzzleFat",
		["Name"] = "Compensador Pesado",
		["Type"] = "Usável",
		["Weight"] = 1.15,
		["Economy"] = 750
	},
	["attachsBarrel"] = {
		["Index"] = "attachsBarrel",
		["Name"] = "Cano Pesado",
		["Type"] = "Usável",
		["Weight"] = 1.15,
		["Economy"] = 750
	},
	["attachsMuzzleHeavy"] = {
		["Index"] = "attachsMuzzleHeavy",
		["Name"] = "Compensador Tatico",
		["Type"] = "Usável",
		["Weight"] = 1.15,
		["Economy"] = 750
	},
	["cheese"] = {
		["Index"] = "cheese",
		["Name"] = "Queijo",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 10
	},
	["ziplock"] = {
		["Index"] = "ziplock",
		["Name"] = "Ziplock",
		["Type"] = "Comum",
		["Weight"] = 0.045,
		["Economy"] = 5
	},
	["silk"] = {
		["Index"] = "silk",
		["Name"] = "Seda",
		["Type"] = "Comum",
		["Weight"] = 0.095,
		["Economy"] = 3
	},
	["barrier"] = {
		["Index"] = "barrier",
		["Name"] = "Barreira",
		["Type"] = "Usável",
		["Weight"] = 1.75,
		["Economy"] = 250
	},
	["techtrash"] = {
		["Index"] = "techtrash",
		["Name"] = "Lixo Eletrônico",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 125
	},
	["tarp"] = {
		["Index"] = "tarp",
		["Name"] = "Lona",
		["Type"] = "Comum",
		["Weight"] = 0.65,
		["Economy"] = 50
	},
	["sheetmetal"] = {
		["Index"] = "sheetmetal",
		["Name"] = "Chapa de Metal",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 50
	},
	["roadsigns"] = {
		["Index"] = "roadsigns",
		["Name"] = "Placas de Trânsito",
		["Type"] = "Comum",
		["Weight"] = 0.65,
		["Economy"] = 50
	},
	["explosives"] = {
		["Index"] = "explosives",
		["Name"] = "Explosivos",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 75
	},
	["animalfat"] = {
		["Index"] = "animalfat",
		["Name"] = "Gordura Animal",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 10
	},
	["fidentity"] = {
		["Index"] = "identity",
		["Name"] = "Passaporte",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 10000
	},
	["identity"] = {
		["Index"] = "identity",
		["Name"] = "Passaporte",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 5000,
		["Clear"] = true
	},
	["dismantle"] = {
		["Index"] = "dismantle",
		["Name"] = "Contrato",
		["Description"] = "Ativando o mesmo você assume a responsabilidade com o <b>Lester</b> de desmanchar um veículo.",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 125
	},
	["desmanche"] = {
		["Index"] = "dismantle",
		["Name"] = "Desmanche Ilegal",
		["Description"] = "Com esse Desmanche voce pode desmanchar  <b>1 Veiculo</b> Publico",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 125
	},
	["vpn"] = {
		["Index"] = "vpn",
		["Name"] = "Circuito VPN",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Durability"] = 1,
		["Economy"] = 4225
	},
	["blocksignal"] = {
		["Index"] = "blocksignal",
		["Name"] = "Bloqueador de Sinal",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 325
	},
	["pistolbody"] = {
		["Index"] = "pistolbody",
		["Name"] = "Corpo de Pistola",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 425
	},
	["smgbody"] = {
		["Index"] = "smgbody",
		["Name"] = "Corpo de Submetralhadora",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 525
	},
	["riflebody"] = {
		["Index"] = "riflebody",
		["Name"] = "Corpo de Rifle",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 625
	},
	["cotton"] = {
		["Index"] = "cotton",
		["Name"] = "Algodão",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 45
	},
	["plaster"] = {
		["Index"] = "plaster",
		["Name"] = "Esparadrapo",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 35
	},
	["sulfuric"] = {
		["Index"] = "sulfuric",
		["Name"] = "Ácido Sulfúrico",
		["Type"] = "Usável",
		["Weight"] = 0.10,
		["Economy"] = 30
	},
	["saline"] = {
		["Index"] = "saline",
		["Name"] = "Soro Fisiológico",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 25
	},
	["alcohol"] = {
		["Index"] = "alcohol",
		["Name"] = "Álcool",
		["Type"] = "Comum",
		["Weight"] = 0.65,
		["Economy"] = 40
	},
	["notebook"] = {
		["Index"] = "notebook",
		["Name"] = "Notebook",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 5,
		["Weight"] = 7.25,
		["Economy"] = 5750
	},
	["syringe"] = {
		["Index"] = "syringe",
		["Name"] = "Seringa",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 2
	},
	["syringe01"] = {
		["Index"] = "syringe2",
		["Name"] = "Seringa A+",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 50
	},
	["syringe02"] = {
		["Index"] = "syringe2",
		["Name"] = "Seringa B+",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 50
	},
	["syringe03"] = {
		["Index"] = "syringe2",
		["Name"] = "Seringa A-",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 50
	},
	["syringe04"] = {
		["Index"] = "syringe2",
		["Name"] = "Seringa B-",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 50
	},
	["foodjuice"] = {
		["Index"] = "foodjuice",
		["Name"] = "Copo de Suco",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 10,
		["Max"] = 1
	},
	["foodburger"] = {
		["Index"] = "foodburger",
		["Name"] = "Caixa de Lanche",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 10,
		["Max"] = 1
	},
	["foodbox"] = {
		["Index"] = "foodbox",
		["Name"] = "Combo",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Economy"] = 120,
		["Max"] = 3
	},
	["foodboxtoy"] = {
		["Index"] = "foodbox",
		["Name"] = "Combo + Brinquedo",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Economy"] = 270,
		["Max"] = 3
	},
	["vehkey"] = {
		["Index"] = "vehkey",
		["Name"] = "Chave Cópia",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["evidence01"] = {
		["Index"] = "evidence01",
		["Name"] = "Evidência",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 0
	},
	["evidence02"] = {
		["Index"] = "evidence02",
		["Name"] = "Evidência",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 0
	},
	["evidence03"] = {
		["Index"] = "evidence03",
		["Name"] = "Evidência",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 0
	},
	["evidence04"] = {
		["Index"] = "evidence04",
		["Name"] = "Evidência",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 0
	},
	["card01"] = {
		["Index"] = "card01",
		["Name"] = "Cartão Comum",
		["Description"] = "Roubar Lojas de Departamento, Grapesseed & Mergulhador.",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 0.25,
		["Economy"] = 325
	},
	["card02"] = {
		["Index"] = "card02",
		["Name"] = "Cartão In-Comum",
		["Description"] = "Roubar Lojas de Armas.",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 0.25,
		["Economy"] = 325
	},
	["card03"] = {
		["Index"] = "card03",
		["Name"] = "Cartão Épico",
		["Description"] = "Roubar Bancos Fleeca.",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 0.25,
		["Economy"] = 375
	},
	["card04"] = {
		["Index"] = "card04",
		["Name"] = "Cartão Raro",
		["Description"] = "Roubar Barbearias.",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 0.25,
		["Economy"] = 275
	},
	["card05"] = {
		["Index"] = "card05",
		["Name"] = "Cartão Lendário",
		["Description"] = "Roubar Bancos.",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 0.25,
		["Economy"] = 425
	},
	["gemstone"] = {
		["Index"] = "gemstone",
		["Name"] = "Gemstone",
		["Type"] = "Usável",
		["Weight"] = 0.0,
		["Economy"] = 35,
		["Clear"] = true,
		["Drops"] = true
	},
	["radio"] = {
		["Index"] = "radio",
		["Name"] = "Rádio",
		["Type"] = "Usável",
		["Repair"] = "repairkit01",
		["Durability"] = 10,
		["Weight"] = 0.75,
		["Economy"] = 975
	},
	["vest"] = {
		["Index"] = "vest",
		["Name"] = "Colete",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 3.75,
		["Economy"] = 1000
	},
	["bandage"] = {
		["Index"] = "bandage",
		["Name"] = "Bandagem",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 225,
		["Max"] = 5
	},
	["medkit"] = {
		["Index"] = "medkit",
		["Name"] = "Kit Médico",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 575,
		["Max"] = 3
	},
	["pouch"] = {
		["Index"] = "pouch",
		["Name"] = "Malote",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Economy"] = 80
	},
	["woodlog"] = {
		["Index"] = "woodlog",
		["Name"] = "Tora de Madeira",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 40
	},
	["fishingrod"] = {
		["Index"] = "fishingrod",
		["Name"] = "Vara de Pescar",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 10,
		["Weight"] = 2.75,
		["Economy"] = 725
	},
	["animalpelt"] = {
		["Index"] = "animalpelt",
		["Name"] = "Pele Animal",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 25
	},
	["wheat"] = {
		["Index"] = "wheat",
		["Name"] = "Trigo",
		["Type"] = "Usável",
		["Weight"] = 0.10
	},
	["wheatflour"] = {
		["Index"] = "wheatflour",
		["Name"] = "Farinha de Trigo",
		["Type"] = "Comum",
		["Weight"] = 0.20,
		["Economy"] = 45
	},
	["weedbud"] = {
		["Index"] = "weedbud",
		["Name"] = "Broto de Cannabis",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 5
	},
	["joint"] = {
		["Index"] = "joint",
		["Name"] = "Cigarro de Cannabis",
		["Type"] = "Usável",
		["Weight"] = 0.45,
		["Economy"] = 30
	},
	["weedsack"] = {
		["Index"] = "weedsack",
		["Name"] = "Pacote de Cannabis",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 25
	},
	["cokebud"] = {
		["Index"] = "cokebud",
		["Name"] = "Broto de Cocaína",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 5
	},
	["cocaine"] = {
		["Index"] = "cocaine",
		["Name"] = "Carreira de Cocaína",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 30
	},
	["cokesack"] = {
		["Index"] = "cokesack",
		["Name"] = "Pacote de Cocaína",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 25
	},
	["lean"] = {
		["Index"] = "lean",
		["Name"] = "Lean",
		["Type"] = "Usável",
		["Weight"] = 0.05,
		["Economy"] = 725
	},
	["codeine"] = {
		["Index"] = "codeine",
		["Name"] = "Codeína",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 30
	},
	["amphetamine"] = {
		["Index"] = "amphetamine",
		["Name"] = "Anfetamina",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 40
	},
	["bottle"] = {
		["Index"] = "bottle",
		["Name"] = "Frasco",
		["Type"] = "Comum",
		["Economy"] = 100,
		["Weight"] = 0.05
	},
	["meth"] = {
		["Index"] = "meth",
		["Name"] = "Metanfetamina Cristalizada",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 30
	},
	["lancaperfume"] = {
		["Index"] = "lancaperfume",
		["Name"] = "Lança perfume",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 30
	},
	["sonhodokadu"] = {
		["Index"] = "sonhodogomes",
		["Name"] = "Sonho Do Kadu",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 30
	},
	["sonhodogomes"] = {
		["Index"] = "sonhodogomes",
		["Name"] = "Sonho Do Gomes",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 30
	},
	["methliquid"] = {
		["Index"] = "methliquid",
		["Name"] = "Metanfetamina Liquida",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 30
	},
	["acetone"] = {
		["Index"] = "acetone",
		["Name"] = "Acetona",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["drugtoy"] = {
		["Index"] = "drugtoy",
		["Name"] = "Brinquedo",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 75
	},	
	["rolepass"] = {
		["Index"] = "rolepass",
		["Name"] = "Rolepass",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 200000
	},
	["creators"] = {
		["Index"] = "creators",
		["Name"] = "Favelinha Creators",
		["Description"] = "Recebe <b>50x gemas</b>, <b>2x mochilas</b>, <b>Salário de <b>$1.500</b>",
		["Type"] = "Usável",
		["Weight"] = 0.15
	},
	["verify"] = {
		["Index"] = "instaverify",
		["Name"] = "Insta Verificado",
		["Description"] = "Recebe o Selo de Verificado no <br>Instagram</b>",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 120000
	},
	["premiumbronze"] = {
		["Index"] = "premium03",
		["Name"] = "Premium Bronze",
		["Description"] = "Recebe <b>+25Kg</b> de peso na mochila<br>Salário de <b>$2.500</b> a cada <b>30</b> minutos<br>Recebe uma <b>Picareta Plus</b>",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 120000
	},
	["premiumprata"] = {
		["Index"] = "premium",
		["Name"] = "Premium Prata",
		["Description"] = "Recebe <b>40+Kg</b> de peso na mochila<br>Salário de <b>$3.500</b> a cada <b>30</b> minutos<br>Recebe uma <b>Picareta Plus</b> e Recebe uma <b>Chip Telefonico</b>, Recebe uma <b>50x Gemas</b>",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 120000
	},
	["premiumouro"] = {
		["Index"] = "premium04",
		["Name"] = "Premium Ouro",
		["Description"] = "Recebe <b>50+Kg</b> de peso na mochila<br>Salário de <b>$4.000</b> a cada <b>30</b> minutos<br>Recebe uma <b>Picareta Plus</b> e Recebe uma <b>Chip Telefonico</b>, Recebe uma <b>Placa Premium</b>",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 120000
	},
	["premiumplatina"] = {
		["Index"] = "premiumevent",
		["Name"] = "Premium Platina",
		["Description"] = "Recebe <b>60+Kg</b> de peso na mochila<br>Salário de <b>$5.000</b> a cada <b>30</b> minutos<br>Recebe uma <b>Picareta Plus</b> e Recebe uma <b>Chip Telefonico</b>, Recebe uma <b>Placa Premium</b>, Recebe <b>100x Gemas</b> para alugar um Veiculo Rental",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 120000
	},
	["premiumplate"] = {
		["Index"] = "platepremium",
		["Name"] = "Placa Premium",
		["Type"] = "Usável",
		["Description"] = "Personalize a placa do veículo.",
		["Weight"] = 0.75,
		["Economy"] = 175000,
		["Clear"] = true,
		["Drops"] = true
	},
	["creator"] = {
		["Index"] = "newchars",
		["Name"] = "Criação de Personagem",
		["Type"] = "Usável",
		["Weight"] = 0.0,
		["Economy"] = 0
	},
	["newchars"] = {
		["Index"] = "newchars",
		["Name"] = "+1 Personagem",
		["Type"] = "Usável",
		["Description"] = "Aumenta 1 no limite de personagens.",
		["Weight"] = 0.25,
		["Economy"] = 262500,
		["Clear"] = true,
		["Drops"] = true
	},
	["namechange"] = {
		["Index"] = "namechange",
		["Name"] = "Troca de Nome",
		["Type"] = "Usável",
		["Description"] = "Modifica o nome.",
		["Weight"] = 0.25,
		["Economy"] = 175000,
		["Clear"] = true,
		["Drops"] = true
	},
	["chip"] = {
		["Index"] = "chip",
		["Name"] = "Chip Telefônico",
		["Type"] = "Usável",
		["Description"] = "Troca o número do celular.",
		["Weight"] = 0.25,
		["Economy"] = 100000
	},
	["milkbottle"] = {
		["Index"] = "milkbottle",
		["Name"] = "Garrafa de Leite",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 35,
		["Max"] = 3
	},
	["guarananatural"] = {
		["Index"] = "guarananatural",
		["Name"] = "Guaraná Natural",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 0.25,
		["Economy"] = 100,
		["Scape"] = true,
		["Max"] = 3
	},
	["water"] = {
		["Index"] = "water",
		["Name"] = "Água",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 30,
		["Max"] = 3
	},
	["dirtywater"] = {
		["Index"] = "dirtywater",
		["Name"] = "Água Suja",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Scape"] = true,
		["Max"] = 3
	},
	["emptybottle"] = {
		["Index"] = "emptybottle",
		["Name"] = "Garrafa Vazia",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 30,
		["Max"] = 3
	},
	["coffee"] = {
		["Index"] = "coffee",
		["Name"] = "Copo de Café",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 20,
		["Max"] = 3
	},
	["coffeemilk"] = {
		["Index"] = "coffeemilk",
		["Name"] = "Café com Leite",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 0.35,
		["Economy"] = 100,
		["Scape"] = true,
		["Max"] = 3
	},
	["energetic"] = {
		["Index"] = "energetic",
		["Name"] = "Energético",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 75,
		["Scape"] = true,
		["Max"] = 6
	},
	["cola"] = {
		["Index"] = "cola",
		["Name"] = "Cola",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Economy"] = 15,
		["Max"] = 3
	},
	["tacos"] = {
		["Index"] = "tacos",
		["Name"] = "Tacos",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Economy"] = 25,
		["Max"] = 3
	},
	["fries"] = {
		["Index"] = "fries",
		["Name"] = "Fritas",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Economy"] = 15,
		["Max"] = 3
	},
	["friesbacon"] = {
		["Index"] = "friesbacon",
		["Name"] = "Fritas com Bacon",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 0.25,
		["Economy"] = 75,
		["Scape"] = true,
		["Max"] = 3
	},
	["soda"] = {
		["Index"] = "soda",
		["Name"] = "Sprunk",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Economy"] = 15,
		["Max"] = 3
	},
	["apple"] = {
		["Index"] = "apple",
		["Name"] = "Maça",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 15
	},
	["orange"] = {
		["Index"] = "orange",
		["Name"] = "Laranja",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 15
	},
	["strawberry"] = {
		["Index"] = "strawberry",
		["Name"] = "Morango",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 15
	},
	["coffee2"] = {
		["Index"] = "coffee2",
		["Name"] = "Grão de Café",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 15
	},
	["grape"] = {
		["Index"] = "grape",
		["Name"] = "Uva",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 15
	},
	["tange"] = {
		["Index"] = "tange",
		["Name"] = "Tangerina",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 15
	},
	["banana"] = {
		["Index"] = "banana",
		["Name"] = "Banana",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 15
	},
	["guarana"] = {
		["Index"] = "guarana",
		["Name"] = "Guaraná",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 15
	},
	["acerola"] = {
		["Index"] = "acerola",
		["Name"] = "Acerola",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 15
	},
	["passion"] = {
		["Index"] = "passion",
		["Name"] = "Maracujá",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 15
	},
	["tomato"] = {
		["Index"] = "tomato",
		["Name"] = "Tomate",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 15
	},
	["cookies"] = {
		["Index"] = "cookies",
		["Name"] = "Cookies",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 0.25,
		["Economy"] = 60,
		["Scape"] = true,
		["Max"] = 3
	},
	["orangejuice"] = {
		["Index"] = "orangejuice",
		["Name"] = "Suco de Laranja",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 4
	},
	["tangejuice"] = {
		["Index"] = "tangejuice",
		["Name"] = "Suco de Tangerina",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 4
	},
	["grapejuice"] = {
		["Index"] = "grapejuice",
		["Name"] = "Suco de Uva",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 4
	},
	["strawberryjuice"] = {
		["Index"] = "strawberryjuice",
		["Name"] = "Suco de Morango",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 4
	},
	["bananajuice"] = {
		["Index"] = "bananajuice",
		["Name"] = "Suco de Banana",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 4
	},
	["acerolajuice"] = {
		["Index"] = "acerolajuice",
		["Name"] = "Suco de Acerola",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 4
	},
	["passionjuice"] = {
		["Index"] = "passionjuice",
		["Name"] = "Suco de Maracujá",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 4
	},
	["bread"] = {
		["Index"] = "bread",
		["Name"] = "Pão",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 5
	},
	["ketchup"] = {
		["Index"] = "ketchup",
		["Name"] = "Ketchup",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 75
	},
	["cannedsoup"] = {
		["Index"] = "cannedsoup",
		["Name"] = "Sopa em Lata",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Economy"] = 55
	},
	["canofbeans"] = {
		["Index"] = "canofbeans",
		["Name"] = "Lata de Feijão",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Economy"] = 55
	},
	["meat"] = {
		["Index"] = "meat",
		["Name"] = "Carne Animal",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 15
	},
	["marshmallow"] = {
		["Index"] = "marshmallow",
		["Name"] = "Marshmallow",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Economy"] = 35,
		["Scape"] = true,
		["Max"] = 3
	},
	["hamburger"] = {
		["Index"] = "hamburger",
		["Name"] = "Hambúrguer",
		["Type"] = "Usável",
		["Weight"] = 0.55,
		["Max"] = 4,
		["Economy"] = 25
	},
	["hamburger2"] = {
		["Index"] = "hamburger2",
		["Name"] = "Hambúrguer Artesanal",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 4,
		["Economy"] = 150
	},
	["hamburger3"] = {
		["Index"] = "hamburger3",
		["Name"] = "X-Salada",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 4,
		["Economy"] = 120
	},
	["hamburger4"] = {
		["Index"] = "hamburger4",
		["Name"] = "X-Bacon",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 4,
		["Economy"] = 140
	},
	["hamburger5"] = {
		["Index"] = "hamburger4",
		["Name"] = "X-Picanha",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 4,
		["Economy"] = 150
	},
	["onionrings"] = {
		["Index"] = "onionrings",
		["Name"] = "Anéis de Cebola",
		["Type"] = "Usável",
		["Weight"] = 0.55,
		["Economy"] = 100,
		["Scape"] = true,
		["Max"] = 4
	},
	["chickenfries"] = {
		["Index"] = "chickenfries",
		["Name"] = "Frango Frito",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 4
	},
	["pizzamozzarella"] = {
		["Index"] = "pizzamozzarella",
		["Name"] = "Pizza de Muçarela",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 150,
		["Scape"] = true,
		["Max"] = 4
	},
	["pizzabanana"] = {
		["Index"] = "pizzabanana",
		["Name"] = "Pizza de Banana",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 150,
		["Scape"] = true,
		["Max"] = 4
	},
	["pizzachocolate"] = {
		["Index"] = "pizzachocolate",
		["Name"] = "Pizza de Chocolate",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 150,
		["Scape"] = true,
		["Max"] = 4
	},
	["calzone"] = {
		["Index"] = "calzone",
		["Name"] = "Calzone",
		["Type"] = "Usável",
		["Weight"] = 0.55,
		["Scape"] = true,
		["Economy"] = 150,
		["Max"] = 4
	},
	["hotdog"] = {
		["Index"] = "hotdog",
		["Name"] = "Cachorro-Quente",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.45,
		["Economy"] = 15,
		["Max"] = 3
	},
	["donut"] = {
		["Index"] = "donut",
		["Name"] = "Rosquinha",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Economy"] = 15,
		["Max"] = 3
	},
	["plate"] = {
		["Index"] = "plate",
		["Name"] = "Placa",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 525
	},
	["lockpick"] = {
		["Index"] = "lockpick",
		["Name"] = "Lockpick",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 1.25,
		["Economy"] = 925
	},
	["toolbox"] = {
		["Index"] = "toolbox",
		["Name"] = "Ferramentas Básicas",
		["Type"] = "Usável",
		["Weight"] = 2.25,
		["Economy"] = 675,
		["Max"] = 3
	},
	["advtoolbox"] = {
		["Index"] = "toolbox",
		["Name"] = "Ferramentas Avançadas",
		["Type"] = "Usável",
		["Weight"] = 3.25,
		["Charges"] = 4,
		["Economy"] = 1525,
		["Max"] = 2
	},
	["notepad"] = {
		["Index"] = "notepad",
		["Name"] = "Bloco de Notas",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["tyres"] = {
		["Index"] = "tyres",
		["Name"] = "Pneu",
		["Type"] = "Usável",
		["Weight"] = 1.75,
		["Economy"] = 225,
		["Max"] = 5
	},
	["cellphone"] = {
		["Index"] = "cellphone",
		["Name"] = "Celular",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 0.75,
		["Economy"] = 725
	},
	["scuba"] = {
		["Index"] = "scuba",
		["Name"] = "Roupa de Mergulho",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 14,
		["Weight"] = 4.75,
		["Economy"] = 975
	},
	["handcuff"] = {
		["Index"] = "handcuff",
		["Name"] = "Algemas",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 1.25,
		["Economy"] = 2550
	},
	["rope"] = {
		["Index"] = "rope",
		["Name"] = "Cordas",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 1.75,
		["Economy"] = 875
	},
	["hood"] = {
		["Index"] = "hood",
		["Name"] = "Capuz",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 1.75,
		["Economy"] = 2750
	},
	["battery"] = {
		["Index"] = "battery",
		["Name"] = "Pilhas",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 90
	},
	["elastic"] = {
		["Index"] = "elastic",
		["Name"] = "Elástico",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 60
	},
	["plasticbottle"] = {
		["Index"] = "plasticbottle",
		["Name"] = "Garrafa Plástica",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 60
	},
	["glassbottle"] = {
		["Index"] = "glassbottle",
		["Name"] = "Garrafa de Vidro",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 60
	},
	["metalcan"] = {
		["Index"] = "metalcan",
		["Name"] = "Lata de Metal",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 90
	},
	["plastic"] = {
		["Index"] = "plastic",
		["Name"] = "Plástico",
		["Type"] = "Comum",
		["Weight"] = 0.045,
		["Economy"] = 20
	},
	["glass"] = {
		["Index"] = "glass",
		["Name"] = "Vidro",
		["Type"] = "Comum",
		["Weight"] = 0.045,
		["Economy"] = 20
	},
	["rubber"] = {
		["Index"] = "rubber",
		["Name"] = "Borracha",
		["Type"] = "Comum",
		["Weight"] = 0.045,
		["Economy"] = 20
	},
	["aluminum"] = {
		["Index"] = "aluminum",
		["Name"] = "Alumínio",
		["Type"] = "Comum",
		["Weight"] = 0.065,
		["Economy"] = 30
	},
	["copper"] = {
		["Index"] = "copper",
		["Name"] = "Cobre",
		["Type"] = "Comum",
		["Weight"] = 0.065,
		["Economy"] = 30
	},
	["newspaper"] = {
		["Index"] = "newspaper",
		["Name"] = "Jornal",
		["Type"] = "Comum",
		["Weight"] = 0.375,
		["Economy"] = 12
	},
	["ritmoneury"] = {
		["Index"] = "ritmoneury",
		["Name"] = "Ritmoneury",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 475,
		["Max"] = 3
	},
	["sinkalmy"] = {
		["Index"] = "sinkalmy",
		["Name"] = "Sinkalmy",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 375,
		["Max"] = 3
	},
	["cigarette"] = {
		["Index"] = "cigarette",
		["Name"] = "Cigarro",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 10,
		["Max"] = 3
	},
	["lighter"] = {
		["Index"] = "lighter",
		["Name"] = "Isqueiro",
		["Repair"] = "repairkit01",
		["Durability"] = 10,
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 175
	},
	["vape"] = {
		["Index"] = "vape",
		["Name"] = "Vape",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 14,
		["Weight"] = 0.75,
		["Economy"] = 4750
	},
	["dollars"] = {
		["Index"] = "dollars",
		["Name"] = "Dólares",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["dollarsroll"] = {
		["Index"] = "dollarsroll",
		["Name"] = "Rolo de Dólares",
		["Type"] = "Comum",
		["Weight"] = 0.0,
		["Economy"] = 10
	},
	["chocolate"] = {
		["Index"] = "chocolate",
		["Name"] = "Chocolate",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 15,
		["Max"] = 3
	},
	["sandwich"] = {
		["Index"] = "sandwich",
		["Name"] = "Sanduiche",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Economy"] = 15,
		["Max"] = 3
	},
	["rose"] = {
		["Index"] = "rose",
		["Name"] = "Rosa",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 25
	},
	["teddy"] = {
		["Index"] = "teddy",
		["Name"] = "Teddy",
		["Type"] = "Usável",
		["Weight"] = 1.25,
		["Economy"] = 75
	},
	["absolut"] = {
		["Index"] = "absolut",
		["Name"] = "Absolut",
		["Type"] = "Usável",
		["Durability"] = 2,
		["Weight"] = 0.55,
		["Economy"] = 15
	},
	["chandon"] = {
		["Index"] = "chandon",
		["Name"] = "Chandon",
		["Type"] = "Usável",
		["Durability"] = 2,
		["Weight"] = 0.55,
		["Economy"] = 15
	},
	["dewars"] = {
		["Index"] = "dewars",
		["Name"] = "Dewars",
		["Type"] = "Usável",
		["Durability"] = 2,
		["Weight"] = 0.55,
		["Economy"] = 15
	},
	["hennessy"] = {
		["Index"] = "hennessy",
		["Name"] = "Hennessy",
		["Type"] = "Usável",
		["Durability"] = 2,
		["Weight"] = 0.55,
		["Economy"] = 15
	},
	["WEAPON_HATCHET"] = {
		["Index"] = "hatchet",
		["Name"] = "Machado",
		["Type"] = "Armamento",
		["Repair"] = "repairkit01",
		["Durability"] = 5,
		["Weight"] = 1.75,
		["Economy"] = 975
	},
	["WEAPON_BAT"] = {
		["Index"] = "bat",
		["Name"] = "Bastão de Beisebol",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 5,
		["Weight"] = 1.75,
		["Economy"] = 975
	},
	["WEAPON_KATANA"] = {
		["Index"] = "katana",
		["Name"] = "Katana",
		["Type"] = "Armamento",
		["Repair"] = "repairkit01",
		["Durability"] = 5,
		["Weight"] = 1.75,
		["Economy"] = 975
	},
	["WEAPON_THERMAL"] = {
		["Index"] = "katana",
		["Name"] = "Katana Thermal",
		["Type"] = "Armamento",
		["Repair"] = "repairkit01",
		["Durability"] = 3,
		["Weight"] = 1.75,
		["Economy"] = 2625,
		["Clear"] = true,
		["Drops"] = true
	},
	["WEAPON_DILDO"] = {
		["Index"] = "dildo",
		["Name"] = "Dildo",
		["Type"] = "Armamento",
		["Repair"] = "repairkit01",
		["Durability"] = 5,
		["Weight"] = 1.75,
		["Economy"] = 975
	},
	["WEAPON_KARAMBIT"] = {
		["Index"] = "karambit",
		["Name"] = "Karambit",
		["Type"] = "Armamento",
		["Repair"] = "repairkit01",
		["Durability"] = 5,
		["Weight"] = 1.25,
		["Economy"] = 975
	},
	["WEAPON_BATTLEAXE"] = {
		["Index"] = "battleaxe",
		["Name"] = "Machado de Batalha",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 5,
		["Weight"] = 1.75,
		["Economy"] = 975
	},
	["WEAPON_CROWBAR"] = {
		["Index"] = "crowbar",
		["Name"] = "Pé de Cabra",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 5,
		["Weight"] = 1.35,
		["Economy"] = 725
	},
	["WEAPON_SWITCHBLADE"] = {
		["Index"] = "switchblade",
		["Name"] = "Canivete",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 5,
		["Weight"] = 0.75,
		["Economy"] = 725
	},
	["WEAPON_GOLFCLUB"] = {
		["Index"] = "golfclub",
		["Name"] = "Taco de Golf",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 5,
		["Weight"] = 1.65,
		["Economy"] = 975
	},
	["WEAPON_HAMMER"] = {
		["Index"] = "hammer",
		["Name"] = "Martelo",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 5,
		["Weight"] = 1.45,
		["Economy"] = 975
	},
	["WEAPON_MACHETE"] = {
		["Index"] = "machete",
		["Name"] = "Facão",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 5,
		["Weight"] = 1.35,
		["Economy"] = 975
	},
	["WEAPON_POOLCUE"] = {
		["Index"] = "poolcue",
		["Name"] = "Taco de Sinuca",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 5,
		["Weight"] = 1.25,
		["Economy"] = 975
	},
	["WEAPON_STONE_HATCHET"] = {
		["Index"] = "stonehatchet",
		["Name"] = "Machado de Pedra",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 5,
		["Weight"] = 1.55,
		["Economy"] = 975
	},
	["WEAPON_WRENCH"] = {
		["Index"] = "wrench",
		["Name"] = "Chave Inglesa",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 5,
		["Weight"] = 1.45,
		["Economy"] = 725
	},
	["WEAPON_KNUCKLE"] = {
		["Index"] = "knuckle",
		["Name"] = "Soco Inglês",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 5,
		["Weight"] = 1.15,
		["Economy"] = 975
	},
	["WEAPON_FLASHLIGHT"] = {
		["Index"] = "flashlight",
		["Name"] = "Lanterna",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 5,
		["Weight"] = 1.15,
		["Economy"] = 975
	},
	["WEAPON_NIGHTSTICK"] = {
		["Index"] = "nightstick",
		["Name"] = "Cassetete",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 5,
		["Weight"] = 1.15,
		["Economy"] = 125
	},
	["WEAPON_PISTOL"] = {
		["Index"] = "m1911",
		["Name"] = "M1911",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 7,
		["Vehicle"] = true,
		["Weight"] = 2.25,
		["Economy"] = 3750
	},
	["WEAPON_PISTOL_MK2"] = {
		["Index"] = "fiveseven",
		["Name"] = "FN Five Seven",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 2.75,
		["Economy"] = 4225
	},
	["WEAPON_COMPACTRIFLE"] = {
		["Index"] = "akcompact",
		["Name"] = "AK Compact",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 14,
		["Weight"] = 4.25,
		["Economy"] = 13250
	},
	["WEAPON_APPISTOL"] = {
		["Index"] = "kochvp9",
		["Name"] = "Koch Vp9",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 2.75,
		["Economy"] = 7250
	},
	["WEAPON_HEAVYPISTOL"] = {
		["Index"] = "atifx45",
		["Name"] = "Ati FX45",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 2.75,
		["Economy"] = 725
	},
	["WEAPON_MACHINEPISTOL"] = {
		["Index"] = "tec9",
		["Name"] = "Tec-9",
		["Type"] = "Armamento",
		["Repair"] = "repairkit03",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 3.25,
		["Economy"] = 8250
	},
	["WEAPON_MICROSMG"] = {
		["Index"] = "uzi",
		["Name"] = "Uzi",
		["Type"] = "Armamento",
		["Repair"] = "repairkit03",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 2.25,
		["Economy"] = 13250
	},
	["WEAPON_NAILGUN"] = {
		["Index"] = "nailgun",
		["Name"] = "Arma de Prego",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_NAIL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = false,
		["Weight"] = 2.25,
		["Economy"] = 3250
	},
	["WEAPON_RPG"] = {
		["Index"] = "rpg",
		["Name"] = "Lança Foguete",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RPG_AMMO",
		["Durability"] = 14,
		["Vehicle"] = false,
		["Weight"] = 12.25,
		["Economy"] = 15250
	},
	["WEAPON_MINISMG"] = {
		["Index"] = "skorpionv61",
		["Name"] = "Skorpion V61",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 3.25,
		["Economy"] = 13250
	},
	["WEAPON_SNSPISTOL"] = {
		["Index"] = "amt380",
		["Name"] = "AMT 380",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 1.25,
		["Economy"] = 3750
	},
	["WEAPON_SNSPISTOL_MK2"] = {
		["Index"] = "hkp7m10",
		["Name"] = "HK P7M10",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 1.25,
		["Economy"] = 3750
	},
	["WEAPON_VINTAGEPISTOL"] = {
		["Index"] = "m1922",
		["Name"] = "M1922",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 2.25,
		["Economy"] = 4250
	},
	["WEAPON_PISTOL50"] = {
		["Index"] = "desert",
		["Name"] = "Desert Eagle",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 2.75,
		["Economy"] = 6250
	},
	["WEAPON_REVOLVER"] = {
		["Index"] = "magnum",
		["Name"] = "Magnum 44",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 2.25,
		["Economy"] = 6250
	},
	["WEAPON_COMBATPISTOL"] = {
		["Index"] = "glock",
		["Name"] = "Glock",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 2.25,
		["Economy"] = 625
	},
	["WEAPON_PARAFAL"] = {
		["Index"] = "parafal",
		["Name"] = "PARA-FAL M964A1",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.75,
		["Economy"] = 25000
	},
	["WEAPON_FNFAL"] = {
		["Index"] = "fnfal",
		["Name"] = "FN L1A1",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.75,
		["Economy"] = 25000
	},
	["WEAPON_COLTXM177"] = {
		["Index"] = "coltxm177",
		["Name"] = "Colt XM177",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.75,
		["Economy"] = 25000
	},
	["WEAPON_CARBINERIFLE"] = {
		["Index"] = "m4a1",
		["Name"] = "M4A1",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.75,
		["Economy"] = 775
	},
	["WEAPON_CARBINERIFLE_MK2"] = {
		["Index"] = "m4a4",
		["Name"] = "M4A4",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.75,
		["Economy"] = 925
	},
	["WEAPON_ADVANCEDRIFLE"] = {
		["Index"] = "tar21",
		["Name"] = "Tar-21",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 4.75,
		["Economy"] = 18700
	},
	["WEAPON_BULLPUPRIFLE"] = {
		["Index"] = "qbz95",
		["Name"] = "QBZ-95",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 4.75,
		["Economy"] = 18700
	},
	["WEAPON_BULLPUPRIFLE_MK2"] = {
		["Index"] = "l85",
		["Name"] = "L85",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 4.75,
		["Economy"] = 18700
	},
	["WEAPON_SPECIALCARBINE"] = {
		["Index"] = "g36c",
		["Name"] = "G36C",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 85.75,
		["Economy"] = 18700
	},
	["WEAPON_SPECIALCARBINE_MK2"] = {
		["Index"] = "sigsauer556",
		["Name"] = "Sig Sauer 556",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.75,
		["Economy"] = 18700
	},
	["WEAPON_PUMPSHOTGUN"] = {
		["Index"] = "mossberg590",
		["Name"] = "Mossberg 590",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SHOTGUN_AMMO",
		["Durability"] = 21,
		["Weight"] = 6.25,
		["Economy"] = 775
	},
	["WEAPON_PUMPSHOTGUN_MK2"] = {
		["Index"] = "mossberg590a1",
		["Name"] = "Mossberg 590A1",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SHOTGUN_AMMO",
		["Durability"] = 21,
		["Weight"] = 6.25,
		["Economy"] = 15250
	},
	["WEAPON_MUSKET"] = {
		["Index"] = "winchester",
		["Name"] = "Winchester 1892",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_MUSKET_AMMO",
		["Durability"] = 14,
		["Weight"] = 6.25,
		["Economy"] = 3250
	},
	["WEAPON_SAUER"] = {
		["Index"] = "sauer101",
		["Name"] = "Sauer 101",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_MUSKET_AMMO",
		["Durability"] = 21,
		["Weight"] = 6.25,
		["Economy"] = 7225
	},
	["WEAPON_SAWNOFFSHOTGUN"] = {
		["Index"] = "mossberg500",
		["Name"] = "Mossberg 500",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SHOTGUN_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.75,
		["Economy"] = 13250
	},
	["WEAPON_SMG"] = {
		["Index"] = "mp5",
		["Name"] = "MP5",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 21,
		["Weight"] = 44.25,
		["Economy"] = 775
	},
	["WEAPON_SMG_MK2"] = {
		["Index"] = "evo3",
		["Name"] = "Evo-3",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 21,
		["Vehicle"] = true,
		["Weight"] = 4.25,
		["Economy"] = 13250
	},
	["WEAPON_TACTICALRIFLE"] = {
		["Index"] = "m16",
		["Name"] = "M16",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.75,
		["Economy"] = 18750
	},
	["WEAPON_HEAVYRIFLE"] = {
		["Index"] = "scarh",
		["Name"] = "Scar-H",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.75,
		["Economy"] = 25000
	},
	["WEAPON_ASSAULTRIFLE"] = {
		["Index"] = "ak103",
		["Name"] = "AK-103",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.75,
		["Economy"] = 18750
	},
	["WEAPON_ASSAULTRIFLE_MK2"] = {
		["Index"] = "ak74",
		["Name"] = "AK-74",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.75,
		["Economy"] = 18750
	},
	["WEAPON_ASSAULTSMG"] = {
		["Index"] = "steyraug",
		["Name"] = "Steyr AUG",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 21,
		["Weight"] = 4.75,
		["Economy"] = 15250
	},
	["WEAPON_GUSENBERG"] = {
		["Index"] = "thompson",
		["Name"] = "Thompson",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 21,
		["Weight"] = 4.25,
		["Economy"] = 15250
	},
	["WEAPON_PETROLCAN"] = {
		["Index"] = "gallon",
		["Name"] = "Galão",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PETROLCAN_AMMO",
		["Weight"] = 1.25,
		["Economy"] = 250
	},
	["GADGET_PARACHUTE"] = {
		["Index"] = "parachute",
		["Name"] = "Paraquedas",
		["Description"] = "Lembrando que após <green>reconectar na cidade</green> o mesmo é removido.",
		["Type"] = "Usável",
		["Weight"] = 2.25,
		["Economy"] = 225
	},
	["WEAPON_STUNGUN"] = {
		["Index"] = "stungun",
		["Name"] = "Tazer",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Durability"] = 7,
		["Weight"] = 0.75,
		["Economy"] = 525
	},
	["WEAPON_RPG_AMMO"] = {
		["Index"] = "rocket",
		["Name"] = "Foguete",
		["Type"] = "Munição",
		["Weight"] = 2.25,
		["Economy"] = 725
	},
	["WEAPON_NAIL_AMMO"] = {
		["Index"] = "nails",
		["Name"] = "Pregos",
		["Type"] = "Munição",
		["Weight"] = 0.05,
		["Economy"] = 2
	},
	["WEAPON_PISTOL_AMMO"] = {
		["Index"] = "pistolammo",
		["Name"] = "Munição de Pistola",
		["Type"] = "Munição",
		["Weight"] = 0.015,
		["Economy"] = 40
	},
	["WEAPON_SMG_AMMO"] = {
		["Index"] = "smgammo",
		["Name"] = "Munição de Submetralhadora",
		["Type"] = "Munição",
		["Weight"] = 0.025,
		["Economy"] = 60
	},
	["WEAPON_RIFLE_AMMO"] = {
		["Index"] = "rifleammo",
		["Name"] = "Munição de Rifle",
		["Type"] = "Munição",
		["Weight"] = 0.035,
		["Economy"] = 70
	},
	["WEAPON_SHOTGUN_AMMO"] = {
		["Index"] = "shotgunammo",
		["Name"] = "Munição de Escopeta",
		["Type"] = "Munição",
		["Weight"] = 0.055,
		["Economy"] = 80
	},
	["WEAPON_MUSKET_AMMO"] = {
		["Index"] = "musketammo",
		["Name"] = "Munição de Mosquete",
		["Type"] = "Munição",
		["Weight"] = 0.025,
		["Economy"] = 10
	},
	["WEAPON_PETROLCAN_AMMO"] = {
		["Index"] = "fuel",
		["Name"] = "Combustível",
		["Type"] = "Munição",
		["Weight"] = 0.001,
		["Economy"] = 0
	},
	["WEAPON_BRICK"] = {
		["Index"] = "brick",
		["Name"] = "Tijolo",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.75,
		["Economy"] = 25
	},
	["WEAPON_SNOWBALL"] = {
		["Index"] = "snowball",
		["Name"] = "Bola de Neve",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.55,
		["Economy"] = 6
	},
	["WEAPON_SHOES"] = {
		["Index"] = "shoes",
		["Name"] = "Tênis",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.755,
		["Economy"] = 25
	},
	["WEAPON_MOLOTOV"] = {
		["Index"] = "molotov",
		["Name"] = "Coquetel Molotov",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.95,
		["Economy"] = 225,
		["Max"] = 3
	},
	["WEAPON_SMOKEGRENADE"] = {
		["Index"] = "smokegrenade",
		["Name"] = "Granada de Fumaça",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.95,
		["Economy"] = 225,
		["Max"] = 3
	},
	["pager"] = {
		["Index"] = "pager",
		["Name"] = "Pager",
		["Type"] = "Usável",
		["Weight"] = 2.25,
		["Economy"] = 125
	},
	["firecracker"] = {
		["Index"] = "firecracker",
		["Name"] = "Fogos de Artificio",
		["Type"] = "Usável",
		["Weight"] = 2.25,
		["Economy"] = 100
	},
	["analgesic"] = {
		["Index"] = "analgesic",
		["Name"] = "Analgésico",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 125
	},
	["oxy"] = {
		["Index"] = "oxycontin",
		["Name"] = "Frasco de Oxicodona",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 35
	},
	["crack"] = {
		["Index"] = "crack",
		["Name"] = "Pedra de Crack",
		["Type"] = "Usável",
		["Weight"] = 0.05,
		["Economy"] = 725
	},
	["heroin"] = {
		["Index"] = "heroin",
		["Name"] = "Seringa de Heroína",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 525
	},
	["metadone"] = {
		["Index"] = "metadone",
		["Name"] = "Frasco de Metadona",
		["Type"] = "Usável",
		["Weight"] = 0.45,
		["Economy"] = 375
	},
	["gauze"] = {
		["Index"] = "gauze",
		["Name"] = "Ataduras",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 100
	},
	["gsrkit"] = {
		["Index"] = "gsrkit",
		["Name"] = "Kit Residual",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 20
	},
	["gdtkit"] = {
		["Index"] = "gdtkit",
		["Name"] = "Kit Químico",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 20
	},
	["keyboard"] = {
		["Index"] = "keyboard",
		["Name"] = "Teclado",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 75
	},
	["mouse"] = {
		["Index"] = "mouse",
		["Name"] = "Mouse",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 75
	},
	["silverring"] = {
		["Index"] = "silverring",
		["Name"] = "Anel de Prata",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 100
	},
	["goldring"] = {
		["Index"] = "goldring",
		["Name"] = "Anel de Ouro",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 125
	},
	["silvercoin"] = {
		["Index"] = "silvercoin",
		["Name"] = "Moeda de Prata",
		["Type"] = "Usável",
		["Weight"] = 0.05,
		["Economy"] = 20
	},
	["goldcoin"] = {
		["Index"] = "goldcoin",
		["Name"] = "Moeda de Ouro",
		["Type"] = "Usável",
		["Weight"] = 0.05,
		["Economy"] = 40
	},
	["watch"] = {
		["Index"] = "watch",
		["Name"] = "Relógio",
		["Type"] = "Comum",
		["Weight"] = 0.1,
		["Economy"] = 125
	},
	["playstation"] = {
		["Index"] = "playstation",
		["Name"] = "Playstation",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 75
	},
	["xbox"] = {
		["Index"] = "xbox",
		["Name"] = "Xbox",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 75
	},
	["legos"] = {
		["Index"] = "legos",
		["Name"] = "Legos",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 75
	},
	["ominitrix"] = {
		["Index"] = "ominitrix",
		["Name"] = "Ominitrix",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 75
	},
	["bracelet"] = {
		["Index"] = "bracelet",
		["Name"] = "Bracelete",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 125
	},
	["dildo"] = {
		["Index"] = "dildo",
		["Name"] = "Vibrador",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 75
	},
	["spray01"] = {
		["Index"] = "spray01",
		["Name"] = "Desodorante 24hrs",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 75
	},
	["spray02"] = {
		["Index"] = "spray02",
		["Name"] = "Antisséptico",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 75
	},
	["spray03"] = {
		["Index"] = "spray03",
		["Name"] = "Desodorante 48hrs",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 75
	},
	["spray04"] = {
		["Index"] = "spray04",
		["Name"] = "Desodorante 72hrs",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 75
	},
	["dices"] = {
		["Index"] = "dices",
		["Name"] = "Dados",
		["Type"] = "Usável",
		["Weight"] = 0.35,
		["Economy"] = 45
	},
	["dish"] = {
		["Index"] = "dish",
		["Name"] = "Prato",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 75
	},
	["pan"] = {
		["Index"] = "pan",
		["Name"] = "Panela",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 100
	},
	["fan"] = {
		["Index"] = "fan",
		["Name"] = "Ventilador",
		["Type"] = "Comum",
		["Weight"] = 1.15,
		["Economy"] = 75
	},
	["rimel"] = {
		["Index"] = "rimel",
		["Name"] = "Rímel",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 75
	},
	["blender"] = {
		["Index"] = "blender",
		["Name"] = "Liquidificador",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 75
	},
	["switch"] = {
		["Index"] = "switch",
		["Name"] = "Interruptor",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 45
	},
	["horseshoe"] = {
		["Index"] = "horseshoe",
		["Name"] = "Ferradura",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 75
	},
	["brush"] = {
		["Index"] = "brush",
		["Name"] = "Escova",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 75
	},
	["domino"] = {
		["Index"] = "domino",
		["Name"] = "Dominó",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 45
	},
	["floppy"] = {
		["Index"] = "floppy",
		["Name"] = "Disquete",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 45
	},
	["cup"] = {
		["Index"] = "cup",
		["Name"] = "Cálice",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 100
	},
	["deck"] = {
		["Index"] = "deck",
		["Name"] = "Baralho",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 75
	},
	["eraser"] = {
		["Index"] = "eraser",
		["Name"] = "Apagador",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 75
	},
	["pliers"] = {
		["Index"] = "pliers",
		["Name"] = "Alicate",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 55
	},
	["lampshade"] = {
		["Index"] = "lampshade",
		["Name"] = "Abajur",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 75
	},
	["soap"] = {
		["Index"] = "soap",
		["Name"] = "Sabonete",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 75
	},
	["slipper"] = {
		["Index"] = "slipper",
		["Name"] = "Chinelo",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 75
	},
	["pendrive"] = {
		["Index"] = "pendrive",
		["Name"] = "Pendrive",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 3,
		["Weight"] = 0.75,
		["Economy"] = 325
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMBODY
-----------------------------------------------------------------------------------------------------------------------------------------
function itemBody(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] then
		return List[Item]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMINDEX
-----------------------------------------------------------------------------------------------------------------------------------------
function itemIndex(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Index"] then
		return List[Item]["Index"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMNAME
-----------------------------------------------------------------------------------------------------------------------------------------
function itemName(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Name"] then
		return List[Item]["Name"]
	end

	return "Deletado"
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMTYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function itemType(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Type"] then
		return List[Item]["Type"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMAMMO
-----------------------------------------------------------------------------------------------------------------------------------------
function itemAmmo(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Ammo"] then
		return List[Item]["Ammo"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function itemVehicle(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Vehicle"] then
		return List[Item]["Vehicle"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function itemWeight(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Weight"] then
		return List[Item]["Weight"] + 0.0
	end

	return 0.0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMMAXAMOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function itemMaxAmount(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Max"] then
		return List[Item]["Max"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMSCAPE
-----------------------------------------------------------------------------------------------------------------------------------------
function itemScape(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Scape"] then
		return List[Item]["Scape"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMDESCRIPTION
-----------------------------------------------------------------------------------------------------------------------------------------
function itemDescription(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Description"] then
		return List[Item]["Description"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMDURABILITY
-----------------------------------------------------------------------------------------------------------------------------------------
function itemDurability(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Durability"] then
		return List[Item]["Durability"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMCHARGES
-----------------------------------------------------------------------------------------------------------------------------------------
function itemCharges(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Charges"] then
		return List[Item]["Charges"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMECONOMY
-----------------------------------------------------------------------------------------------------------------------------------------
function itemEconomy(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Economy"] then
		return List[Item]["Economy"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMBLOCK
-----------------------------------------------------------------------------------------------------------------------------------------
function itemBlock(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Block"] then
		return List[Item]["Block"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMREPAIR
-----------------------------------------------------------------------------------------------------------------------------------------
function itemRepair(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Repair"] then
		return List[Item]["Repair"]
	end

	return false
end