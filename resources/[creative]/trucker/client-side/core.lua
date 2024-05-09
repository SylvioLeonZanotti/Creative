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
Tunnel.bindInterface("trucker",Kaduzera)
vSERVER = Tunnel.getInterface("trucker")
vGARAGE = Tunnel.getInterface("garages")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Blip = nil
local Position = 1
local Package = false
local Service = "vehicles"
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUCKERS
-----------------------------------------------------------------------------------------------------------------------------------------
local Truckers = {
	[1518533038] = true,
	[387748548] = true,
	[569305213] = true,
	[-2137348917] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PACKSERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
local packService = {
	["vehicles"] = {
		["trailer"] = "tr4",
		["Coords"] = {
			{ 1256.59,-3239.63,5.17 },
			{ 1725.68,4701.59,41.91,true },
			{ 2793.5,4346.1,49.23 },
			{ 583.97,-267.48,43.32 },
			{ 712.87,-3198.19,18.89 },
			{ 1256.59,-3239.63,5.17 }
		}
	},
	["diesel"] = {
		["trailer"] = "armytanker",
		["Coords"] = {
			{ 1256.59,-3239.63,5.17 },
			{ 1682.1,4923.7,41.45,true },
			{ 2793.5,4346.1,49.23 },
			{ 583.97,-267.48,43.32 },
			{ 712.87,-3198.19,18.89 },
			{ 1256.59,-3239.63,5.17 }
		}
	},
	["fuel"] = {
		["trailer"] = "tanker",
		["Coords"] = {
			{ 1256.59,-3239.63,5.17 },
			{ 154.75,6612.86,31.27,true },
			{ 2793.5,4346.1,49.23 },
			{ 583.97,-267.48,43.32 },
			{ 712.87,-3198.19,18.89 },
			{ 1256.59,-3239.63,5.17 }
		}
	},
	["wood"] = {
		["trailer"] = "trailerlogs",
		["Coords"] = {
			{ 1256.59,-3239.63,5.17 },
			{ -576.72,5329.59,69.61,true },
			{ 2793.5,4346.1,49.23 },
			{ 583.97,-267.48,43.32 },
			{ 712.87,-3198.19,18.89 },
			{ 1256.59,-3239.63,5.17 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUCKER:INITVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("trucker:initVehicles")
AddEventHandler("trucker:initVehicles",function()
	if not Package and vSERVER.checkExist() then
		Position = 1
		Package = true
		Service = "vehicles"
		TriggerEvent("Notify","amarelo","Dirija-se até seu caminhão, buzine o mesmo<br>para receber a carga responsável pelo transporte.",5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUCKER:INITDIESEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("trucker:initDiesel")
AddEventHandler("trucker:initDiesel",function()
	if not Package and vSERVER.checkExist() then
		Position = 1
		Package = true
		Service = "diesel"
		TriggerEvent("Notify","amarelo","Dirija-se até seu caminhão, buzine o mesmo<br>para receber a carga responsável pelo transporte.",5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUCKER:INITFUEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("trucker:initFuel")
AddEventHandler("trucker:initFuel",function()
	if not Package and vSERVER.checkExist() then
		Position = 1
		Package = true
		Service = "fuel"
		TriggerEvent("Notify","amarelo","Dirija-se até seu caminhão, buzine o mesmo<br>para receber a carga responsável pelo transporte.",5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUCKER:INITWOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("trucker:initWood")
AddEventHandler("trucker:initWood",function()
	if not Package and vSERVER.checkExist() then
		Position = 1
		Package = true
		Service = "wood"
		TriggerEvent("Notify","amarelo","Dirija-se até seu caminhão, buzine o mesmo<br>para receber a carga responsável pelo transporte.",5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		if Package then
			local Vehicle = GetPlayersLastVehicle()
			if IsEntityAVehicle(Vehicle) then
				local vehModel = GetEntityModel(Vehicle)
				if Truckers[vehModel] then
					local Ped = PlayerPedId()
					local Coords = GetEntityCoords(Ped)
					local Distance = #(Coords - vec3(packService[Service]["Coords"][Position][1],packService[Service]["Coords"][Position][2],packService[Service]["Coords"][Position][3]))

					if Distance <= 200 then
						TimeDistance = 1
						DrawMarker(1,packService[Service]["Coords"][Position][1],packService[Service]["Coords"][Position][2],packService[Service]["Coords"][Position][3] - 3,0,0,0,0,0,0,12.0,12.0,8.0,255,255,255,25,0,0,0,0)
						DrawMarker(21,packService[Service]["Coords"][Position][1],packService[Service]["Coords"][Position][2],packService[Service]["Coords"][Position][3] + 1,0,0,0,0,180.0,130.0,3.0,3.0,2.0,245,10,70,100,0,0,0,1)

						if Distance <= 10 then
							if Position >= #packService[Service]["Coords"] then
								Package = false
								vSERVER.Payment(Service)

								if DoesBlipExist(Blip) then
									RemoveBlip(Blip)
									Blip = nil
								end
							else
								if Position == 1 then
									if IsControlJustPressed(1,38) then
										local Heading = GetEntityHeading(Vehicle)
										local vehCoords = GetOffsetFromEntityInWorldCoords(Vehicle,0.0,-12.0,0.0)
										local Trailer = vGARAGE.ServerVehicle(packService[Service]["trailer"],vehCoords["x"],vehCoords["y"],vehCoords["z"],Heading,nil,0,nil,1000)

										if NetworkDoesNetworkIdExist(Trailer) then
											local vehicleNet = NetToEnt(Trailer)
											if NetworkDoesNetworkIdExist(vehicleNet) then
												SetVehicleOnGroundProperly(vehicleNet)
											end
										end

										Position = Position + 1
										makeBlipMarked()
									end
								else
									if packService[Service]["Coords"][Position][4] ~= nil then
										if not IsPedInAnyVehicle(Ped) and IsControlJustPressed(1,38) then
											local Vehicle,Network,Plate,vehModel = vRP.VehicleList(10)
											if Vehicle then
												if vehModel == packService[Service]["trailer"] then
													TriggerEvent("Notify","amarelo","Volte para receber o pagamento.",5000)
													TriggerServerEvent("garages:deleteVehicle",Network,Plate)
													Position = Position + 1
													makeBlipMarked()
												end
											end
										end
									else
										Position = Position + 1
										makeBlipMarked()
									end
								end
							end
						end
					end
				end
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAKEBLIPMARKED
-----------------------------------------------------------------------------------------------------------------------------------------
function makeBlipMarked()
	if DoesBlipExist(Blip) then
		RemoveBlip(Blip)
		Blip = nil
	end

	Blip = AddBlipForCoord(packService[Service]["Coords"][Position][1],packService[Service]["Coords"][Position][2],packService[Service]["Coords"][Position][3])
	SetBlipSprite(Blip,12)
	SetBlipColour(Blip,84)
	SetBlipScale(Blip,0.9)
	SetBlipRoute(Blip,true)
	SetBlipAsShortRange(Blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Caminhoneiro")
	EndTextCommandSetBlipName(Blip)
end