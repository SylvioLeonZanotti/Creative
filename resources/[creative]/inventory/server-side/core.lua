-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Kaduzera = {}
Tunnel.bindInterface("inventory",Kaduzera)
vPLAYER = Tunnel.getInterface("player")
vGARAGE = Tunnel.getInterface("garages")
vTASKBAR = Tunnel.getInterface("taskbar")
vDELIVER = Tunnel.getInterface("deliver")
vCLIENT = Tunnel.getInterface("inventory")
vKEYBOARD = Tunnel.getInterface("keyboard")
vPARAMEDIC = Tunnel.getInterface("paramedic")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
Drops = {}
Drugs = {}
Carry = {}
Ammos = {}
Active = {}
Trashs = {}
Armors = {}
Heroin = {}
Plates = {}
Trunks = {}
Healths = {}
Animals = {}
Attachs = {}
Scanners = {}
Temporary = {}
atmTimers = {}
Dismantle = {}
Registers = {}
Objects = {}
verifyObjects = {}
verifyAnimals = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUFFS
-----------------------------------------------------------------------------------------------------------------------------------------
Buffs = {
	["Dexterity"] = {},
	["Luck"] = {}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRUGSLIST
-----------------------------------------------------------------------------------------------------------------------------------------
DrugsList = {
	["cocaine"] = {
		Price = { ["Min"] = 450, ["Max"] = 650},
		Amount = { ["Min"] = 2, ["Max"] = 4 }
	},
	["crack"] = {
		Price = { ["Min"] = 450, ["Max"] = 650},
		Amount = { ["Min"] = 2, ["Max"] = 4 }
	},
	["heroin"] = {
		Price = { ["Min"] = 450, ["Max"] = 650},
		Amount = { ["Min"] = 2, ["Max"] = 4 }
	},
	["joint"] = {
		Price = { ["Min"] = 450, ["Max"] = 650},
		Amount = { ["Min"] = 2, ["Max"] = 4 }
	},
	["lean"] = {
		Price = { ["Min"] = 450, ["Max"] = 650},
		Amount = { ["Min"] = 2, ["Max"] = 4 }
	},
	["metadone"] = {
		Price = { ["Min"] = 450, ["Max"] = 650},
		Amount = { ["Min"] = 2, ["Max"] = 4 }
	},
	["meth"] = {
		Price = { ["Min"] = 450, ["Max"] = 650},
		Amount = { ["Min"] = 2, ["Max"] = 4 }
	},
	["oxy"] = {
		Price = { ["Min"] = 450, ["Max"] = 650},
		Amount = { ["Min"] = 2, ["Max"] = 4 }
	},
	["sonhodogomes"] = {
		Price = { ["Min"] = 450, ["Max"] = 650},
		Amount = { ["Min"] = 2, ["Max"] = 4 }
	},
	["donhodokadu"] = {
		Price = { ["Min"] = 450, ["Max"] = 650},
		Amount = { ["Min"] = 2, ["Max"] = 4 }
	},
	["lancaperfume"] = {
		Price = { ["Min"] = 450, ["Max"] = 650},
		Amount = { ["Min"] = 2, ["Max"] = 4 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- OBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
Objects = {
	-- ROBBERY CLOTHESHOP
	["1"] = { x = 70.27, y = -1389.11, z = 29.13, h = 90.28, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["2"] = { x = -706.01, y = -150.49, z = 37.17, h = 28.61, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["3"] = { x = -167.66, y = -301.67, z = 39.49, h = 161.34, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["4"] = { x = -821.69, y = -1067.22, z = 11.08, h = 31.23, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["5"] = { x = -1186.62, y = -772.55, z = 17.09, h = 215.93, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["6"] = { x = -1446.85, y = -240.38, z = 49.57, h = 316.88, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["7"] = { x = 5.53, y = 6506.07, z = 31.63, h = 222.68, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["8"] = { x = 1699.51, y = 4819.72, z = 41.82, h = 277.02, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["9"] = { x = 117.83, y = -223.56, z = 54.31, h = 70.89, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["10"] = { x = 621.58, y = 2765.81, z = 41.84, h = 275.02, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["11"] = { x = 1200.46, y = 2715.37, z = 37.98, h = 0.24, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["12"] = { x = -3178.48, y = 1044.46, z = 20.62, h = 66.61, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["13"] = { x = -1102.05, y = 2716.93, z = 18.86, h = 40.85, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["14"] = { x = 430.72, y = -810.01, z = 29.25, h = 270.35, object = "p_v_43_safe_s", item = "", Distance = 50 },

	-- ROBBERY WEAPONSSHOP
	["15"] = { x = 1688.78, y = 3759.13, z = 34.46, h = 47.5, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["16"] = { x = 256.35, y = -47.51, z = 69.7, h = 249.76, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["17"] = { x = 846.13, y = -1036.62, z = 27.95, h = 178.74, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["18"] = { x = -335.18, y = 6083.29, z = 31.21, h = 45.57, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["19"] = { x = -665.98, y = -932.24, z = 21.58, h = 358.38, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["20"] = { x = -1301.93, y = -391.36, z = 36.45, h = 255.85, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["21"] = { x = -1122.59, y = 2698.25, z = 18.31, h = 42.82, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["22"] = { x = 2571.67, y = 291.28, z = 108.49, h = 180.02, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["23"] = { x = 2571.66, y = 291.29, z = 108.49, h = 181.06, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["24"] = { x = 19.57, y = -1103.0, z = 29.55, h = 339.07, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["25"] = { x = 813.92, y = -2160.34, z = 29.37, h = 179.33, object = "p_v_43_safe_s", item = "", Distance = 50 },

	-- ROBBERY BARBERSHOP
	["26"] = { x = -807.9, y = -180.83, z = 37.32, h = 299.3, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["27"] = { x = 139.56, y = -1704.12, z = 29.05, h = 320.25, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["28"] = { x = -1278.11, y = -1116.66, z = 6.75, h = 270.07, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["29"] = { x = 1928.89, y = 3734.04, z = 32.6, h = 29.2, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["30"] = { x = 1217.05, y = -473.45, z = 65.96, h = 255.89, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["31"] = { x = -34.08, y = -157.01, z = 56.83, h = 159.63, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["32"] = { x = -274.5, y = 6225.27, z = 31.45, h = 225.27, object = "p_v_43_safe_s", item = "", Distance = 50 },

	-- ROBBERY TATTOOSHOP
	["33"] = { x = 1327.98, y = -1654.78, z = 52.03, h = 218.71, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["34"] = { x = -1149.04, y = -1428.64, z = 4.71, h = 215.2, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["35"] = { x = 322.01, y = 186.24, z = 103.34, h = 339.28, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["36"] = { x = -3175.64, y = 1075.54, z = 20.58, h = 65.96, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["37"] = { x = 1866.01, y = 3748.07, z = 32.79, h = 299.38, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["38"] = { x = -295.51, y = 6199.21, z = 31.24, h = 133.05, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["39"] = { x = 986.14, y = -2129.69, z = 30.46, h = 357.17, object = "p_v_43_safe_s", item = "", Distance = 50 },

	-- OTHER OBJECTS
	["9998"] = { x = -584.12, y = -1062.95, z = 22.38, h = 33.14, object = "bkr_prop_fakeid_clipboard_01a", item = "", Distance = 15 },
	["9999"] = { x = -1188.9, y = -897.82, z = 13.95, h = 130.04, object = "bkr_prop_fakeid_clipboard_01a", item = "", Distance = 15 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRODUCTS   986.14,-2129.69,30.46,357.17
-----------------------------------------------------------------------------------------------------------------------------------------
Products = {
	["Pearls1"] = {
		{ ["timer"] = 10, ["item"] = "foodjuice", ["itemAmount"] = 1 }
	},
	["Pearls2"] = {
		{ ["timer"] = 10, ["item"] = "foodburger", ["itemAmount"] = 1 }
	},
	["Pearls3"] = {
		{ ["timer"] = 10, ["need"] = {
			{ ["item"] = "foodburger", ["amount"] = 1 },
			{ ["item"] = "foodjuice", ["amount"] = 1 }
		}, ["needAmount"] = 1, ["item"] = "foodbox", ["itemAmount"] = 1 }
	},
	["paper"] = {
		{ ["timer"] = 20, ["need"] = {
			{ ["item"] = "woodlog", ["amount"] = 3 }
		}, ["needAmount"] = 1, ["item"] = "paper", ["itemAmount"] = 1 }
	},
	["milkBottle"] = {
		{ ["timer"] = 10, ["need"] = "emptybottle", ["needAmount"] = 1, ["item"] = "milkbottle", ["itemAmount"] = 1 }
	},
	["cemitery"] = {
		{ ["timer"] = 5, ["item"] = "silk", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "cotton", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "plaster", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "pouch", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "switchblade", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "joint", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "acetone", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "slipper", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "water", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "copper", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "cigarette", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "lighter", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "elastic", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "rose", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "teddy", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "binoculars", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "camera", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "silvercoin", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "goldcoin", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "watch", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "bracelet", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "WEAPON_BRICK", ["itemAmount"] = 3 },
		{ ["timer"] = 5, ["item"] = "WEAPON_SHOES", ["itemAmount"] = 2 },
		{ ["timer"] = 5, ["item"] = "dices", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "cup", ["itemAmount"] = 1 }
	},
	["fishfillet"] = {
		{ ["timer"] = 10, ["need"] = "fishfillet", ["needAmount"] = 1, ["item"] = "cookedfishfillet", ["itemAmount"] = 1 }
	},
	["marshmallow"] = {
		{ ["timer"] = 10, ["need"] = "sugar", ["needAmount"] = 4, ["item"] = "marshmallow", ["itemAmount"] = 1 }
	},
	["animalmeat"] = {
		{ ["timer"] = 10, ["need"] = "meat", ["needAmount"] = 1, ["item"] = "cookedmeat", ["itemAmount"] = 1 }
	},
	["emptybottle"] = {
		{ ["timer"] = 3, ["need"] = "emptybottle", ["needAmount"] = 1, ["item"] = "water", ["itemAmount"] = 1 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEALPEDS
-----------------------------------------------------------------------------------------------------------------------------------------
StealPeds = {
	{ ["item"] = "pendrive", ["min"] = 1, ["max"] = 1 },
	{ ["item"] = "slipper", ["min"] = 1, ["max"] = 2 },
	{ ["item"] = "pliers", ["min"] = 1, ["max"] = 1 },
	{ ["item"] = "lockpick", ["min"] = 1, ["max"] = 3 },
	{ ["item"] = "rimel", ["min"] = 1, ["max"] = 2 },
	{ ["item"] = "WEAPON_SHOES", ["min"] = 2, ["max"] = 2 },
	{ ["item"] = "card05", ["min"] = 1, ["max"] = 2 },
	{ ["item"] = "card04", ["min"] = 1, ["max"] = 2 },
	{ ["item"] = "card03", ["min"] = 1, ["max"] = 2 },
	{ ["item"] = "card02", ["min"] = 1, ["max"] = 2 },
	{ ["item"] = "card01", ["min"] = 1, ["max"] = 2 },
	{ ["item"] = "oxy", ["min"] = 4, ["max"] = 7 },
	{ ["item"] = "analgesic", ["min"] = 2, ["max"] = 3 },
	{ ["item"] = "pager", ["min"] = 1, ["max"] = 1 },
	{ ["item"] = "camera", ["min"] = 1, ["max"] = 1 },
	{ ["item"] = "binoculars", ["min"] = 1, ["max"] = 1 },
	{ ["item"] = "teddy", ["min"] = 1, ["max"] = 1 },
	{ ["item"] = "chocolate", ["min"] = 1, ["max"] = 2 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEALITENS
-----------------------------------------------------------------------------------------------------------------------------------------
StealItens = {
	{ ["item"] = "pendrive", ["min"] = 1, ["max"] = 1, ["rand"] = 150 },
	{ ["item"] = "slipper", ["min"] = 1, ["max"] = 2, ["rand"] = 225 },
	{ ["item"] = "soap", ["min"] = 1, ["max"] = 2, ["rand"] = 225 },
	{ ["item"] = "pliers", ["min"] = 1, ["max"] = 2, ["rand"] = 225 },
	{ ["item"] = "deck", ["min"] = 1, ["max"] = 2, ["rand"] = 225 },
	{ ["item"] = "floppy", ["min"] = 2, ["max"] = 3, ["rand"] = 225 },
	{ ["item"] = "domino", ["min"] = 2, ["max"] = 3, ["rand"] = 225 },
	{ ["item"] = "brush", ["min"] = 1, ["max"] = 4, ["rand"] = 225 },
	{ ["item"] = "rimel", ["min"] = 2, ["max"] = 4, ["rand"] = 225 },
	{ ["item"] = "WEAPON_SHOES", ["min"] = 2, ["max"] = 2, ["rand"] = 225 },
	{ ["item"] = "card05", ["min"] = 2, ["max"] = 3, ["rand"] = 225 },
	{ ["item"] = "card04", ["min"] = 2, ["max"] = 3, ["rand"] = 225 },
	{ ["item"] = "card03", ["min"] = 2, ["max"] = 3, ["rand"] = 225 },
	{ ["item"] = "card02", ["min"] = 2, ["max"] = 3, ["rand"] = 225 },
	{ ["item"] = "card01", ["min"] = 2, ["max"] = 3, ["rand"] = 225 },
	{ ["item"] = "oxy", ["min"] = 1, ["max"] = 2, ["rand"] = 200 },
	{ ["item"] = "analgesic", ["min"] = 1, ["max"] = 1, ["rand"] = 200 },
	{ ["item"] = "meth", ["min"] = 2, ["max"] = 5, ["rand"] = 200 },
	{ ["item"] = "lean", ["min"] = 2, ["max"] = 5, ["rand"] = 200 },
	{ ["item"] = "pager", ["min"] = 1, ["max"] = 1, ["rand"] = 150 },
	{ ["item"] = "GADGET_PARACHUTE", ["min"] = 1, ["max"] = 1, ["rand"] = 205 },
	{ ["item"] = "WEAPON_SNSPISTOL", ["min"] = 1, ["max"] = 1, ["rand"] = 150 },
	{ ["item"] = "WEAPON_WRENCH", ["min"] = 1, ["max"] = 1, ["rand"] = 125 },
	{ ["item"] = "WEAPON_POOLCUE", ["min"] = 1, ["max"] = 1, ["rand"] = 125 },
	{ ["item"] = "WEAPON_BAT", ["min"] = 1, ["max"] = 1, ["rand"] = 125 },
	{ ["item"] = "camera", ["min"] = 1, ["max"] = 1, ["rand"] = 175 },
	{ ["item"] = "binoculars", ["min"] = 1, ["max"] = 1, ["rand"] = 175 },
	{ ["item"] = "cellphone", ["min"] = 1, ["max"] = 1, ["rand"] = 150 },
	{ ["item"] = "tyres", ["min"] = 1, ["max"] = 1, ["rand"] = 175 },
	{ ["item"] = "plate", ["min"] = 1, ["max"] = 1, ["rand"] = 175 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTINVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.requestInventory()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if GetPlayerRoutingBucket(source) < 900000 then
			if vRP.CheckRolepass(source) then
				TriggerEvent("vRP:Rewards",source)
			end
		end

		local Inv = {}
		local Inventory = vRP.Inventory(Passport)
		for Index,v in pairs(Inventory) do
			if (parseInt(v["amount"]) <= 0 or not itemBody(v["item"])) then
				vRP.RemoveItem(Passport,v["item"],parseInt(v["amount"]),false)
			else
				v["amount"] = parseInt(v["amount"])
				v["name"] = itemName(v["item"])
				v["peso"] = itemWeight(v["item"])
				v["index"] = itemIndex(v["item"])
				v["max"] = itemMaxAmount(v["item"])
				v["desc"] = itemDescription(v["item"])
				v["economy"] = parseFormat(itemEconomy(v["item"]))
				v["key"] = v["item"]
				v["slot"] = Index

				local Split = splitString(v["item"],"-")
				if Split[2] ~= nil then
					if Split[1] == "identity" or Split[1] == "fidentity" or string.sub(v["item"],1,5) == "badge" then
						local Number = parseInt(Split[2])
						local Identity = vRP.Identity(Number)

						if Split[1] == "fidentity" then
							Identity = vRP.FalseIdentity(Number)
						end

						if Identity then
							v["Passport"] = Number
							v["idPremium"] = "Nenhum"
							v["idRolepass"] = "Inativo"
							v["idGemstone"] = "Nenhuma"
							v["idBlood"] = Sanguine(Identity["blood"])
							v["idName"] = Identity["name"].." "..Identity["name2"]
							v["idGemstone"] = Identity["gems"]

							if Number == Passport and Split[1] == "identity" then
								if Identity["premium"] > os.time() then
									local Groups = vRP.Hierarchy("Premium")
									local Number = vRP.HasPermission(Passport,"Premium")

									v["idVality"] = MinimalTimers(Identity["premium"] - os.time())
									v["idPremium"] = Groups[Number]
								end

								if Identity["rolepass"] > 0 then
									v["idRolepass"] = "Ativo"
								end
							end
						end
					end

					if Split[1] == "vehkey" then
						v["Vehkey"] = Split[2]
					end

					if Split[1] == "notepad" and Split[2] then
						v["desc"] = vRP.GetSrvData(v["item"],true)
					end

					if Split[1] == "suitcase" then
						v["Suitcase"] = parseFormat(Split[2])
					end

					if itemCharges(v["item"]) then
						v["charges"] = parseInt(Split[2] * 33)
					end

					if itemDurability(v["item"]) then
						v["durability"] = parseInt(os.time() - Split[2])
						v["days"] = itemDurability(v["item"])
					else
						v["durability"] = 0
						v["days"] = 1
					end
				else
					v["durability"] = 0
					v["days"] = 1
				end

				Inv[Index] = v
			end
		end

		return Inv,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DROPSERVER
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.DropServer(Coords,Item,Amount)
	local Number = 0

	repeat
		Number = Number + 1
	until not Drops[tostring(Number)]

	Drops[tostring(Number)] = {
		["key"] = Item,
		["amount"] = Amount,
		["Coords"] = { Coords["x"],Coords["y"],Coords["z"] },
		["name"] = itemName(Item),
		["peso"] = itemWeight(Item),
		["index"] = itemIndex(Item),
		["days"] = 1,
		["durability"] = 0,
		["charges"] = nil
	}

	TriggerClientEvent("drops:Adicionar",-1,tostring(Number),Drops[tostring(Number)])
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DROPS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Drops(Item,Slot,Amount,x,y,z)
	local source = source
	local Slot = tostring(Slot)
	local Passport = vRP.Passport(source)
	if Passport then
		if not Active[Passport] and not Player(source)["state"]["Handcuff"] and not exports["hud"]:Wanted(Passport) and not vRP.InsideVehicle(source) and GetPlayerRoutingBucket(source) < 900000 then
			if itemBlock(Item) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				return
			end

			if vRP.TakeItem(Passport,Item,Amount,false,Slot) then
				local Days = 1
				local Number = 0
				local Charges = nil
				local Durability = 0
				local Split = splitString(Item,"-")

				repeat
					Number = Number + 1
				until not Drops[tostring(Number)]

				if Split[2] ~= nil then
					if itemCharges(Item) then
						Charges = parseInt(Split[2] * 33)
					end

					if itemDurability(Item) then
						Durability = parseInt(os.time() - Split[2])
						Days = itemDurability(Item)
					end
				end

				Drops[tostring(Number)] = {
					["key"] = Item,
					["amount"] = Amount,
					["Coords"] = { x,y,z },
					["name"] = itemName(Item),
					["peso"] = itemWeight(Item),
					["index"] = itemIndex(Item),
					["days"] = Days,
					["durability"] = Durability,
					["charges"] = Charges
				}

				Player(source)["state"]["Buttons"] = true
				Player(source)["state"]["Cancel"] = true

				if not vRP.InsideVehicle(source) then
					vRPC.playAnim(source,false,{"pickup_object","pickup_low"},true)
					Active[Passport] = os.time() + 100

					SetTimeout(1000,function()
						vRPC.Destroy(source)
						Active[Passport] = nil
					end)
				end

				TriggerClientEvent("drops:Adicionar",-1,tostring(Number),Drops[tostring(Number)])
				TriggerClientEvent("inventory:Update",source,"Backpack")
				Player(source)["state"]["Buttons"] = false
				Player(source)["state"]["Cancel"] = false

				TriggerEvent("Discord","InventoryDrops","**Passaporte:** "..Passport.."\n**Dropou:** "..Amount.."x "..itemName(Item).."\n**Cds:** ("..x..","..y..","..z..")",9317187)
			end
		else
			TriggerClientEvent("inventory:Update",source,"Backpack")
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PICKUP
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Pickup(Number,Amount,Slot)
	local source = source
	local Slot = tostring(Slot)
	local Number = tostring(Number)
	local Passport = vRP.Passport(source)
	if Passport then
		if not Active[Passport] and GetPlayerRoutingBucket(source) < 900000 then
			if not Drops[Number] then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				return
			else
				if (vRP.InventoryWeight(Passport) + itemWeight(Drops[Number]["key"]) * Amount) <= vRP.GetWeight(Passport) then
					if not Drops[Number] or Drops[Number]["amount"] < Amount then
						TriggerClientEvent("inventory:Update",source,"Backpack")
						return
					end

					if vRP.MaxItens(Passport,Drops[Number]["key"],Amount) then
						TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",3000)
						TriggerClientEvent("inventory:Update",source,"Backpack")
						return
					end

					if Drops[Number] then
						local inventory = vRP.Inventory(Passport)
						if inventory[Slot] and Drops[Number]["key"] then
							if inventory[Slot]["item"] == Drops[Number]["key"] then
								vRP.GiveItem(Passport,Drops[Number]["key"],Amount,false,Slot)
							else
								vRP.GiveItem(Passport,Drops[Number]["key"],Amount,false)
							end
						else
							if Drops[Number] then
								vRP.GiveItem(Passport,Drops[Number]["key"],Amount,false,Slot)
							end
						end

						TriggerEvent("Discord","InventoryPegou","**Passaporte:** "..Passport.."\n**Pegou:** "..Amount.."x "..itemName(Drops[Number]["key"]).."\n**Cds:** ("..Drops[Number]["Coords"][1]..","..Drops[Number]["Coords"][2]..","..Drops[Number]["Coords"][3]..")",3042892)

						Drops[Number]["amount"] = Drops[Number]["amount"] - Amount
						if Drops[Number]["amount"] <= 0 then
							TriggerClientEvent("drops:Remover",-1,Number)
							Drops[Number] = nil
						else
							TriggerClientEvent("drops:Atualizar",-1,Number,Drops[Number]["amount"])
						end

						Player(source)["state"]["Buttons"] = true
						Player(source)["state"]["Cancel"] = true

						if not vRP.InsideVehicle(source) then
							vRPC.playAnim(source,false,{"pickup_object","pickup_low"},true)
							Active[Passport] = os.time() + 100

							SetTimeout(1000,function()
								vRPC.Destroy(source)
								Active[Passport] = nil
							end)
						end

						TriggerClientEvent("inventory:Update",source,"Backpack")
						Player(source)["state"]["Buttons"] = false
						Player(source)["state"]["Cancel"] = false
					else
						TriggerClientEvent("inventory:Update",source,"Backpack")
					end
				else
					TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
					TriggerClientEvent("inventory:Update",source,"Backpack")
					return
				end
			end
		else
			TriggerClientEvent("inventory:Update",source,"Backpack")
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SENDITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.SendItem(Slot,Amount)
	local source = source
	local Slot = tostring(Slot)
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and GetPlayerRoutingBucket(source) < 900000 then
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			Active[Passport] = os.time() + 100

			local inventory = vRP.Inventory(Passport)
			if not inventory[Slot] or not inventory[Slot]["item"] then
				Active[Passport] = nil
				return
			end

			if Amount <= 0 then Amount = 1 end
			local Item = inventory[Slot]["item"]

			if vRP.CheckDamaged(Item) or itemBlock(Item) then
				Active[Passport] = nil
				return
			end

			local OtherPassport = vRP.Passport(ClosestPed)
			if not vRP.MaxItens(OtherPassport,Item,Amount) then
				if (vRP.InventoryWeight(OtherPassport) + itemWeight(Item) * Amount) <= vRP.GetWeight(OtherPassport) then
					Active[Passport] = os.time() + 3
					Player(source)["state"]["Cancel"] = true
					Player(source)["state"]["Buttons"] = true
					Player(ClosestPed)["state"]["Cancel"] = true
					Player(ClosestPed)["state"]["Buttons"] = true
					vRPC.CreateObjects(source,"mp_safehouselost@","package_dropoff","prop_paper_bag_small",16,28422,0.0,-0.05,0.05,180.0,0.0,0.0)

					repeat
						if os.time() >= parseInt(Active[Passport]) then
							Active[Passport] = nil
							vRPC.Destroy(source)
							Player(source)["state"]["Cancel"] = false
							Player(source)["state"]["Buttons"] = false
							Player(ClosestPed)["state"]["Cancel"] = false
							Player(ClosestPed)["state"]["Buttons"] = false


							if vRP.TakeItem(Passport,Item,Amount,true,Slot) then
								vRP.GiveItem(OtherPassport,Item,Amount,true)
								TriggerClientEvent("inventory:Update",source,"Backpack")
								TriggerClientEvent("inventory:Update",ClosestPed,"Backpack")
							end
						end

						Wait(100)
					until not Active[Passport]

					TriggerEvent("Discord","InventoryEnviou","**Passaporte:** "..Passport.."\n**Enviou:** "..Amount.."x "..itemName(Item).."\n**Para:** "..OtherPassport,10181046)
				else
					TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",3000)
			end

			Active[Passport] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELIVER
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Deliver(Slot)
	local source = source
	local Slot = tostring(Slot)
	local Passport = vRP.Passport(source)
	if Passport then
		local Inventory = vRP.Inventory(Passport)
		if not Inventory[Slot] or not Inventory[Slot]["item"] then
			return
		end

		local Split = splitString(Inventory[Slot]["item"],"-")
		local Full = Inventory[Slot]["item"]
		local Item = Split[1]

		if Item == "woodlog" then
			if not vRPC.LastVehicle(source,"ratloader") then
				TriggerClientEvent("Notify",source,"amarelo","Precisa utilizar o veículo do <b>Lenhador</b>.",3000)
				return
			end

			if vDELIVER.Deliver(source,"Lumberman") then
				if vRP.TakeItem(Passport,Full,3,false,Slot) then
					local Experience = vRP.GetExperience(Passport,"Lumberman")
					local Category = ClassCategory(Experience)
					local Valuation = 100

					if Category == "B+" then
						Valuation = Valuation + 20
					elseif Category == "A" then
						Valuation = Valuation + 40
					elseif Category == "A+" then
						Valuation = Valuation + 60
					elseif Category == "S" then
						Valuation = Valuation + 80
					elseif Category == "S+" then
						Valuation = Valuation + 100
					end

					if Buffs["Dexterity"][Passport] then
						if Buffs["Dexterity"][Passport] > os.time() then
							Valuation = Valuation + (Valuation * 0.1)
						end
					end

					TriggerClientEvent("inventory:Update",source,"Backpack")
					vRP.GenerateItem(Passport,"dollars",Valuation,true)
					vRP.PutExperience(Passport,"Lumberman",1)
					vDELIVER.Update(source)
				end
			end
		elseif Item == "pouch" then
			if not vRPC.LastVehicle(source,"stockade") then
				TriggerClientEvent("Notify",source,"amarelo","Precisa utilizar o veículo do <b>Transportador</b>.",3000)
				return
			end

			if vDELIVER.Deliver(source,"Transporter") then
				if vRP.TakeItem(Passport,Full,1,false,Slot) then
					local Experience = vRP.GetExperience(Passport,"Transporter")
					local Category = ClassCategory(Experience)
					local Valuation = 60

					if Category == "B+" then
						Valuation = Valuation + 10
					elseif Category == "A" then
						Valuation = Valuation + 20
					elseif Category == "A+" then
						Valuation = Valuation + 30
					elseif Category == "S" then
						Valuation = Valuation + 40
					elseif Category == "S+" then
						Valuation = Valuation + 50
					end

					if Buffs["Dexterity"][Passport] then
						if Buffs["Dexterity"][Passport] > os.time() then
							Valuation = Valuation + (Valuation * 0.1)
						end
					end

					TriggerClientEvent("inventory:Update",source,"Backpack")
					vRP.GenerateItem(Passport,"dollars",Valuation,true)
					vRP.PutExperience(Passport,"Transporter",1)
					vDELIVER.Update(source)
				end
			end
		elseif Item == "foodbox" then
			if vDELIVER.Deliver(source,"Pearls") then
				if vRP.TakeItem(Passport,Full,1,false,Slot) then
					local Experience = vRP.GetExperience(Passport,"Delivery")
					local Category = ClassCategory(Experience)
					local Valuation = 40

					if Category == "B+" then
						Valuation = Valuation + 10
					elseif Category == "A" then
						Valuation = Valuation + 15
					elseif Category == "A+" then
						Valuation = Valuation + 20
					elseif Category == "S" then
						Valuation = Valuation + 25
					elseif Category == "S+" then
						Valuation = Valuation + 30
					end

					if Buffs["Dexterity"][Passport] then
						if Buffs["Dexterity"][Passport] > os.time() then
							Valuation = Valuation + (Valuation * 0.1)
						end
					end

					TriggerClientEvent("inventory:Update",source,"Backpack")
					vRP.GenerateItem(Passport,"dollars",Valuation,true)
					vRP.DirectChest("Pearls","100",Valuation * 0.05,true)
					vRP.PutExperience(Passport,"Delivery",1)
					vDELIVER.Update(source)
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRASH
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Trash(Slot,Amount)
	local source = source
	local Slot = tostring(Slot)
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport then
		if not Active[Passport] and not Player(source)["state"]["Handcuff"] and not exports["hud"]:Wanted(Passport) and not vRP.InsideVehicle(source) and GetPlayerRoutingBucket(source) < 900000 then
			if Amount <= 0 then Amount = 1 end

			local Inventory = vRP.Inventory(Passport)
			if not Inventory[Slot] or not Inventory[Slot]["item"] then
				return
			end

			local Split = splitString(Inventory[Slot]["item"],"-")
			local Full = Inventory[Slot]["item"]
			local Item = Split[1]

			if vRP.TakeItem(Passport,Full,Amount,true,Slot) then
				Player(source)["state"]["Buttons"] = true
				Player(source)["state"]["Cancel"] = true

				if not vRP.InsideVehicle(source) then
					vRPC.playAnim(source,false,{"pickup_object","pickup_low"},true)
					Active[Passport] = os.time() + 100

					SetTimeout(1000,function()
						vRPC.Destroy(source)
						Active[Passport] = nil
					end)
				end

				TriggerClientEvent("inventory:Update",source,"Backpack")
				Player(source)["state"]["Buttons"] = false
				Player(source)["state"]["Cancel"] = false

				TriggerEvent("Discord","InventoryLixo","**Passaporte:** "..Passport.."\n**Lixo:** "..Amount.."x "..itemName(Item),13541152)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- USEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.UseItem(Slot,Amount)
	local source = source
	local Slot = tostring(Slot)
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		if Amount <= 0 then Amount = 1 end

		local Inventory = vRP.Inventory(Passport)
		if not Inventory[Slot] or not Inventory[Slot]["item"] then
			return
		end

		local Split = splitString(Inventory[Slot]["item"],"-")
		local Full = Inventory[Slot]["item"]
		local Item = Split[1]

		if itemDurability(Full) then
			if vRP.CheckDamaged(Full) then
				TriggerClientEvent("Notify",source,"vermelho","<b>"..itemName(Item).."</b> danificado.",5000)
				return
			end
		end

		if (vCLIENT.checkWater(source) and Item ~= "soap") or (not vCLIENT.checkWater(source) and Item == "soap") then
			return
		end

		if itemType(Full) == "Armamento" and parseInt(Slot) <= 5 then
			if vCLIENT.CheckArms(source) then
				TriggerClientEvent("Notify",source,"amarelo","Mão machucada.",5000)
				return
			end

			if vRP.InsideVehicle(source) then
				if not itemVehicle(Full) then
					return
				end
			end

			if vCLIENT.returnWeapon(source) then
				local Check,Ammo,Hash = vCLIENT.storeWeaponHands(source)

				if Check then
					local wHash = itemAmmo(Hash)
					if wHash then
						if Ammo > 0 then
							if not Ammos[Passport] then
								Ammos[Passport] = {}
							end

							Ammos[Passport][wHash] = Ammo
						else
							if Ammos[Passport] and Ammos[Passport][wHash] then
								Ammos[Passport][wHash] = nil
							end
						end
					end

					TriggerClientEvent("itensNotify",source,{ "guardou",itemIndex(Hash),1,itemName(Hash) })
					exports["inventory"]:CleanWeapons(Passport,false)
				end
			else
				Ammo = 0
				local wHash = itemAmmo(Item)
				if wHash then
					if not Ammos[Passport] then
						Ammos[Passport] = {}
					end

					if not Ammos[Passport][wHash] then
						Ammos[Passport][wHash] = 0
					else
						Ammo = Ammos[Passport][wHash]
					end
				end

				if not Attachs[Passport] then
					Attachs[Passport] = {}
				end

				if not Attachs[Passport][Item] then
					Attachs[Passport][Item] = {}
				end

				if vCLIENT.putWeaponHands(source,Item,Ammo,Attachs[Passport][Item]) then
					TriggerClientEvent("itensNotify",source,{ "equipou",itemIndex(Full),1,itemName(Full) })
				end
			end
		elseif itemType(Full) == "Munição" then
			local Weapon,Hash,Ammo = vCLIENT.rechargeCheck(source,Item)

			if Weapon then
				if Hash == "WEAPON_PETROLCAN" then
					if (Ammo + Amount) > 4500 then
						Amount = 4500 - Ammo
					end
				else
					if (Ammo + Amount) > 250 then
						Amount = 250 - Ammo
					end
				end

				if Item ~= itemAmmo(Hash) or Amount <= 0 then
					return
				end

				if vRP.TakeItem(Passport,Full,Amount,false,Slot) then
					if not Ammos[Passport] then
						Ammos[Passport] = {}
					end

					Ammos[Passport][Item] = Ammo + Amount

					TriggerClientEvent("itensNotify",source,{ "equipou",itemIndex(Full),Amount,itemName(Full) })
					TriggerClientEvent("inventory:Update",source,"Backpack")
					vCLIENT.rechargeWeapon(source,Hash,Amount)
				end
			end
		elseif itemType(Full) == "Throwing" then
			if vCLIENT.returnWeapon(source) then
				local Check,Ammo,Hash = vCLIENT.storeWeaponHands(source)

				if Check then
					local wHash = itemAmmo(Hash)
					if wHash then
						if Ammo > 0 then
							if not Ammos[Passport] then
								Ammos[Passport] = {}
							end

							Ammos[Passport][wHash] = Ammo
						else
							if Ammos[Passport] and Ammos[Passport][wHash] then
								Ammos[Passport][wHash] = nil
							end
						end
					end

					TriggerClientEvent("itensNotify",source,{ "guardou",itemIndex(Hash),1,itemName(Hash) })
					exports["inventory"]:CleanWeapons(Passport,false)
				end
			else
				if vCLIENT.putWeaponHands(source,Item,1,nil,Full) then
					TriggerClientEvent("itensNotify",source,{ "equipou",itemIndex(Full),1,itemName(Full) })
				end
			end
		elseif Item == "attachsFlashlight" or Item == "attachsCrosshair" or Item == "attachsSilencer" or Item == "attachsMagazine" or Item == "attachsGrip" or Item == "attachsMuzzleHeavy" or Item == "attachsBarrel" or Item == "attachsMuzzleFat" then
			local Weapon = vCLIENT.returnWeapon(source)
			if Weapon then
				if vCLIENT.checkAttachs(source,Item,Weapon) then
					if not Attachs[Passport] then
						Attachs[Passport] = {}
					end

					if not Attachs[Passport][Weapon] then
						Attachs[Passport][Weapon] = {}
					end

					if not Attachs[Passport][Weapon][Item] then
						if vRP.TakeItem(Passport,Full,1,false,Slot) then
							TriggerClientEvent("itensNotify",source,{ "equipou",itemIndex(Full),1,itemName(Full) })
							TriggerClientEvent("inventory:Update",source,"Backpack")
							Attachs[Passport][Weapon][Item] = true
							vCLIENT.putAttachs(source,Item,Weapon)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","O armamento não possui suporte ao componente.",5000)
					end
				else
					TriggerClientEvent("Notify",source,"amarelo","O armamento já possui o componente equipado.",5000)
				end
			end
		elseif Use[Item] then
			Use[Item](source,Passport,Amount,Slot,Full,Item,Split)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCEL
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Cancel()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Active[Passport] ~= nil then
			Active[Passport] = nil
			vGARAGE.UpdateHotwired(source,false)
			Player(source)["state"]["Buttons"] = false
			TriggerClientEvent("Progress",source,"Cancelando",1000)

			if verifyObjects[Passport] then
				local Model = verifyObjects[Passport][1]
				local Hash = verifyObjects[Passport][2]

				if Trashs[Model] then
					if Trashs[Model][Hash] then
						Trashs[Model][Hash] = nil
					end
				end

				verifyObjects[Passport] = nil
			end

			if verifyAnimals[Passport] then
				local Model = verifyAnimals[Passport][1]

				if Animals[Model] then
					local netObjects = verifyAnimals[Passport][2]

					if Animals[Model][netObjects] then
						Animals[Model][netObjects] = Animals[Model][netObjects] - 1
						verifyAnimals[Passport] = nil
					end
				end
			end
		end

		if Carry[Passport] then
			TriggerClientEvent("player:ropeCarry",Carry[Passport],source)
			TriggerClientEvent("player:Commands",Carry[Passport],false)
			vRPC.Destroy(Carry[Passport])
			Carry[Passport] = nil
		end

		if Scanners[Passport] then
			TriggerClientEvent("inventory:updateScanner",source,false)
			Player(source)["state"]["Buttons"] = false
			Scanners[Passport] = nil
		end

		vRPC.Destroy(source)

		if GetPlayerRoutingBucket(source) > 900000 then
			TriggerEvent("arena:Cancel",source,Passport)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKINVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.checkInventory()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Active[Passport] then
		return false
	end

	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFYWEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.verifyWeapon(Item,Ammo)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not vRP.ConsultItem(Passport,Item,1) then
		local Ammunation = itemAmmo(Item)
		if Ammunation and Ammos[Passport] and Ammos[Passport][Ammunation] then
			if Ammo and Ammo > 0 then
				Ammos[Passport][Ammunation] = Ammo
			end

			if Ammos[Passport][Ammunation] > 0 then
				vRP.GenerateItem(Passport,Ammunation,Ammos[Passport][Ammunation])
				Ammos[Passport][Ammunation] = nil
			end
		end

		if Attachs[Passport] and Attachs[Passport][Item] then
			for Component,_ in pairs(Attachs[Passport][Item]) do
				vRP.GenerateItem(Passport,Component,1)
			end

			Attachs[Passport][Item] = nil
		end

		TriggerClientEvent("inventory:Update",source,"Backpack")
		exports["inventory"]:CleanWeapons(Passport,false)

		return false
	end

	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DROPWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.dropWeapons(Item)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Item ~= "" and Item and not vRP.ConsultItem(Passport,Item,1) then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVETHROWING
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.removeThrowing(Item)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Item ~= "" and Item ~= nil then
		vRP.TakeItem(Passport,Item,1)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREVENTWEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.preventWeapon(Item,Ammo)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Ammos[Passport] then
		local Ammunation = itemAmmo(Item)

		if Ammunation and Ammos[Passport][Ammunation] then
			if Ammo > 0 then
				Ammos[Passport][Ammunation] = Ammo
			else
				Ammos[Passport][Ammunation] = nil
				exports["inventory"]:CleanWeapons(Passport,false)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFYOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.VerifyObjects(Entity,Service)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		if Entity[1] ~= nil and Entity[2] ~= nil and Entity[4] ~= nil then
			local Hash = Entity[1]
			local Model = Entity[2]
			local Coords = Entity[4]

			if not verifyObjects[Passport] then
				if not Trashs[Model] then
					Trashs[Model] = {}
				end

				for k,v in pairs(Trashs[Model]) do
					if #(v["Coords"] - Coords) <= 0.75 and os.time() <= v["timer"] then
						local Cooldown = parseInt(v["timer"] - os.time())
						TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..Cooldown.."</b> segundos.",5000)
						return
					end
				end

				Active[Passport] = os.time() + 5
				TriggerClientEvent("Progress",source,"Vasculhando",5000)
				vRPC.playAnim(source,false,{"amb@prop_human_bum_bin@base","base"},true)

				verifyObjects[Passport] = { Model,Hash }
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				Trashs[Model][Hash] = { ["Coords"] = Coords, ["timer"] = os.time() + 3600 }

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false

						local itemSelect = { "dollars",500 }

						if Service == "Lixeiro" then
							itemSelect = { "recyclable",math.random(30,45) }
						end

						if itemSelect[1] == "" then
							TriggerClientEvent("Notify",source,"amarelo","Nada encontrado.",5000)
						else
							if (vRP.InventoryWeight(Passport) + itemWeight(itemSelect[1]) * itemSelect[2]) <= vRP.GetWeight(Passport) then
								vRP.GenerateItem(Passport,itemSelect[1],itemSelect[2],true)
								vRP.UpgradeStress(Passport,1)
							else
								TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
								Trashs[Model][Hash] = nil
							end
						end

						verifyObjects[Passport] = nil
					end

					Wait(100)
				until not Active[Passport]
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Nada encontrado.",5000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:APPLYPLATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:applyPlate")
AddEventHandler("inventory:applyPlate",function(Entity)
	local source = source
	local consultItem = {}
	local Plate = Entity[1]
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		if not Plates[Plate] then
			consultItem = vRP.InventoryItemAmount(Passport,"plate")
			if consultItem[1] <= 0 then
				TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("plate").."</b>.",5000)
				return
			end
		end

		local consultPliers = vRP.InventoryItemAmount(Passport,"pliers")
		if consultPliers[1] <= 0 then
			TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("pliers").."</b>.",5000)
			return
		end

		if Plates[Plate] ~= nil then
			if os.time() < Plates[Plate][1] then
				local plateTimers = parseInt(Plates[Plate][1] - os.time())
				if plateTimers ~= nil then
					TriggerClientEvent("Notify",source,"azul","Aguarde "..CompleteTimers(plateTimers)..".",5000)
				end

				return
			end
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("Progress",source,"Trocando",10000)
		vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false

				if not Plates[Plate] then
					if vRP.TakeItem(Passport,consultItem[2],1,true) then
						local newPlate = vRP.GeneratePlate()
						TriggerEvent("plateEveryone",newPlate)
						Plates[newPlate] = { os.time() + 3600,Plate }

						local Network = NetworkGetEntityFromNetworkId(Entity[4])
						if DoesEntityExist(Network) and not IsPedAPlayer(Network) and GetEntityType(Network) == 2 then
							SetVehicleNumberPlateText(Network,newPlate)
						end
					end
				else
					local Network = NetworkGetEntityFromNetworkId(Entity[4])
					if DoesEntityExist(Network) and not IsPedAPlayer(Network) and GetEntityType(Network) == 2 then
						SetVehicleNumberPlateText(Network,Plates[Plate][2])
					end

					if math.random(100) >= 50 then
						vRP.GenerateItem(Passport,"plate",1,true)
					else
						TriggerClientEvent("Notify",source,"azul","Após remove-la a mesma quebrou.",5000)
					end

					TriggerEvent("plateReveryone",Plate)
					Plates[Plate] = nil
				end
			end

			Wait(100)
		until not Active[Passport]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEALTRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.StealTrunk(Entity)
	local source = source
	local Plate = Entity[1]
	local Network = Entity[4]
	local vehModels = Entity[2]
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		if not vCLIENT.checkWeapon(source,"WEAPON_CROWBAR") then
			TriggerClientEvent("Notify",source,"amarelo","<b>Pé de Cabra</b> não encontrado.",5000)
			return
		end

		if not vRP.PassportPlate(Plate) then
			if not Trunks[Plate] then
				Trunks[Plate] = os.time()
			end

			if os.time() >= Trunks[Plate] then
				vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
				Active[Passport] = os.time() + 100

				if vTASKBAR.stealTrunk(source) then
					Active[Passport] = os.time() + 10
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("Progress",source,"Vasculhando",10000)
					TriggerClientEvent("player:Residuals",source,"Resíduo de Ferro.")
					TriggerClientEvent("player:syncDoorsOptions",source,Network,"open")

					repeat
						if os.time() >= parseInt(Active[Passport]) then
							Active[Passport] = nil
							vRPC.stopAnim(source,false)
							Player(source)["state"]["Buttons"] = false
							TriggerClientEvent("player:syncDoorsOptions",source,Network,"close")

							if os.time() >= Trunks[Plate] then
								local randItens = math.random(#StealItens)
								if math.random(250) <= StealItens[randItens]["rand"] then
									local randAmounts = math.random(StealItens[randItens]["min"],StealItens[randItens]["max"])

									if (vRP.InventoryWeight(Passport) + itemWeight(StealItens[randItens]["item"]) * randAmounts) <= vRP.GetWeight(Passport) then
										vRP.GenerateItem(Passport,StealItens[randItens]["item"],randAmounts,true)
										Trunks[Plate] = os.time() + 3600
										vRP.UpgradeStress(Passport,2)
									else
										TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
									end
								else
									TriggerClientEvent("Notify",source,"amarelo","Nada encontrado.",5000)
									Trunks[Plate] = os.time() + 3600
								end
							end
						end

						Wait(100)
					until not Active[Passport]
				else
					TriggerClientEvent("inventory:vehicleAlarm",source,Network,Plate)
					vRPC.stopAnim(source,false)
					Active[Passport] = nil

					local Coords = vRP.GetEntityCoords(source)
					local Service = vRP.NumPermission("Police")
					for Passports,Sources in pairs(Service) do
						async(function()
							TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo de Porta-Malas", x = Coords["x"], y = Coords["y"], z = Coords["z"], vehicle = VehicleName(vehModels).." - "..Plate, time = "Recebido às "..os.date("%H:%M"), blipColor = 44 })
						end)
					end
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Nada encontrado.",5000)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Veículo protegido pela seguradora.",1000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMALS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Animals(Entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Entity[2] ~= nil and Entity[3] ~= nil then
			if not vCLIENT.checkWeapon(source,"WEAPON_SWITCHBLADE") then
				TriggerClientEvent("Notify",source,"amarelo","<b>Canivete</b> não encontrado.",5000)
				return
			end

			local Model = Entity[2]
			local netObjects = Entity[3]

			if not Animals[Model] then
				Animals[Model] = {}
			end

			if not Animals[Model][netObjects] then
				Animals[Model][netObjects] = 0
			end

			if not verifyAnimals[Passport] and not Active[Passport] and Animals[Model][netObjects] < 5 then
				if (vRP.InventoryWeight(Passport) + itemWeight("meat")) <= vRP.GetWeight(Passport) then
					if vTASKBAR.taskOne(source) then
						Active[Passport] = os.time() + 5
						TriggerClientEvent("Progress",source,"Esfolando",5000)

						if not vCLIENT.animalAnim(source) then
							vRPC.Destroy(source)
							vRPC.playAnim(source,false,{"amb@medic@standing@kneel@base","base"},true)
							vRPC.playAnim(source,true,{"anim@gangops@facility@servers@bodysearch@","player_search"},true)
						end

						Player(source)["state"]["Buttons"] = true
						TriggerClientEvent("inventory:Close",source)
						verifyAnimals[Passport] = { Model,netObjects }
						Animals[Model][netObjects] = Animals[Model][netObjects] + 1

						local Experience = vRP.GetExperience(Passport,"Hunting")
						local Category = ClassCategory(Experience)

						local BonusList = { "mtlion1star","mtlion2star","mtlion3star" }
						local HuntList1star = { "coyote1star","boar1star","deer1star" }
						local HuntList2star = { "coyote1star","boar1star","deer1star" }
						local HuntList3star = { "coyote1star","boar1star","deer1star" }
			
						local HuntRandom1star = math.random(#HuntList1star)
						local HuntRandom2star = math.random(#HuntList2star)
						local HuntRandom3star = math.random(#HuntList3star)
				
						local HuntSelects1star = HuntList1star[HuntRandom1star]
						local HuntSelects2star = HuntList2star[HuntRandom2star]
						local HuntSelects3star = HuntList3star[HuntRandom3star]

						repeat
							if os.time() >= parseInt(Active[Passport]) then
								Active[Passport] = nil
								verifyAnimals[Passport] = nil
								Player(source)["state"]["Buttons"] = false

								if Animals[Model] then
									if parseInt(Animals[Model][netObjects]) <= 1 then
										vRP.GenerateItem(Passport,HuntSelects2star,1,true)
									elseif parseInt(Animals[Model][netObjects]) >= 2 then
										vRPC.Destroy(source)
										Animals[Model][netObjects] = nil
										TriggerEvent("DeletePed",netObjects)
										vRP.GenerateItem(Passport,"leather",2,true)
									end
								end
							end

							Wait(100)
						until not Active[Passport]
					end
				else
					TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
				end
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Nada encontrado.",5000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.StoreObjects(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Objects[Number] then
			if (vRP.InventoryWeight(Passport) + itemWeight(Objects[Number]["item"])) <= vRP.GetWeight(Passport) then
				vRP.GiveItem(Passport,Objects[Number]["item"],1,true)
				TriggerClientEvent("objects:Remover",-1,Number)
				Objects[Number] = nil
			else
				TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAKEPRODUCTS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.MakeProducts(Table)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		local Split = splitString(Table,"-")
		local Selected = Split[1]

		if Products[Selected] then
			if Selected == "cemitery" then
				if not vTASKBAR.taskOne(source) then
					local Coords = vRP.GetEntityCoords(source)
					local Service = vRP.NumPermission("Police")
					for Passports,Sources in pairs(Service) do
						async(function()
							vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
							TriggerClientEvent("NotifyPush",Sources,{ code = 20, title = "Roubo de Pertences", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Alarme de segurança", time = "Recebido às "..os.date("%H:%M"), blipColor = 16 })
						end)
					end
				end
			end

			local Need = {}
			local Consult = {}
			local Number = math.random(#Products[Selected])

			if Products[Selected][Number]["item"] then
				if vRP.MaxItens(Passport,Products[Selected][Number]["item"],Products[Selected][Number]["itemAmount"]) then
					TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",3000)
					return
				end

				if (vRP.InventoryWeight(Passport) + itemWeight(Products[Selected][Number]["item"]) * Products[Selected][Number]["itemAmount"]) > vRP.GetWeight(Passport) then
					TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
					return
				end
			end

			if Products[Selected][Number]["need"] then
				local needItem = Products[Selected][Number]["need"]

				if type(needItem) == "table" then
					for k,v in pairs(needItem) do
						Consult = vRP.InventoryItemAmount(Passport,v["item"])
						if Consult[1] < v["amount"] then
							TriggerClientEvent("Notify",source,"amarelo","Necessário possuir <b>"..v["amount"].."x "..itemName(v["item"]).."</b>.",5000)
							return
						end

						Need[k] = { Consult[2],v["amount"] }
					end
				else
					needAmount = Products[Selected][Number]["needAmount"]
					Consult = vRP.InventoryItemAmount(Passport,needItem)
					if Consult[1] < needAmount then
						TriggerClientEvent("Notify",source,"amarelo","Necessário possuir <b>"..needAmount.."x "..itemName(needItem).."</b>.",5000)
						return
					end
				end
			end

			Player(source)["state"]["Buttons"] = true
			Active[Passport] = os.time() + Products[Selected][Number]["timer"]
			TriggerClientEvent("Progress",source,"Produzindo",Products[Selected][Number]["timer"] * 1000)

			if Selected == "tablecoke" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			elseif Selected == "paper" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			elseif Selected == "tablemeth" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			elseif Selected == "tableweed" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			elseif Selected == "Pearls1" then
				vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
			elseif Selected == "Pearls2" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			elseif Selected == "Pearls3" then
				vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
			elseif Selected == "milkBottle" then
				vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
			elseif Selected == "cemitery" then
				vRPC.playAnim(source,false,{"amb@medic@standing@tendtodead@idle_a","idle_a"},true)
			elseif Selected == "fishfillet" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			elseif Selected == "marshmallow" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			elseif Selected == "animalmeat" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			elseif Selected == "emptybottle" then
				vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
			end

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Player(source)["state"]["Buttons"] = false
					Active[Passport] = nil
					local Points = 0

					if Selected ~= "scanner" then
						vRPC.stopAnim(source,false)
					end

					if Products[Selected][Number]["need"] then
						if type(Products[Selected][Number]["need"]) == "table" then
							for k,v in pairs(Need) do
								local Split = splitString(v[1],"-")
								if Split[1] == "weedleaf" and Split[2] ~= nil then
									Points = Split[2]
								end

								vRP.RemoveItem(Passport,v[1],v[2],false)
							end
						else
							vRP.RemoveItem(Passport,Consult[2],needAmount,false)
						end
					end

					if Products[Selected][Number]["item"] then
						if Selected == "tableweed" then
							vRP.GenerateItem(Passport,Products[Selected][Number]["item"].."-"..Points,Products[Selected][Number]["itemAmount"],true)
						else
							vRP.GenerateItem(Passport,Products[Selected][Number]["item"],Products[Selected][Number]["itemAmount"],true)
						end
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISMANTLE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Dismantle(Entity)
	local source = source
	local vehName = Entity[2]
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Desmanchando",10000)
		vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source)
				Player(source)["state"]["Buttons"] = false
				TriggerEvent("garages:deleteVehicle",Entity[4],Entity[1])
				TriggerClientEvent("player:Residuals",source,"Resíduo de Metal.")
				TriggerClientEvent("player:Residuals",source,"Resíduo de Alumínio.")

				local Class = "B"
				if Dismantle[Passport] then
					Class = ClassCategory(Dismantle[Passport])
				end

				local AmountItens = math.random(5000,7550)
				local VehSelected = "suspension"
				local VehParts = math.random(4)
				local VehRandom = 1000

				if Class == "B" or Class == "B+" then
					VehRandom = math.random(4500)
					AmountItens = math.random(5000,7550)
				elseif Class == "A" or Class == "A+" then
					VehRandom = math.random(3500)
					AmountItens = math.random(6000,8250)
				elseif Class == "S" or Class == "S+" then
					VehRandom = math.random(2500)
					AmountItens = math.random(8250,10000)
				end

				if VehParts <= 1 then
					VehSelected = "engine"
				elseif VehParts == 2 then
					VehSelected = "transmission"
				elseif VehParts == 3 then
					VehSelected = "brake"
				end

				if VehRandom <= 10 then
					vRP.GenerateItem(Passport,VehSelected.."e",1,true)
				elseif VehRandom >= 10 and VehRandom <= 30 then
					vRP.GenerateItem(Passport,VehSelected.."d",1,true)
				elseif VehRandom >= 31 and VehRandom <= 60 then
					vRP.GenerateItem(Passport,VehSelected.."c",1,true)
				elseif VehRandom >= 61 and VehRandom <= 100 then
					vRP.GenerateItem(Passport,VehSelected.."b",1,true)
				elseif VehRandom >= 101 and VehRandom <= 150 then
					vRP.GenerateItem(Passport,VehSelected.."a",1,true)
				end

				local Members = exports["vrp"]:Party(Passport,source,20)
				if #Members > 1 then
					for _,v in pairs(Members) do
						vRP.GenerateItem(v["Passport"],"dollarsroll",AmountItens * #Members,true)
						vRP.PutExperience(v["Passport"],"Dismantle",2)
					end
				else
					vRP.GenerateItem(Passport,"dollarsroll",AmountItens,true)
					vRP.PutExperience(Passport,"Dismantle",1)
				end

				vRP.GenerateItem(Passport,"dismantle",1,true)

				if math.random(1000) <= 100 then
					vRP.GenerateItem(Passport,"plate",1,true)
				end
			end

			Wait(100)
		until not Active[Passport]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVETYRES
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.RemoveTyres(Entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Entity[2] ~= "veto" and Entity[2] ~= "veto2" then
		if not vCLIENT.checkWeapon(source,"WEAPON_WRENCH") then
			TriggerClientEvent("Notify",source,"amarelo","<b>Chave Inglesa</b> não encontrada.",5000)
			return
		end

		local Vehicle = NetworkGetEntityFromNetworkId(Entity[4])
		if DoesEntityExist(Vehicle) and not IsPedAPlayer(Vehicle) and GetEntityType(Vehicle) == 2 then
			if vCLIENT.tyreHealth(source,Entity[4],Entity[5]) == 1000.0 then
				if vRP.MaxItens(Passport,"tyres",1) then
					TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",3000)
					return
				end

				if vRP.PassportPlate(Entity[1]) then
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("inventory:Close",source)
					vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

					if vTASKBAR.taskThree(source) then
						Active[Passport] = os.time() + 10
						TriggerClientEvent("Progress",source,"Removendo",10000)

						repeat
							if os.time() >= parseInt(Active[Passport]) then
								Active[Passport] = nil

								local Vehicle = NetworkGetEntityFromNetworkId(Entity[4])
								if DoesEntityExist(Vehicle) and not IsPedAPlayer(Vehicle) and GetEntityType(Vehicle) == 2 then
									if vCLIENT.tyreHealth(source,Entity[4],Entity[5]) == 1000.0 then
										TriggerClientEvent("inventory:explodeTyres",source,Entity[4],Entity[1],Entity[5])
										vRP.GenerateItem(Passport,"tyres",1,true)
									end
								end
							end

							Wait(100)
						until not Active[Passport]
					end

					Player(source)["state"]["Buttons"] = false
					vRPC.Destroy(source)
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:DRINK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Drink")
AddEventHandler("inventory:Drink",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",5000)
		vRPC.CreateObjects(source,"amb@world_human_drinking@coffee@male@idle_a","idle_c","prop_plastic_cup_02",49,28422)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRP.UpgradeThirst(Passport,15)
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false
			end

			Wait(100)
		until not Active[Passport]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEALPEDS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.StealPeds()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Rand = math.random(#StealPeds)
		local Amount = math.random(StealPeds[Rand]["min"],StealPeds[Rand]["max"])

		if vRP.MaxItens(Passport,StealPeds[Rand]["item"],Amount) then
			TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",5000)
			return true
		end

		if (vRP.InventoryWeight(Passport) + itemWeight(StealPeds[Rand]["item"]) * Amount) <= vRP.GetWeight(Passport) then
			vRP.GenerateItem(Passport,StealPeds[Rand]["item"],Amount,true)

			if math.random(100) >= 75 and vRP.DoesEntityExist(source) then
				--TriggerEvent("Wanted",source,Passport,60)

				local Coords = vRP.GetEntityCoords(source)
				local Service = vRP.NumPermission("Police")
				for Passports,Sources in pairs(Service) do
					async(function()
						vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
						TriggerClientEvent("NotifyPush",Sources,{ code = 32, title = "Assalto a Americanos", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Ligação Anônima", color = 16 })
					end)
				end
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Mochila cheia.",5000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKDRUGS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.CheckDrugs()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		for k,v in pairs(DrugsList) do
			local Amount = math.random(v["Amount"]["Min"],v["Amount"]["Max"])
			local Price = math.random(v["Price"]["Min"],v["Price"]["Max"])

			local Consult = vRP.InventoryItemAmount(Passport,k)
			if Consult[1] >= Amount then
				Drugs[Passport] = { Consult[2],Amount,Price * Amount }
				return true
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTDRUGS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.PaymentDrugs()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Drugs[Passport] then
		local Points = 0
		local Percentage = 95
		local Split = splitString(Drugs[Passport][1],"-")
		if Split[2] ~= nil then
			Points = parseInt(Split[2])
		end

		if vRP.TakeItem(Passport,Drugs[Passport][1],Drugs[Passport][2],true) then
			vRP.GenerateItem(Passport,"dollarsroll",Drugs[Passport][3] + (Points * 2),true)
			vRP.UpgradeStress(Passport,math.random(1,2))

			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)

			TriggerClientEvent("player:Residuals",source,"Resíduo Orgânico.")

			Percentage = Percentage - Points

			if Percentage <= 80 then
				Percentage = 80
			end

			if math.random(100) >= Percentage then
				local Ped = GetPlayerPed(source)
				local Coords = GetEntityCoords(Ped)
				local Service = vRP.NumPermission("Police")
				for Passports,Sources in pairs(Service) do
					async(function()
						vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
						TriggerClientEvent("NotifyPush",Sources,{ code = 20, title = "Venda de Drogas", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Ligação Anônima", time = "Recebido às "..os.date("%H:%M"), blipColor = 16 })
					end)
				end
			end

			Drugs[Passport] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:ROLLVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:RollVehicle")
AddEventHandler("player:RollVehicle",function(Entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 20
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Desvirando",20000)
		vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source)
				Player(source)["state"]["Buttons"] = false

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("target:RollVehicle",v,Entity[4])
					end)
				end
			end

			Wait(100)
		until not Active[Passport]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:BLACKOUT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Blackout")
AddEventHandler("inventory:Blackout",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		TriggerClientEvent("Notify",source,"amarelo","Sistema indisponivel.",5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REGISTERSTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.RegistersTimers(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Service,Total = vRP.NumPermission("Police")
		if Total <= 0 then
			TriggerClientEvent("Notify",source,"amarelo","Contingente indisponível.",5000)
			Player(source)["state"]["Buttons"] = false
	
			return
		end

		if vRP.ConsultItem(Passport,"lockpick",1) then
			if Registers[Number] then
				if os.time() < Registers[Number] then
					local CooldownCaixinha = parseInt(Registers[Number] - os.time())
					TriggerClientEvent("Notify",source,"amarelo","Caixa vazio, aguarde <b>"..CooldownCaixinha.."</b> segundos para roubar novamente",5000)
					return false
				else
					InitRegisters(Number,source)
					return true
				end
			else
				InitRegisters(Number,source)
				return true
			end
	    else
			TriggerClientEvent("Notify",source,"amarelo","<b>Lockpick</b> não encontrado.",5000)
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INITREGISTERS
-----------------------------------------------------------------------------------------------------------------------------------------
function InitRegisters(Number,source)
	Registers[Number] = os.time() + 900

	local Ped = GetPlayerPed(source)
	local Coords = GetEntityCoords(Ped)

	if math.random(100) <= 75 then
		local Service = vRP.NumPermission("Police")
		for Passports,Sources in pairs(Service) do
			async(function()
				TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Caixa Registradora", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Alarme de segurança", time = "Recebido às "..os.date("%H:%M"), blipColor = 44 })
			end)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REGISTERSPAY
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.RegistersPay()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		Active[Passport] = os.time() + 30
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Roubando",30000)
		vRPC.playAnim(source,false,{"oddjobs@shop_robbery@rob_till","loop"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source)
				Player(source)["state"]["Buttons"] = false

				vRP.UpgradeStress(Passport,math.random(1,2))
				TriggerEvent("Wanted",source,Passport,30)
				vRP.GenerateItem(Passport,"dollarsroll",math.random(2750,3450),true)
				TriggerClientEvent("player:Residuals",source,"Resíduo de Arrombamento.")
			end

			Wait(100)
		until not Active[Passport]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:BUFFSERVER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("inventory:BuffServer",function(source,Passport,Name,Amount)
	if not Buffs[Name][Passport] then
		Buffs[Name][Passport] = 0
	end

	if os.time() >= Buffs[Name][Passport] then
		Buffs[Name][Passport] = os.time() + Amount
	else
		Buffs[Name][Passport] = Buffs[Name][Passport] + Amount

		if (Buffs[Name][Passport] - os.time()) >= 3600 then
			Buffs[Name][Passport] = os.time() + 3600
		end
	end

	TriggerClientEvent("hud:"..Name,source,Buffs[Name][Passport] - os.time())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Ammos[Passport] and Attachs[Passport] then
		if Temporary[Passport] then
			Ammos[Passport] = Temporary[Passport]["Ammos"]
			Attachs[Passport] = Temporary[Passport]["Attachs"]
			Temporary[Passport] = nil
		end

		vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Attachs", dvalue = json.encode(Attachs[Passport]) })
		vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Ammos", dvalue = json.encode(Ammos[Passport]) })

		Attachs[Passport] = nil
		Ammos[Passport] = nil
	end

	if Active[Passport] then
		Active[Passport] = nil
	end

	if verifyObjects[Passport] then
		verifyObjects[Passport] = nil
	end

	if verifyAnimals[Passport] then
		verifyAnimals[Passport] = nil
	end

	if Healths[Passport] then
		Healths[Passport] = nil
	end

	if Armors[Passport] then
		Armors[Passport] = nil
	end

	if Heroin[Passport] then
		Heroin[Passport] = nil
	end

	if Scanners[Passport] then
		Scanners[Passport] = nil
	end

	if Carry[Passport] then
		TriggerClientEvent("player:Commands",Carry[Passport],false)
		vRPC.Destroy(Carry[Passport])
		Carry[Passport] = nil
	end

	if Drugs[Passport] then
		Drugs[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
	Ammos[Passport] = vRP.UserData(Passport,"Ammos")
	Attachs[Passport] = vRP.UserData(Passport,"Attachs")

	TriggerClientEvent("objects:Table",source,Objects)
	TriggerClientEvent("drops:Table",source,Drops)

	for Name,_ in pairs(Buffs) do
		if Buffs[Name][Passport] then
			if os.time() < Buffs[Name][Passport] then
				TriggerClientEvent("hud:"..Name,source,Buffs[Name][Passport] - os.time())
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEANWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("CleanWeapons",function(Passport,Clean)
	local source = vRP.Source(Passport)
	if source then
		local Ped = GetPlayerPed(source)
		local Weapon = GetSelectedPedWeapon(Ped)

		RemoveWeaponFromPed(Ped,Weapon)
		RemoveAllPedWeapons(Ped,false)
		SetPedAmmo(Ped,Weapon,0)

		if Clean then
			Attachs[Passport] = {}
			Ammos[Passport] = {}
		end
	end
end)