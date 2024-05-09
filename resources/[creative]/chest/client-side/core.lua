-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTS
-----------------------------------------------------------------------------------------------------------------------------------------
local Chests = {
	-- Public
	{ ["Name"] = "Paramedic-1", ["Coords"] = vec3(1135.06,-1540.55,35.52), ["Mode"] = "2" },
	{ ["Name"] = "Paramedic-2", ["Coords"] = vec3(1828.41,3674.97,34.41), ["Mode"] = "2" },
	{ ["Name"] = "Paramedic-3", ["Coords"] = vec3(-258.00,6332.62,32.72), ["Mode"] = "2" },
	{ ["Name"] = "Police", ["Coords"] = vec3(-945.09,-2041.01,9.73), ["Mode"] = "1" },
	{ ["Name"] = "Police-2", ["Coords"] = vec3(846.88,-1313.4,28.59), ["Mode"] = "1" },
	{ ["Name"] = "Police-3", ["Coords"] = vec3(1844.31,2573.84,46.26), ["Mode"] = "1" },
	{ ["Name"] = "Police-4", ["Coords"] = vec3(1851.51,3690.14,34.51), ["Mode"] = "1" },
	{ ["Name"] = "Police-5", ["Coords"] = vec3(-449.0,6016.89,32.43), ["Mode"] = "1" },
	-- Mechanic
	{ ["Name"] = "Ottos", ["Coords"] = vec3(836.83,-813.62,26.45), ["Mode"] = "3" },
	{ ["Name"] = "Mechanic", ["Coords"] = vec3(146.11,-3007.79,6.6), ["Mode"] = "3" },
	{ ["Name"] = "Harmony", ["Coords"] = vec3(1187.25,2635.53,38.27), ["Mode"] = "3" },
	-- Restaurants
	{ ["Name"] = "Pearls", ["Coords"] = vec3(-1841.57,-1186.37,14.2), ["Mode"] = "3" },
	-- Contraband
	{ ["Name"] = "Chiliad", ["Coords"] = vec3(1357.72,-2092.94,47.21), ["Mode"] = "3" },
	{ ["Name"] = "Families", ["Coords"] = vec3(-132.8,-1608.81,35.03), ["Mode"] = "3" },
	{ ["Name"] = "Highways", ["Coords"] = vec3(1074.24,-2347.83,30.58), ["Mode"] = "3" },
	{ ["Name"] = "Vagos", ["Coords"] = vec3(361.39,-2041.71,25.59), ["Mode"] = "3" },
	-- Favelas
	{ ["Name"] = "Barragem", ["Coords"] = vec3(1355.97,-255.86,152.01), ["Mode"] = "3" },
	{ ["Name"] = "Farol", ["Coords"] = vec3(3174.85,5145.85,31.47), ["Mode"] = "3" },
	{ ["Name"] = "Parque", ["Coords"] = vec3(405.68,754.49,194.58), ["Mode"] = "3" },
	{ ["Name"] = "Sandy", ["Coords"] = vec3(2177.59,4043.24,34.33), ["Mode"] = "3" },
	{ ["Name"] = "Petroleo", ["Coords"] = vec3(1546.49,-2454.71,80.33), ["Mode"] = "3" },
	{ ["Name"] = "Praia-1", ["Coords"] = vec3(-3112.42,1423.05,30.14), ["Mode"] = "3" },
	{ ["Name"] = "Praia-2", ["Coords"] = vec3(-3129.12,1704.1,41.2), ["Mode"] = "3" },
	{ ["Name"] = "Zancudo", ["Coords"] = vec3(-604.21,2199.58,126.24), ["Mode"] = "3" },
	-- Mafias
	{ ["Name"] = "Madrazzo", ["Coords"] = vec3(1391.16,1158.84,114.13), ["Mode"] = "3" },
	{ ["Name"] = "Playboy", ["Coords"] = vec3(-1524.90,148.86,60.74), ["Mode"] = "3" },
	{ ["Name"] = "TheSouth", ["Coords"] = vec3(977.37,-104.37,74.8), ["Mode"] = "3" },
	{ ["Name"] = "Vineyard", ["Coords"] = vec3(-1871.1,2057.21,135.44), ["Mode"] = "3" },
	-- Trays
	{ ["Name"] = "PearlsTray01", ["Coords"] = vec3(-1835.04,-1191.86,14.49), ["Mode"] = "4" },
	{ ["Name"] = "PearlsTray02", ["Coords"] = vec3(-1834.07,-1190.12,14.46), ["Mode"] = "4" },
	-- Desmanche
	{ ["Name"] = "Bennys", ["Coords"] = vec3(479.21,-1326.64,29.2), ["Mode"] = "3" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LABELS
-----------------------------------------------------------------------------------------------------------------------------------------
local Labels = {
	["1"] = {
		{
			event = "chest:Open",
			label = "Compartimento Geral",
			tunnel = "shop",
			service = "Normal"
		},{
			event = "chest:Open",
			label = "Compartimento Pessoal",
			tunnel = "shop",
			service = "Personal"
		},{
			event = "chest:Open",
			label = "Compartimento Evidências",
			tunnel = "shop",
			service = "Evidences"
		},{
			event = "chest:Upgrade",
			label = "Aumentar",
			tunnel = "server"
		}
	},
	["2"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Normal"
		},{
			event = "chest:Upgrade",
			label = "Aumentar",
			tunnel = "server"
		}
	},
	["3"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Normal"
		},{
			event = "chest:Upgrade",
			label = "Aumentar",
			tunnel = "server"
		},{
			event = "chest:Open",
			label = "Bau Lider",
			tunnel = "shop",
			service = "Manager"
		}
	},
	["4"] = {
		{
			event = "chest:Open",
			label = "Bandeja",
			tunnel = "shop",
			service = "Tray"
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADINIT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Name,v in pairs(Chests) do
		exports["target"]:AddCircleZone("Chest:"..Name,v["Coords"],1.0,{
			name = "Chest:"..Name,
			heading = 3374176
		},{
			Distance = 1.5,
			shop = v["Name"],
			options = Labels[v["Mode"]]
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("chest:Open",function(Name,Init)
	if vSERVER.Permissions(Name,Init) then
		SetNuiFocus(true,true)
		SendNUIMessage({ Action = "Open" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Take",function(Data,Callback)
	vSERVER.Take(Data["item"],Data["slot"],Data["amount"],Data["target"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Store",function(Data,Callback)
	vSERVER.Store(Data["item"],Data["slot"],Data["amount"],Data["target"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Update",function(Data,Callback)
	vSERVER.Update(Data["slot"],Data["target"],Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Chest",function(Data,Callback)
	local Inventory,Chest,invPeso,invMaxpeso,chestPeso,chestMaxpeso = vSERVER.Chest()
	if Inventory then
		Callback({ Inventory = Inventory, Chest = Chest, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Update")
AddEventHandler("chest:Update",function(Action,invPeso,invMaxpeso,chestPeso,chestMaxpeso)
	SendNUIMessage({ Action = Action, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Close")
AddEventHandler("chest:Close",function(Action)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
end)