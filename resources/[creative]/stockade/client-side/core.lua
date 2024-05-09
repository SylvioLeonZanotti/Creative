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
Tunnel.bindInterface("stockade",Kaduzera)
vSERVER = Tunnel.getInterface("stockade")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local stockadeNet = 0
local spawnLocates = 0
local inService = false
local spawnVehicle = nil
local stockDriver01 = nil
local stockDriver02 = nil
local stockDriver03 = nil
local stockDriver04 = nil
local spawnStockade = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOCKLOCATES
-----------------------------------------------------------------------------------------------------------------------------------------
local stockLocates = {
	{ 957.47,-2197.14,30.16,53.86 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOCKADE:INITHACKER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("stockade:initHacker")
AddEventHandler("stockade:initHacker",function()
	if vSERVER.Check() then
		exports["memory"]:StartMinigame({ success = "stockade:Sucess", fail = nil })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOCKADE:INITHACKER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("stockade:Sucess")
AddEventHandler("stockade:Sucess",function()
	inService = true
	spawnStockade = false
	spawnLocates = math.random(#stockLocates)

	TriggerEvent("smartphone:createSMS","Localização do Carro Forte","Localização do Carro Forte.",{ stockLocates[spawnLocates][1],stockLocates[spawnLocates][2],stockLocates[spawnLocates][3] })
		--TriggerEvent("NotifyPush",{ code = 20, title = "Localização do Carro Forte", x = stockLocates[spawnLocates][1], y = stockLocates[spawnLocates][2], z = stockLocates[spawnLocates][3], blipColor = 60 })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		if inService then
			local ped = PlayerPedId()
			local coords = GetEntityCoords(ped)
			local distance = #(coords - vector3(stockLocates[spawnLocates][1],stockLocates[spawnLocates][2],stockLocates[spawnLocates][3]))

			if distance <= 100 and not spawnStockade then
				local mHash = GetHashKey("stockade")
				RequestModel(mHash)
				while not HasModelLoaded(mHash) do
					Wait(1)
				end

				spawnVehicle = CreateVehicle(mHash,stockLocates[spawnLocates][1],stockLocates[spawnLocates][2],stockLocates[spawnLocates][3],stockLocates[spawnLocates][4],true,true)
				stockadeNet = NetworkGetNetworkIdFromEntity(spawnVehicle)

				vSERVER.stockadeInsert(stockadeNet)

				NetworkRegisterEntityAsNetworked(spawnVehicle)
				while not NetworkGetEntityIsNetworked(spawnVehicle) do
					NetworkRegisterEntityAsNetworked(spawnVehicle)
					Wait(1)
				end

				if NetworkDoesNetworkIdExist(stockadeNet) then
					SetEntitySomething(spawnVehicle,true)

					if NetworkGetEntityIsNetworked(spawnVehicle) then
						SetNetworkIdCanMigrate(stockadeNet,true)
						NetworkSetNetworkIdDynamic(stockadeNet,true)
						SetNetworkIdExistsOnAllMachines(stockadeNet,true)
					end
				end

				SetNetworkIdSyncToPlayer(stockadeNet,PlayerId(),true)

				SetEntityInvincible(spawnVehicle,true)
				SetVehicleOnGroundProperly(spawnVehicle)
				SetEntityAsMissionEntity(spawnVehicle,true,true)
				SetVehicleHasBeenOwnedByPlayer(spawnVehicle,true)
				SetVehicleNeedsToBeHotwired(spawnVehicle,false)
				SetEntityHeading(spawnVehicle,stockLocates[spawnLocates][4])

				SetModelAsNoLongerNeeded(mHash)

				local pHash = GetHashKey("s_m_m_security_01")
				RequestModel(pHash)
				while not HasModelLoaded(pHash) do
					Wait(1)
				end

				--stockDriver01 = CreatePedInsideVehicle(spawnVehicle,1,pHash,-1,true,true)
				--stockDriver02 = CreatePedInsideVehicle(spawnVehicle,1,pHash,0,true,true)
				--stockDriver03 = CreatePedInsideVehicle(spawnVehicle,1,pHash,1,true,true)
				--stockDriver04 = CreatePedInsideVehicle(spawnVehicle,1,pHash,2,true,true)

				--SetPedArmour(stockDriver01,0)
				--SetPedAsCop(stockDriver01,true)
				--SetPedCombatRange(stockDriver01,2)
				--SetPedKeepTask(stockDriver01,true)
				--SetPedCombatMovement(stockDriver01,2)
				--SetPedCombatAbility(stockDriver01,0)
				--SetPedFleeAttributes(stockDriver01,0,0)
				--SetPedCombatAttributes(stockDriver01,46,1)
				--SetPedDropsWeaponsWhenDead(stockDriver01,false)
				--TaskVehicleDriveWander(stockDriver01,spawnVehicle,120.0,443)
				--GiveWeaponToPed(stockDriver01,GetHashKey("WEAPON_COMBATPISTOL"),0,false,true)

				--[[SetPedArmour(stockDriver02,0)
				SetPedAsCop(stockDriver02,true)
				SetPedCombatRange(stockDriver02,2)
				SetPedKeepTask(stockDriver02,true)
				SetPedCombatMovement(stockDriver02,2)
				SetPedCombatAbility(stockDriver02,0)
				SetPedFleeAttributes(stockDriver02,0,0)
				SetPedCombatAttributes(stockDriver02,46,1)
				SetPedDropsWeaponsWhenDead(stockDriver02,false)
				GiveWeaponToPed(stockDriver02,GetHashKey("WEAPON_COMBATPISTOL"),0,false,true)

				SetPedArmour(stockDriver03,0)
				SetPedAsCop(stockDriver03,true)
				SetPedCombatRange(stockDriver03,2)
				SetPedKeepTask(stockDriver03,true)
				SetPedCombatMovement(stockDriver03,2)
				SetPedCombatAbility(stockDriver03,0)
				SetPedFleeAttributes(stockDriver03,0,0)
				SetPedCombatAttributes(stockDriver03,46,1)
				SetPedDropsWeaponsWhenDead(stockDriver03,false)
				GiveWeaponToPed(stockDriver03,GetHashKey("WEAPON_COMBATPISTOL"),0,false,true)

				SetPedArmour(stockDriver04,0)
				SetPedAsCop(stockDriver04,true)
				SetPedCombatRange(stockDriver04,2)
				SetPedKeepTask(stockDriver04,true)
				SetPedCombatMovement(stockDriver04,2)
				SetPedCombatAbility(stockDriver04,0)
				SetPedFleeAttributes(stockDriver04,0,0)
				SetPedCombatAttributes(stockDriver04,46,1)
				SetPedDropsWeaponsWhenDead(stockDriver04,false)
				GiveWeaponToPed(stockDriver04,GetHashKey("WEAPON_COMBATPISTOL"),0,false,true)]]---

				spawnStockade = true
			end
		end

		Wait(1000)
	end
end)