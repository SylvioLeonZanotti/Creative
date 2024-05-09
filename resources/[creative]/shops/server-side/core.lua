-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Kaduzera = {}
Tunnel.bindInterface("shops",Kaduzera)
vCLIENT = Tunnel.getInterface("shops")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFY
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Verify()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if exports["hud"]:Reposed(Passport) then
			return false
		end
	end

	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local shops = {
	-- (Framework)
	["Ammunation"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["WEAPON_BAT"] = 975,
			["WEAPON_MACHETE"] = 975,
			["WEAPON_KARAMBIT"] = 975,
			["WEAPON_KATANA"] = 975,
			["WEAPON_FLASHLIGHT"] = 975,
			["WEAPON_HATCHET"] = 975,
			["WEAPON_BATTLEAXE"] = 975,
			["WEAPON_STONE_HATCHET"] = 975,
			["WEAPON_HAMMER"] = 975,
			["GADGET_PARACHUTE"] = 225,
			["WEAPON_PICKAXE"] = 525,
			["WEAPON_KNUCKLE"] = 975,
			["WEAPON_GOLFCLUB"] = 975,
			["WEAPON_POOLCUE"] = 975,
			["attachsFlashlight"] = 800,
			["attachsCrosshair"] = 800,
			["attachsSilencer"] = 800,
			["attachsMagazine"] = 800,
			["attachsGrip"] = 800,
			["attachsMuzzleFat"] = 800,
			["attachsBarrel"] = 800,
			["attachsMuzzleHeavy"] = 800,
			["repairkit01"] = 525,
			["repairkit02"] = 3225,
			["repairkit03"] = 5225,
			["repairkit04"] = 7225
		}
	},
	["LastTrain"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["hamburger2"] = 120,
			["hamburger3"] = 160,
			["hamburger4"] = 120,
			["hamburger5"] = 150,
			["onionrings"] = 175,
			["chickenfries"] = 230,
			["pizzamozzarella"] = 210,
			["strawberryjuice"] = 185,
			["bananajuice"] = 183,
			["acerolajuice"] = 186,
			["passionjuice"] = 188,
			["grapejuice"] = 175,
			["tangejuice"] = 205,
			["orangejuice"] = 192,
			["calzone"] = 135
		}
	},
	["Departament"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["notepad"] = 10,
			["coffee"] = 20,
			["chocolate"] = 15,
			["cigarette"] = 10,
			["cola"] = 15,
			["energetic"] = 15,
			["emptybottle"] = 30,
			["hamburger"] = 25,
			["lighter"] = 175,
			["bread"] = 5,
			["sandwich"] = 15,
			["soda"] = 15,
			["tacos"] = 22
		}
	},
	["DepartamentMechanic"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["notepad"] = 10,
			["coffee"] = 20,
			["chocolate"] = 15,
			["cigarette"] = 10,
			["cola"] = 15,
			["energetic"] = 15,
			["emptybottle"] = 30,
			["hamburger"] = 25,
			["lighter"] = 175,
			["bread"] = 5,
			["sandwich"] = 15,
			["soda"] = 15,
			["tacos"] = 22,
			["WEAPON_WRENCH"] = 975,
			["WEAPON_CROWBAR"] = 725,
			["advtoolbox"] = 3075,
			["toolbox"] = 975,
			["tyres"] = 375,
		}
	},
	["Fuel"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["WEAPON_PETROLCAN"] = 250
		}
	},
	-- (Ilegal)
	["Criminal"] = {
		["mode"] = "Sell",
		["type"] = "Ilegal",
		["List"] = {
			["lampshade"] = 75,
			["cup"] = 100,
			["switch"] = 45,
			["blender"] = 75,
			["mouse"] = 75,
			["pan"] = 100,
			["playstation"] = 75,
			["dish"] = 75,
			["keyboard"] = 75,
			["fan"] = 100,
			["xbox"] = 75
		}
	},
	["Criminal2"] = {
		["mode"] = "Sell",
		["type"] = "Ilegal",
		["List"] = {
			["goldring"] = 125,
			["silverring"] = 100,
			["bracelet"] = 125,
			["slipper"] = 75,
			["spray01"] = 75,
			["spray02"] = 75,
			["spray03"] = 75,
			["spray04"] = 75,
			["brush"] = 75,
			["watch"] = 500,
			["rimel"] = 75,
			["soap"] = 75,
			["dildo"] = 75
		}
	},
	["Criminal3"] = {
		["mode"] = "Sell",
		["type"] = "Ilegal",
		["List"] = {
			["eraser"] = 75,
			["deck"] = 75,
			["dices"] = 45,
			["floppy"] = 45,
			["domino"] = 45,
			["horseshoe"] = 75,
			["legos"] = 75,
			["ominitrix"] = 75
		}
	},
	["Criminal4"] = {
		["mode"] = "Sell",
		["type"] = "Ilegal",
		["List"] = {
			["pistolbody"] = 125,
			["smgbody"] = 225,
			["riflebody"] = 325,
			["pager"] = 125,
			["pendrive"] = 325,
			["pliers"] = 55,
			["card01"] = 325,
			["card02"] = 325,
			["card03"] = 375,
			["card04"] = 275,
			["card05"] = 425
		}
	},
	["Megamal"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["binoculars"] = 275,
			["cellphone"] = 575,
			["rope"] = 875,
			["camera"] = 275,
			["rose"] = 25,
			["vape"] = 4750,
			["rose"] = 25,
			["radio"] = 975,
			["scuba"] = 3750,
			["firecracker"] = 100,
			["backpack"] = 5000
		}
	},
	["Danger"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["adrenaline"] = 1000,
			["pliers"] = 75,
			["lockpick"] = 800,
			["credential"] = 500,
			["plate"] = 725,
			["pager"] = 250,
			["pendrive"] = 500,
			["WEAPON_NAIL_AMMO"] = 5,
			["c4"] = 1000
		}
	},
	["Drinks"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["absolut"] = 15,
			["chandon"] = 15,
			["dewars"] = 15,
			["hennessy"] = 15
		}
	},
	-- (Center)
	["Cassino"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["chips"] = 1
		}
	},
	["Cassino2"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["List"] = {
			["chips"] = 1
		}
	},
	["Pharmacy"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["medkit"] = 575,
			["bandage"] = 225,
			["gauze"] = 150,
			["analgesic"] = 100,
			["adrenaline"] = 925
		}
	},
	["Premium"] = {
		["mode"] = "Buy",
		["type"] = "Premium",
		["List"] = {
			["newchars"] = 50,
			["chip"] = 20,
			["diagram"] = 5,
			["gemstone"] = 1,
			["WEAPON_PICKAXE_PLUS"] = 20,
			["premiumplate"] = 20,
			["premiumbronze"] = 40,
			["premiumprata"] = 55,
			["premiumouro"] = 75,
			["premiumplatina"] = 100,
			["namechange"] = 20,
			["verify"] = 20
		}
	},
	["Properties"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["diagram"] = 10000
		}
	},
	["Townhall"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["identity"] = 5000
		}
	},
	-- (Public)
	["Paramedic"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Paramedic",
		["List"] = {
			["adrenaline"] = 425,
			["badge02"] = 10,
			["syringe"] = 2,
			["bandage"] = 85,
			["gauze"] = 40,
			["gdtkit"] = 20,
			["medkit"] = 275,
			["sinkalmy"] = 175,
			["analgesic"] = 85,
			["ritmoneury"] = 175,
		}
	},
	["Police"] = {
		["mode"] = "Buy",
		["type"] = "Police",
		["perm"] = "Police",
		["List"] = {
			["gsrkit"]  = 35,
			["gdtkit"] = 35,
			["handcuff"] = 450,
			["vest"] = 325,
			["WEAPON_PISTOL_AMMO"] = 4,
			["WEAPON_SMG_AMMO"] = 6,
			["WEAPON_RIFLE_AMMO"] = 8,
			["attachsFlashlight"] = 500,
			["attachsCrosshair"] = 500,
			["attachsSilencer"] = 500,
			["attachsMagazine"] = 500,
			["attachsGrip"] = 500,
			["attachsMuzzleFat"] = 500,
			["attachsBarrel"] = 500,
			["attachsMuzzleHeavy"] = 500,
			["WEAPON_NIGHTSTICK"] = 250,
			["WEAPON_STUNGUN"] = 250,
			["WEAPON_COMBATPISTOL"] = 1375,
			["WEAPON_SMG"] = 1625,
			["WEAPON_SMG_MK2"] = 1700,
			["WEAPON_COLTXM177"] = 2600,
			["WEAPON_TACTICALRIFLE"] = 2375,
			["WEAPON_HEAVYRIFLE"] = 2625,
			["WEAPON_CARBINERIFLE"] = 2500,
			["WEAPON_CARBINERIFLE_MK2"] = 5750,
			["energetic"] = 40,
			["radio"] = 1000,
			["backpack"] = 3500
		}
	},
	["Harmony"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Harmony",
		["List"] = {
			["WEAPON_WRENCH"] = 375,
			["WEAPON_CROWBAR"] = 225,
			["advtoolbox"] = 1375,
			["toolbox"] = 375,
			["tyres"] = 85
		}
	},
	["Ottos"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Ottos",
		["List"] = {
			["WEAPON_WRENCH"] = 375,
			["WEAPON_CROWBAR"] = 225,
			["advtoolbox"] = 1375,
			["toolbox"] = 375,
			["tyres"] = 85
		}
	},
	["Mechanic"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Mechanic",
		["List"] = {
			["WEAPON_WRENCH"] = 375,
			["WEAPON_CROWBAR"] = 225,
			["advtoolbox"] = 875,
			["toolbox"] = 375,
			["tyres"] = 85
		}
	},
	["Bennys"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Bennys",
		["List"] = {
			["WEAPON_WRENCH"] = 375,
			["WEAPON_CROWBAR"] = 225,
			["advtoolbox"] = 875,
			["toolbox"] = 375,
			["tyres"] = 85,
			["lockpick"] = 200,
			["credential"] = 100,
			["desmanche"] = 500,
			["nitro"] = 275
		}
	},
	["MechanicBuy"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["WEAPON_WRENCH"] = 725,
			["WEAPON_CROWBAR"] = 725,
			["advtoolbox"] = 1525,
			["toolbox"] = 675,
			["tyres"] = 225
		}
	},
	-- (Market)
	["Brewery"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["absolut"] = 15,
			["chandon"] = 15,
			["dewars"] = 15,
			["hennessy"] = 15,
			["energetic"] = 15
		}
	},
	["CoolBeans"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["hamburger2"] = 350,
			["hamburger3"] = 350,
			["orangejuice"] = 250,
			["tangejuice"] = 250,
			["cupcake"] = 60
		}
	},
	["DigitalDen"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["cellphone"] = 575,
			["binoculars"] = 275,
			["camera"] = 275,
			["radio"] = 875
		}
	},
	["LDOrganies"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["cigarette"] = 10,
			["firecracker"] = 100,
			["lighter"] = 175,
			["vape"] = 4750,
			["ziplock"] = 5,
			["bottle"] = 5,
			["syringe"] = 5,
			["acetone"] = 5,
			["silk"] = 5,
			["bottle"] = 5,
			["wheatflour"] = 5
		}
	},
	["Masquerade"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["rope"] = 875,
			["rose"] = 25,
			["teddy"] = 75,
			["backpack"] = 4750
		}
	},
	["PopsPills"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["medkit"] = 575,
			["bandage"] = 225,
			["gauze"] = 100,
			["analgesic"] = 125
		}
	},
	["Truthorganic"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["tomato"] = 30,
			["banana"] = 40,
			["guarana"] = 30,
			["acerola"] = 40,
			["passion"] = 40,
			["grape"] = 50,
			["tange"] = 40,
			["orange"] = 30,
			["apple"] = 10,
			["strawberry"] = 40,
			["coffee2"] = 50
		}
	},
	-- (Works)
	["Fishing"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["List"] = {
			["anchovy"] = 70,
			["herring"] = 70,
			["orangeroughy"] = 65,
			["catfish"] = 65,
			["yellowperch"] = 65,
			["salmon"] = 85,
			["sardine"] = 55,
			["smalltrout"] = 70,
			["smallshark"] = 150
		}
	},
	["Hunting"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["WEAPON_SWITCHBLADE"] = 525,
			["WEAPON_MUSKET"] = 3250,
			["WEAPON_MUSKET_AMMO"] = 7
		}
	},
	["Hunting2"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["List"] = {
			["deer1star"] = 225,
			["deer2star"] = 375,
			["deer3star"] = 575,
			["coyote1star"] = 225,
			["coyote2star"] = 375,
			["coyote3star"] = 575,
			["boar1star"] = 225,
			["boar2star"] = 375,
			["boar3star"] = 575,
			["mtlion1star"] = 225,
			["mtlion2star"] = 375,
			["mtlion3star"] = 575
		}
	},
	["Miners"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["List"] = {
			["lead_pure"] = 70,
			["copper_pure"] = 70,
			["tin_pure"] = 70,
			["iron_pure"] = 70,
			["gold_pure"] = 70,
			["diamond_pure"] = 100,
			["sulfur_pure"] = 70,
			["emerald_pure"] = 100,
			["ruby_pure"] = 150,
			["sapphire_pure"] = 100,
			["gunpowder"] = 50
		}
	},
	["Recycle"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["List"] = {
			["plastic"] = 30,
			["propertys"] = 10,
			["glass"] = 35,
			["rubber"] = 35,
			["aluminum"] = 40,
			["copper"] = 40,
			["emptybottle"] = 30,
			["rose"] = 20,
			["teddy"] = 35,
			["firecracker"] = 50,
			["plate"] = 125,
			["techtrash"] = 60,
			["tarp"] = 20,
			["sheetmetal"] = 20,
			["roadsigns"] = 20,
			["explosives"] = 30,
			["cotton"] = 20,
			["plaster"] = 15,
			["sulfuric"] = 2,
			["saline"] = 20,
			["alcohol"] = 15
		}
	},
		-- Machine
	["Coffee"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["coffee"] = 40
		}
	},
	["Soda"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["cola"] = 30,
			["soda"] = 30
		}
	},
	["Donut"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["donut"] = 30,
			["chocolate"] = 30
		}
	},
	["Burger"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["hamburger"] = 30
		}
	},
	["Hotdog"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["hotdog"] = 30
		}
	},
	["Chihuahua"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["hotdog"] = 30,
			["hamburger"] = 50,
			["coffee"] = 40,
			["cola"] = 30,
			["soda"] = 30
		}
	},
	["Water"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["water"] = 60
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- NAMES
-----------------------------------------------------------------------------------------------------------------------------------------
local nameMale = { "James","John","Robert","Michael","William","David","Richard","Charles","Joseph","Thomas","Christopher","Daniel","Paul","Mark","Donald","George","Kenneth","Steven","Edward","Brian","Ronald","Anthony","Kevin","Jason","Matthew","Gary","Timothy","Jose","Larry","Jeffrey","Frank","Scott","Eric","Stephen","Andrew","Raymond","Gregory","Joshua","Jerry","Dennis","Walter","Patrick","Peter","Harold","Douglas","Henry","Carl","Arthur","Ryan","Roger","Joe","Juan","Jack","Albert","Jonathan","Justin","Terry","Gerald","Keith","Samuel","Willie","Ralph","Lawrence","Nicholas","Roy","Benjamin","Bruce","Brandon","Adam","Harry","Fred","Wayne","Billy","Steve","Louis","Jeremy","Aaron","Randy","Howard","Eugene","Carlos","Russell","Bobby","Victor","Martin","Ernest","Phillip","Todd","Jesse","Craig","Alan","Shawn","Clarence","Sean","Philip","Chris","Johnny","Earl","Jimmy","Antonio" }
local nameFemale = { "Mary","Patricia","Linda","Barbara","Elizabeth","Jennifer","Maria","Susan","Margaret","Dorothy","Lisa","Nancy","Karen","Betty","Helen","Sandra","Donna","Carol","Ruth","Sharon","Michelle","Laura","Sarah","Kimberly","Deborah","Jessica","Shirley","Cynthia","Angela","Melissa","Brenda","Amy","Anna","Rebecca","Virginia","Kathleen","Pamela","Martha","Debra","Amanda","Stephanie","Carolyn","Christine","Marie","Janet","Catherine","Frances","Ann","Joyce","Diane","Alice","Julie","Heather","Teresa","Doris","Gloria","Evelyn","Jean","Cheryl","Mildred","Katherine","Joan","Ashley","Judith","Rose","Janice","Kelly","Nicole","Judy","Christina","Kathy","Theresa","Beverly","Denise","Tammy","Irene","Jane","Lori","Rachel","Marilyn","Andrea","Kathryn","Louise","Sara","Anne","Jacqueline","Wanda","Bonnie","Julia","Ruby","Lois","Tina","Phyllis","Norma","Paula","Diana","Annie","Lillian","Emily","Robin" }
local userName2 = { "Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes" }
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPERM
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.requestPerm(Type)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if exports["hud"]:Wanted(Passport,source) then
			return false
		end

		if shops[Type]["perm"] ~= nil then
			if not vRP.HasGroup(Passport,shops[Type]["perm"]) then
				return false
			end
		end

		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.requestShop(name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local shopSlots = 20
		local inventoryShop = {}
		for k,v in pairs(shops[name]["List"]) do
			inventoryShop[#inventoryShop + 1] = { key = k, price = parseInt(v), name = itemName(k), index = itemIndex(k), peso = itemWeight(k), economy = parseFormat(itemEconomy(k)), max = itemMaxAmount(k), desc = itemDescription(k) }
		end

		local inventoryUser = {}
		local inventory = vRP.Inventory(Passport)
		for k,v in pairs(inventory) do
			v["amount"] = parseInt(v["amount"])
			v["name"] = itemName(v["item"])
			v["peso"] = itemWeight(v["item"])
			v["index"] = itemIndex(v["item"])
			v["max"] = itemMaxAmount(v["item"])
			v["economy"] = parseFormat(itemEconomy(v["item"]))
			v["desc"] = itemDescription(v["item"])
			v["key"] = v["item"]
			v["slot"] = k

			local splitName = splitString(v["item"],"-")
			if splitName[2] ~= nil then
				if itemDurability(v["item"]) then
					v["durability"] = parseInt(os.time() - splitName[2])
					v["days"] = itemDurability(v["item"])
				else
					v["durability"] = 0
					v["days"] = 1
				end
			else
				v["durability"] = 0
				v["days"] = 1
			end

			inventoryUser[k] = v
		end

		if parseInt(#inventoryShop) > 20 then
			shopSlots = parseInt(#inventoryShop)
		end

		return inventoryShop,inventoryUser,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),shopSlots
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETSHOPTYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.getShopType(Type)
    return shops[Type]["mode"]
end---------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.functionShops(Type,Item,Amount,Slot)
	local source = source
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport then
		if shops[Type] then
			if Amount <= 0 then Amount = 1 end

			local inventory = vRP.Inventory(Passport)
			if (inventory[tostring(Slot)] and inventory[tostring(Slot)]["item"] == Item) or not inventory[tostring(Slot)] then
				if shops[Type]["mode"] == "Buy" then
					if vRP.MaxItens(Passport,Item,Amount) then
						TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",3000)
						vCLIENT.updateShops(source,"requestShop")
						return
					end

					if (vRP.InventoryWeight(Passport) + itemWeight(Item) * Amount) <= vRP.GetWeight(Passport) then
						if shops[Type]["type"] == "Cash" then
							if shops[Type]["List"][Item] then
								if vRP.PaymentFull(Passport,shops[Type]["List"][Item] * Amount) then
									if Item == "identity" or string.sub(Item,1,5) == "badge" then
										vRP.GiveItem(Passport,Item.."-"..Passport,Amount,false,Slot)
									elseif Item == "fidentity" then
										local Identity = vRP.Identity(Passport)
										if Identity then
											if Identity["sex"] == "M" then
												vRP.Query("fidentity/NewIdentity",{ name = nameMale[math.random(#nameMale)], name2 = userName2[math.random(#userName2)], blood = math.random(4) })
											else
												vRP.Query("fidentity/NewIdentity",{ name = nameFemale[math.random(#nameFemale)], name2 = userName2[math.random(#userName2)], blood = math.random(4) })
											end

											local Identity = vRP.Identity(Passport)
											local consult = vRP.Query("fidentity/GetIdentity")
											if consult[1] then
												vRP.GiveItem(Passport,Item.."-"..consult[1]["id"],Amount,false,Slot)
											end
										end
									else
										vRP.GenerateItem(Passport,Item,Amount,false,Slot)

										if Item == "WEAPON_PETROLCAN" then
											vRP.GenerateItem(Passport,"WEAPON_PETROLCAN_AMMO",4500,false)
										end
									end

									TriggerClientEvent("sounds:Private",source,"cash",0.1)
								else
									TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
								end
							end
						elseif shops[Type]["type"] == "Consume" then
							if vRP.TakeItem(Passport,shops[Type]["item"],parseInt(shops[Type]["List"][Item] * Amount)) then
								vRP.GenerateItem(Passport,Item,Amount,false,Slot)
								TriggerClientEvent("sounds:Private",source,"cash",0.1)
							else
								TriggerClientEvent("Notify",source,"vermelho","<b>"..itemName(shops[Type]["item"]).."</b> insuficiente.",5000)
							end
						elseif shops[Type]["type"] == "Police" then
							if vRP.PaymentFull(Passport,shops[Type]["List"][Item] * Amount) then
								TriggerClientEvent("sounds:Private",source,"cash",0.1)
								vRP.GenerateItem(Passport,Item,Amount,false,Slot)
								TriggerClientEvent("Notify",source,"verde","Comprou <b>"..Amount.."x "..itemName(Item).."</b> por <b>"..shops[Type]["List"][Item] * Amount.." Dólares</b>.",5000)
								TriggerEvent("Discord","LojaPolicia","**Source:** "..source.."\n**Passaporte:** "..Passport.."\n**Comprou:** "..Amount.."x "..itemName(Item).."\n**por:** "..shops[Type]["List"][Item] * Amount.." Dólares na Loja da Policia.",5000)
							else
								TriggerClientEvent("Notify",source,"vermelho","<b>"..itemName(shops[Type]["item"]).."</b> insuficiente.",5000)
							end
						elseif shops[Type]["type"] == "Premium" then
							if vRP.PaymentGems(Passport,shops[Type]["List"][Item] * Amount) then
								TriggerClientEvent("sounds:Private",source,"cash",0.1)
								vRP.GenerateItem(Passport,Item,Amount,false,Slot)
								TriggerClientEvent("Notify",source,"verde","Comprou <b>"..Amount.."x "..itemName(Item).."</b> por <b>"..shops[Type]["List"][Item] * Amount.." Gemas</b>.",5000)
								TriggerEvent("Discord","LojaVip","**Source:** "..source.."\n**Passaporte:** "..Passport.."\n**Comprou:** "..Amount.."x "..itemName(Item).."\n**por:** "..shops[Type]["List"][Item] * Amount.." Gemas na Life Invader",5000)
							else
								TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
							end
						end
					else
						TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
					end
				elseif shops[Type]["mode"] == "Sell" then
					local splitName = splitString(Item,"-")

					if shops[Type]["List"][splitName[1]] then
						local itemPrice = shops[Type]["List"][splitName[1]]

						if itemPrice > 0 then
							if vRP.CheckDamaged(Item) then
								TriggerClientEvent("Notify",source,"vermelho","Itens danificados não podem ser vendidos.",5000)
								vCLIENT.updateShops(source,"requestShop")
								return
							end
						end

						if shops[Type]["type"] == "Cash" then
							if vRP.TakeItem(Passport,Item,Amount,true,Slot) then
								if itemPrice > 0 then
									vRP.GenerateItem(Passport,"dollars",parseInt(itemPrice * Amount),false)
									TriggerClientEvent("sounds:Private",source,"cash",0.1)
								end
							end
						elseif shops[Type]["type"] == "Ilegal" then
							if vRP.TakeItem(Passport,Item,Amount,true,Slot) then
								if itemPrice > 0 then
									vRP.GenerateItem(Passport,"dollarsroll",parseInt(itemPrice * Amount),false)
									TriggerClientEvent("sounds:Private",source,"cash",0.1)
								end
							end
						elseif shops[Type]["type"] == "Consume" then
							if vRP.TakeItem(Passport,Item,Amount,true,Slot) then
								if itemPrice > 0 then
									vRP.GenerateItem(Passport,shops[Type]["item"],parseInt(itemPrice * Amount),false)
									TriggerClientEvent("sounds:Private",source,"cash",0.1)
								end
							end
						end
					end
				end
			end
		end

		vCLIENT.updateShops(source,"requestShop")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("shops:populateSlot")
AddEventHandler("shops:populateSlot",function(Item,Slot,Target,Amount)
	local source = source
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport then
		if Amount <= 0 then Amount = 1 end

		if vRP.TakeItem(Passport,Item,Amount,false,Slot) then
			vRP.GiveItem(Passport,Item,Amount,false,Target)
			vCLIENT.updateShops(source,"requestShop")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("shops:updateSlot")
AddEventHandler("shops:updateSlot",function(Item,Slot,Target,Amount)
	local source = source
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport then
		if Amount <= 0 then Amount = 1 end

		local inventory = vRP.Inventory(Passport)
		if inventory[tostring(Slot)] and inventory[tostring(Target)] and inventory[tostring(Slot)]["item"] == inventory[tostring(Target)]["item"] then
			if vRP.TakeItem(Passport,Item,Amount,false,Slot) then
				vRP.GiveItem(Passport,Item,Amount,false,Target)
			end
		else
			vRP.SwapSlot(Passport,Slot,Target)
		end

		vCLIENT.updateShops(source,"requestShop")
	end
end)