-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Kaduzera = {}
Tunnel.bindInterface("admin",Kaduzera)
vSERVER = Tunnel.getInterface("admin")
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVISIBLABLES
-----------------------------------------------------------------------------------------------------------------------------------------
LocalPlayer["state"]["Spectate"] = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORTWAY
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.teleportWay()
	local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped) then
		Ped = GetVehiclePedIsUsing(Ped)
    end

	local waypointBlip = GetFirstBlipInfoId(8)
	local x,y,z = table.unpack(GetBlipInfoIdCoord(waypointBlip,Citizen.ResultAsVector()))

	local ground
	local groundFound = false
	local groundCheckHeights = { 0.0,50.0,100.0,150.0,200.0,250.0,300.0,350.0,400.0,450.0,500.0,550.0,600.0,650.0,700.0,750.0,800.0,850.0,900.0,950.0,1000.0,1050.0,1100.0 }

	for i,height in ipairs(groundCheckHeights) do
		SetEntityCoordsNoOffset(Ped,x,y,height,false,false,false)

		RequestCollisionAtCoord(x,y,z)
		while not HasCollisionLoadedAroundEntity(Ped) do
			Wait(1)
		end

		Wait(20)

		ground,z = GetGroundZFor_3dCoord(x,y,height)
		if ground then
			z = z + 1.0
			groundFound = true
			break;
		end
	end

	if not groundFound then
		z = 1200
		GiveDelayedWeaponToPed(Ped,0xFBAB5776,1,0)
	end

	RequestCollisionAtCoord(x,y,z)
	while not HasCollisionLoadedAroundEntity(Ped) do
		Wait(1)
	end

	SetEntityCoordsNoOffset(Ped,x,y,z,false,false,false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORTWAY
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.teleportLimbo()
	local Ped = PlayerPedId()
	local Coords = GetEntityCoords(Ped)
	local _,xCoords = GetNthClosestVehicleNode(Coords["x"],Coords["y"],Coords["z"],1,0,0,0)

	SetEntityCoordsNoOffset(Ped,xCoords["x"],xCoords["y"],xCoords["z"] + 1,false,false,false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLETUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("admin:vehicleTuning")
AddEventHandler("admin:vehicleTuning",function()
	local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped) then
		local vehicle = GetVehiclePedIsUsing(Ped)

		SetVehicleModKit(vehicle,0)
		SetVehicleMod(vehicle,11,GetNumVehicleMods(vehicle,11) - 1,false)
		SetVehicleMod(vehicle,12,GetNumVehicleMods(vehicle,12) - 1,false)
		SetVehicleMod(vehicle,13,GetNumVehicleMods(vehicle,13) - 1,false)
		SetVehicleMod(vehicle,15,GetNumVehicleMods(vehicle,15) - 1,false)
		ToggleVehicleMod(vehicle,18,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTONCOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
-- CreateThread(function()
-- 	while true do
-- 		if IsControlJustPressed(1,38) then
-- 			vSERVER.buttonTxt()
-- 		end
-- 		Wait(1)
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTONMAKERACE
-----------------------------------------------------------------------------------------------------------------------------------------
-- CreateThread(function()
-- 	while true do
-- 		if IsControlJustPressed(1,38) then
-- 			local Ped = PlayerPedId()
-- 			local vehicle = GetVehiclePedIsUsing(Ped)
-- 			local vehCoords = GetEntityCoords(vehicle)
-- 			local leftCoords = GetOffsetFromEntityInWorldCoords(vehicle,5.0,0.0,0.0)
-- 			local rightCoords = GetOffsetFromEntityInWorldCoords(vehicle,-5.0,0.0,0.0)

-- 			vSERVER.raceCoords(vehCoords,leftCoords,rightCoords)
-- 		end

-- 		Wait(1)
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:INITSPECTATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("admin:initSpectate")
AddEventHandler("admin:initSpectate",function(source)
	if not NetworkIsInSpectatorMode() then
		local Pid = GetPlayerFromServerId(source)
		local Ped = GetPlayerPed(Pid)

		LocalPlayer["state"]["Spectate"] = true
		NetworkSetInSpectatorMode(true,Ped)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:RESETSPECTATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("admin:resetSpectate")
AddEventHandler("admin:resetSpectate",function()
	if NetworkIsInSpectatorMode() then
		NetworkSetInSpectatorMode(false)
		LocalPlayer["state"]["Spectate"] = false
	end
end)