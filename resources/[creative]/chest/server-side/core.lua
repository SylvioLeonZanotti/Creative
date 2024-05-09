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
Tunnel.bindInterface("chest",Kaduzera)
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Open = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFY
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Verify()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.GetFine(Passport) > 0 then
			TriggerClientEvent("Notify",source,"amarelo","Você possui multas pendentes.",10000)
			return false
		end

		if exports["hud"]:Wanted(Passport,source) and exports["hud"]:Reposed(Passport) then
			return false
		end
	end

	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Permissions(Name,Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not exports["hud"]:Wanted(Passport) then
		if Mode == "Personal" then
			Open[Passport] = { ["Name"] = Passport, ["Weight"] = 50, ["Logs"] = false, ["Save"] = true }
			return true
		elseif Mode == "Evidences" and vRP.HasGroup(Passport,"Police") then
			local Keyboard = vKEYBOARD.keySingle(source,"Passaporte:")
			if Keyboard then
				Open[Passport] = { ["Name"] = "Evidences:"..Keyboard[1], ["Weight"] = 50, ["Logs"] = false, ["Save"] = true }
				return true
			end
		elseif Mode == "Custom" then
			Open[Passport] = { ["Name"] = Name, ["Weight"] = 50, ["Logs"] = false, ["Save"] = false }
			return true
		elseif Mode == "Manager" then
			if vRP.HasGroup(Passport,Name,2) then
			    Open[Passport] = { ["Name"] = "Manager:"..Name, ["Weight"] = 1000, ["Logs"] = true, ["Save"] = true }
			    return true
			end
		elseif Mode == "Tray" then
			Open[Passport] = { ["Name"] = Name, ["Weight"] = 15, ["Logs"] = false, ["Save"] = true }
			return true
		else
			local Consult = vRP.Query("chests/GetChests",{ name = Name })
			if Consult[1] and vRP.HasGroup(Passport,Consult[1]["perm"]) then
				Open[Passport] = { ["Name"] = Name, ["Weight"] = Consult[1]["weight"], ["Logs"] = Consult[1]["logs"], ["Save"] = true }
				return true
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Chest()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Open[Passport] then
		local Inventory = {}
		local Inv = vRP.Inventory(Passport)
		for Index,v in pairs(Inv) do
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

			Inventory[Index] = v
		end

		local Chest = {}
		local Result = vRP.GetSrvData("Chest:"..Open[Passport]["Name"],Open[Passport]["Save"])
		for Index,v in pairs(Result) do
			v["amount"] = parseInt(v["amount"])
			v["name"] = itemName(v["item"])
			v["peso"] = itemWeight(v["item"])
			v["index"] = itemIndex(v["item"])
			v["max"] = itemMaxAmount(v["item"])
			v["economy"] = parseFormat(itemEconomy(v["item"]))
			v["desc"] = itemDescription(v["item"])
			v["key"] = v["item"]
			v["slot"] = Index

			local Split = splitString(v["item"],"-")
			if Split[2] ~= nil then
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

			Chest[Index] = v
		end

		return Inventory,Chest,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Open[Passport]["Weight"]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENITENS
-----------------------------------------------------------------------------------------------------------------------------------------
local OpenItens = {
	["mechanicpass"] = {
		["Open"] = "Mechanic",
		["Table"] = {
			{ ["Item"] = "advtoolbox", ["Amount"] = 1 },
			{ ["Item"] = "toolbox", ["Amount"] = 2 },
			{ ["Item"] = "tyres", ["Amount"] = 4 },
			{ ["Item"] = "dollars", ["Amount"] = 200 }
		}
	},
	["uwucoffeepass"] = {
		["Open"] = "UwuCoffee",
		["Table"] = {
			{ ["Item"] = "nigirizushi", ["Amount"] = 3 },
			{ ["Item"] = "sushi", ["Amount"] = 3 },
			{ ["Item"] = "dollars", ["Amount"] = 200 }
		}
	},
	["pizzathispass"] = {
		["Open"] = "PizzaThis",
		["Table"] = {
			{ ["Item"] = "nigirizushi", ["Amount"] = 3 },
			{ ["Item"] = "sushi", ["Amount"] = 3 },
			{ ["Item"] = "dollars", ["Amount"] = 200 }
		}
	},
	["burgershotpass"] = {
		["Open"] = "BurgerShot",
		["Table"] = {
			{ ["Item"] = "hamburger2", ["Amount"] = 1 },
			{ ["Item"] = "cookedmeat", ["Amount"] = 2 },
			{ ["Item"] = "cookedfishfillet", ["Amount"] = 1 },
			{ ["Item"] = "dollars", ["Amount"] = 200 }
		}
	},
	["paramedicpass"] = {
		["Open"] = "Paramedic",
		["Table"] = {
			{ ["Item"] = "gauze", ["Amount"] = 3 },
			{ ["Item"] = "medkit", ["Amount"] = 1 },
			{ ["Item"] = "analgesic", ["Amount"] = 4 },
			{ ["Item"] = "dollars", ["Amount"] = 200 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Store(Item,Slot,Amount,Target)
	local source = source
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport and Open[Passport] then
		if Amount <= 0 then Amount = 1 end

		if itemBlock(Item) then
			TriggerClientEvent("chest:Update",source,"Refresh")

			return true
		end

		if OpenItens[Item] and OpenItens[Item]["Open"] == Open[Passport]["Name"] then
			if vRP.TakeItem(Passport,Item,1) then
				for _,v in pairs(OpenItens[Item]["Table"]) do
					vRP.GenerateItem(Passport,v["Item"],v["Amount"])
				end
			end

			TriggerClientEvent("chest:Update",source,"Refresh")

			return true
		end

		if vRP.StoreChest(Passport,"Chest:"..Open[Passport]["Name"],Amount,Open[Passport]["Weight"],Slot,Target) then
			TriggerClientEvent("chest:Update",source,"Refresh")
		else
			local Result = vRP.GetSrvData("Chest:"..Open[Passport]["Name"],Open[Passport]["Save"])
			TriggerClientEvent("chest:Update",source,"Update",vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Open[Passport]["Weight"])

			if Open[Passport]["Logs"] then
				TriggerEvent("Discord",Open[Passport]["Name"],"**Passaporte:** "..Passport.."\n**Guardou:** "..Amount.."x "..itemName(Item),3042892)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Take(Item,Slot,Amount,Target)
	local source = source
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport and Open[Passport] then
		if Amount <= 0 then Amount = 1 end

		if vRP.TakeChest(Passport,"Chest:"..Open[Passport]["Name"],Amount,Slot,Target) then
			TriggerClientEvent("chest:Update",source,"Refresh")
		else
			local Result = vRP.GetSrvData("Chest:"..Open[Passport]["Name"],Open[Passport]["Save"])
			TriggerClientEvent("chest:Update",source,"Update",vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Open[Passport]["Weight"])

			if string.sub(Open[Passport]["Name"],1,9) == "Helicrash" and vRP.ChestWeight(Result) <= 0 then
				TriggerClientEvent("chest:Close",source)
				exports["helicrash"]:Box()
			end

			if Open[Passport]["Logs"] then
				TriggerEvent("Discord",Open[Passport]["Name"],"**Passaporte:** "..Passport.."\n**Retirou:** "..Amount.."x "..itemName(Item),9317187)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Update(Slot,Target,Amount)
	local source = source
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport and Open[Passport] then
		if Amount <= 0 then Amount = 1 end

		if vRP.UpdateChest(Passport,"stackChest:"..Open[Passport]["Name"],Slot,Target,Amount) then
			TriggerClientEvent("chest:Update",source,"Refresh")
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:UPGRADE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("chest:Upgrade")
AddEventHandler("chest:Upgrade",function(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasService(Passport,Name) then
			if vRP.Request(source,"Aumentar <b>10Kg</b> por <b>$5.000</b> dólares?","Sim, efetuar pagamento","Não, decido depois") then
				if vRP.PaymentFull(Passport,5000) then
					vRP.Query("chests/UpdateChests",{ name = Name })
					TriggerClientEvent("Notify",source,"verde","Compra concluída.",3000)
				else
					TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Open[Passport] then
		Open[Passport] = nil
	end
end)