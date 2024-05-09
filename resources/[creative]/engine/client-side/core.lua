-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("engine")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Price = 0
local Lasted = 0
local ActiveFuel = 0
local DisplayNui = false
local FuelRecharger = false
local DelayEntered = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- GAMEEVENTTRIGGERED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("gameEventTriggered",function(Event,Message)
	if Event == "CEventNetworkPlayerEnteredVehicle" then
		if Message[1] == PlayerId() and GetGameTimer() >= DelayEntered then
			DelayEntered = GetGameTimer() + 5000

			ActiveFuel = Entity(Message[2])["state"]["Fuel"] or 100
			SetPedConfigFlag(GetPlayerPed(Message[1]),35,false)
			SetVehicleFuelLevel(Message[2],ActiveFuel + 0.0)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLASS
-----------------------------------------------------------------------------------------------------------------------------------------
local Class = {
	[0] = 1.0,
	[1] = 1.0,
	[2] = 1.0,
	[3] = 1.0,
	[4] = 1.0,
	[5] = 1.0,
	[6] = 1.0,
	[7] = 1.0,
	[8] = 1.0,
	[9] = 1.0,
	[10] = 1.0,
	[11] = 1.0,
	[12] = 1.0,
	[13] = 0.0,
	[14] = 0.0,
	[15] = 1.5,
	[16] = 1.0,
	[17] = 1.0,
	[18] = 1.0,
	[19] = 1.0,
	[20] = 1.0,
	[21] = 0.0,
	[22] = 1.0
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONSUME
-----------------------------------------------------------------------------------------------------------------------------------------
local Consume = {
	[1.0] = 0.80,
	[0.9] = 0.75,
	[0.8] = 0.70,
	[0.7] = 0.65,
	[0.6] = 0.60,
	[0.5] = 0.50,
	[0.4] = 0.40,
	[0.3] = 0.30,
	[0.2] = 0.20,
	[0.1] = 0.10,
	[0.0] = 0.00
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FLOOR
-----------------------------------------------------------------------------------------------------------------------------------------
function floor(Number)
	local Mult = 10 ^ 1
	return math.floor(Number * Mult + 0.5) / Mult
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCONSUME
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		local Ped = PlayerPedId()
		if IsPedInAnyVehicle(Ped) then
			local Vehicle = GetVehiclePedIsUsing(Ped)
			if GetVehicleFuelLevel(Vehicle) >= 1 then
				if (GetEntitySpeed(Vehicle) * 2.236936) >= 1 then
					ActiveFuel = (ActiveFuel - (Consume[floor(GetVehicleCurrentRpm(Vehicle))] or 1.0) * (Class[GetVehicleClass(Vehicle)] or 1.0) / 10)
					SetVehicleFuelLevel(Vehicle,ActiveFuel + 0.0)

					if GetPedInVehicleSeat(Vehicle,-1) == Ped then
						Entity(Vehicle)["state"]:set("Fuel",ActiveFuel,true)
					end
				end
			else
				SetVehicleEngineOn(Vehicle,false,true,true)
				TimeDistance = 1
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENGINE:SUPPLY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("engine:Supply")
AddEventHandler("engine:Supply",function(Entitys)
	local Vehicle = Entitys[3]
	Lasted = GetVehicleFuelLevel(Vehicle)

	if Lasted < 99.0 then
		local Gallon = Entitys[5]
		if not DisplayNui and not Gallon then
			SendNUIMessage({ name = "Show", payload = true })
			DisplayNui = true
		end

		FuelRecharger = true

		local Ped = PlayerPedId()
		TaskTurnPedToFaceEntity(Ped,Vehicle,5000)

		while FuelRecharger do
			DisableControlAction(0,18,true)
			DisableControlAction(0,22,true)
			DisableControlAction(0,23,true)
			DisableControlAction(0,24,true)
			DisableControlAction(0,29,true)
			DisableControlAction(0,30,true)
			DisableControlAction(0,31,true)
			DisableControlAction(0,140,true)
			DisableControlAction(0,142,true)
			DisableControlAction(0,143,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,263,true)

			local Coords = GetEntityCoords(Vehicle)
			local VehicleFuel = GetVehicleFuelLevel(Vehicle)

			if not Gallon then
				Price = Price + 0.105
				SetVehicleFuelLevel(Vehicle,VehicleFuel + 0.025)
				SendNUIMessage({ name = "Tank", payload = { tank = floor(VehicleFuel), price = Price, lts = 0.105 * 4 } })
			else
				if GetAmmoInPedWeapon(Ped,883325847) - 0.02 * 100 > 1 then
					SetPedAmmo(Ped,883325847,math.floor(GetAmmoInPedWeapon(Ped,883325847) - 0.02 * 100))
					SetVehicleFuelLevel(Vehicle,VehicleFuel + 0.025)
				end
			end

			DrawText3D(Coords,"~g~E~w~   FINALIZAR")

			if not IsEntityPlayingAnim(Ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",3) and LoadAnim("timetable@gardener@filling_can") then
				TaskPlayAnim(Ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",8.0,8.0,-1,50,1,0,0,0)
			end

			if VehicleFuel >= 100.0 or GetEntityHealth(Ped) <= 100 or (Gallon and GetAmmoInPedWeapon(Ped,883325847) - 0.02 * 100 <= 1) or IsControlJustPressed(1,38) then
				if not Gallon then
					if vSERVER.RechargeFuel(Price) then
						Entity(Vehicle)["state"]:set("Fuel",VehicleFuel,true)
						ActiveFuel = VehicleFuel
					else
						Entity(Vehicle)["state"]:set("Fuel",Lasted,true)
						ActiveFuel = Lasted
					end

					SendNUIMessage({ name = "Show", payload = false })
				else
					Entity(Vehicle)["state"]:set("Fuel",VehicleFuel,true)
				end
				vRP.Destroy()
				FuelRecharger = false
				DisplayNui = false
				Price = 0
			end

			Wait(1)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(Coords,Text)
	local onScreen,x,y = World3dToScreen2d(Coords["x"],Coords["y"],Coords["z"] + 1)

	if onScreen then
		SetTextFont(4)
		SetTextCentre(true)
		SetTextProportional(1)
		SetTextScale(0.35,0.35)
		SetTextColour(255,255,255,150)

		SetTextEntry("STRING")
		AddTextComponentString(Text)
		EndTextCommandDisplayText(x,y)

		local Width = (string.len(Text) + 4) / 170 * 0.45
		DrawRect(x,y + 0.0125,Width,0.03,15,15,15,175)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENGINE:VEHRIFY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("engine:Vehrify")
AddEventHandler("engine:Vehrify",function(Entity)
	local Vehicle = vRP.ClosestVehicle(5)
	
	local Engine = GetVehicleMod(Vehicle,11)
	if Engine ~= -1 then
		exports["dynamic"]:AddButton("Motor","Modelo instalado: <yellow>"..Engine.."</yellow>","","",false,false)
	end

	local Brake = GetVehicleMod(Vehicle,12)
	if Brake ~= -1 then
		exports["dynamic"]:AddButton("Freio","Modelo instalado: <yellow>"..Brake.."</yellow>","","",false,false)
	end

	local Transmission = GetVehicleMod(Vehicle,13)
	if Transmission ~= -1 then
		exports["dynamic"]:AddButton("Transmissão","Modelo instalado: <yellow>"..Transmission.."</yellow>","","",false,false)
	end

	local Suspension = GetVehicleMod(Vehicle,15)
	if Suspension ~= -1 then
		exports["dynamic"]:AddButton("Suspensão","Modelo instalado: <yellow>"..Suspension.."</yellow>","","",false,false)
	end

	local Shielding = GetVehicleMod(Vehicle,16)
	if Shielding ~= -1 then
		exports["dynamic"]:AddButton("Blindagem","Modelo instalado: <yellow>"..Shielding.."</yellow>","","",false,false)
	end

	local Force = GetVehicleEngineHealth(Vehicle) / 10
	exports["dynamic"]:AddButton("Potência","Potência do motor se encontra em <yellow>"..parseInt(Force).."%</yellow>.","","",false,false)

	local Body = GetVehicleBodyHealth(Vehicle) / 10
	exports["dynamic"]:AddButton("Lataria","Qualidade da lataria se encontra em <yellow>"..parseInt(Body).."%</yellow>.","","",false,false)

	local Health = GetEntityHealth(Vehicle) / 10
	exports["dynamic"]:AddButton("Chassi","Rigidez do chassi se encontra em <yellow>"..parseInt(Health).."%</yellow>.","","",false,false)

	exports["dynamic"]:openMenu()
end)