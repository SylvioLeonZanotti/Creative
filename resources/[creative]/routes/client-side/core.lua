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
Tunnel.bindInterface("routes",Kaduzera)
vSERVER = Tunnel.getInterface("routes")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local routes = {}
local inCollect = 1
local inSeconds = 0
local inDelivery = 1
local inService = false
local blipCollect = nil
local blipDelivery = nil
local lastService = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADINIT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)

			for k,v in pairs(routes) do
				local distance = #(coords - vec3(v["coords"][1],v["coords"][2],v["coords"][3]))
				if distance <= 2 then
					timeDistance = 1

					if not inService then
						DrawText3D(v["coords"][1],v["coords"][2],v["coords"][3],"~g~E~w~   INICIAR")
					else
						DrawText3D(v["coords"][1],v["coords"][2],v["coords"][3],"~g~E~w~   FINALIZAR")
					end

					if IsControlJustPressed(1,38) and inSeconds <= 0 then
						inSeconds = 3

						if not inService then
							if vSERVER.checkPermission(k) then
								inService = k

								if v["deliveryCoords"] ~= nil then
									if lastService ~= k then
										inDelivery = math.random(#routes[k]["deliveryCoords"])
									end

									makeDeliveryMarked(routes[inService]["deliveryCoords"][inDelivery][1],routes[inService]["deliveryCoords"][inDelivery][2],routes[inService]["deliveryCoords"][inDelivery][3])
								end

								if v["collectCoords"] ~= nil then
									if lastService ~= k then
										if v["routeCollect"] then
											inCollect = 1
										else
											inCollect = math.random(#routes[k]["collectCoords"])
										end
									end

									makeCollectMarked(v["collectCoords"][inCollect][1],v["collectCoords"][inCollect][2],v["collectCoords"][inCollect][3])
								end

								TriggerEvent("Notify","amarelo","Serviço iniciado.",5000)
							end
						else
							if inService == k then
								lastService = k
								inService = false
								TriggerEvent("Notify","amarelo","Serviço finalizado.",5000)

								if DoesBlipExist(blipCollect) then
									RemoveBlip(blipCollect)
									blipCollect = nil
								end

								if DoesBlipExist(blipDelivery) then
									RemoveBlip(blipDelivery)
									blipDelivery = nil
								end
							else
								TriggerEvent("Notify",false,"amarelo","Finalize o emprego anterior para iniciar um novo.",5000)
							end
						end
					end
				end
			end
		end

		Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD CONTENT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local timeDistance = 999
		if inService then
			local ped = PlayerPedId()
			if (routes[inService]["usingVehicle"] and IsPedInAnyVehicle(ped)) or (not routes[inService]["usingVehicle"] and not IsPedInAnyVehicle(ped)) then
				local coords = GetEntityCoords(ped)

				if routes[inService]["collectCoords"] ~= nil then
					local distance = #(coords - vec3(routes[inService]["collectCoords"][inCollect][1],routes[inService]["collectCoords"][inCollect][2],routes[inService]["collectCoords"][inCollect][3]))
					if distance <= routes[inService]["collectShowDistance"] then
						timeDistance = 1

						DrawText3D(routes[inService]["collectCoords"][inCollect][1],routes[inService]["collectCoords"][inCollect][2],routes[inService]["collectCoords"][inCollect][3],"~g~H~w~   "..routes[inService]["collectText"])

						if distance <= routes[inService]["collectButtonDistance"] and inSeconds <= 0 and IsControlJustPressed(1,304) then
							inSeconds = 3

							if routes[inService]["collectAnim"] ~= nil then
								LocalPlayer["state"]["Cancel"] = true
								LocalPlayer["state"]["Commands"] = true
								TriggerEvent("Progress","Coletando",routes[inService]["collectDuration"] + 500)
								SetEntityHeading(ped,routes[inService]["collectCoords"][inCollect][4])
								SetEntityCoords(ped,routes[inService]["collectCoords"][inCollect][1],routes[inService]["collectCoords"][inCollect][2],routes[inService]["collectCoords"][inCollect][3] - 1,1,0,0,0)
								vRP.playAnim(routes[inService]["collectAnim"][1],{routes[inService]["collectAnim"][2],routes[inService]["collectAnim"][3]},routes[inService]["collectAnim"][4])

								Wait(routes[inService]["collectDuration"])

								LocalPlayer["state"]["Commands"] = false
								LocalPlayer["state"]["Cancel"] = false
								vRP.Destroy()
							end

							if routes[inService]["routeCollect"] then
								if routes[inService]["collectVehicle"] ~= nil then
									local vehicle = GetLastDrivenVehicle()
									local vehHash = routes[inService]["collectVehicle"]

									if IsVehicleModel(vehicle,vehHash) then
										if vSERVER.collectConsume(inService) then
											if inCollect >= #routes[inService]["collectCoords"] then
												inCollect = 1
											else
												inCollect = inCollect + 1
											end

											makeCollectMarked(routes[inService]["collectCoords"][inCollect][1],routes[inService]["collectCoords"][inCollect][2],routes[inService]["collectCoords"][inCollect][3])
										end
									else
										TriggerEvent("Notify",false,"amarelo","Precisa utilizar o veículo do <b>"..inService.."</b>.",3000)
									end
								else
									if vSERVER.collectConsume(inService) then
										if inCollect >= #routes[inService]["collectCoords"] then
											inCollect = 1
										else
											inCollect = inCollect + 1
										end

										makeCollectMarked(routes[inService]["collectCoords"][inCollect][1],routes[inService]["collectCoords"][inCollect][2],routes[inService]["collectCoords"][inCollect][3])
									end
								end
							else
								if routes[inService]["collectVehicle"] ~= nil then
									local vehicle = GetLastDrivenVehicle()
									local vehHash = routes[inService]["collectVehicle"]

									if IsVehicleModel(vehicle,vehHash) then
										if vSERVER.collectConsume(inService) then
											inCollect = math.random(#routes[inService]["collectCoords"])
											makeCollectMarked(routes[inService]["collectCoords"][inCollect][1],routes[inService]["collectCoords"][inCollect][2],routes[inService]["collectCoords"][inCollect][3])
										end
									else
										TriggerEvent("Notify",false,"amarelo","Precisa utilizar o veículo do <b>"..inService.."</b>.",3000)
									end
								else
									if vSERVER.collectConsume(inService) then
										inCollect = math.random(#routes[inService]["collectCoords"])

										makeCollectMarked(routes[inService]["collectCoords"][inCollect][1],routes[inService]["collectCoords"][inCollect][2],routes[inService]["collectCoords"][inCollect][3])
									end
								end
							end
						end
					end
				end

				if routes[inService]["deliveryCoords"] ~= nil then
					local distance = #(coords - vec3(routes[inService]["deliveryCoords"][inDelivery][1],routes[inService]["deliveryCoords"][inDelivery][2],routes[inService]["deliveryCoords"][inDelivery][3]))
					if distance <= 30 then
						timeDistance = 1

						DrawText3D(routes[inService]["deliveryCoords"][inDelivery][1],routes[inService]["deliveryCoords"][inDelivery][2],routes[inService]["deliveryCoords"][inDelivery][3],"~g~H~w~   "..routes[inService]["deliveryText"])

						if distance <= 1 and inSeconds <= 0 and IsControlJustPressed(1,38) then
							inSeconds = 3

							if routes[inService]["deliveryVehicle"] ~= nil then
								local vehicle = GetLastDrivenVehicle()
								local vehHash = routes[inService]["deliveryVehicle"]

								if IsVehicleModel(vehicle,vehHash) then
									if vSERVER.deliveryConsume(inService) then
										inDelivery = math.random(#routes[inService]["deliveryCoords"])
										makeDeliveryMarked(routes[inService]["deliveryCoords"][inDelivery][1],routes[inService]["deliveryCoords"][inDelivery][2],routes[inService]["deliveryCoords"][inDelivery][3])
									end
								else
									TriggerEvent("Notify",false,"amarelo","Precisa utilizar o veículo do <b>"..inService.."</b>.",3000)
								end
							else
								if vSERVER.deliveryConsume(inService) then
									inDelivery = math.random(#routes[inService]["deliveryCoords"])
									makeDeliveryMarked(routes[inService]["deliveryCoords"][inDelivery][1],routes[inService]["deliveryCoords"][inDelivery][2],routes[inService]["deliveryCoords"][inDelivery][3])
								end
							end
						end
					end
				end
			end
		end

		Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSECONDS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		if inSeconds > 0 then
			inSeconds = inSeconds - 1
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSECONDS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.updateRoutes(status)
	routes = status
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	local onScreen,_x,_y = GetScreenCoordFromWorldCoord(x,y,z)

	if onScreen then
		BeginTextCommandDisplayText("STRING")
		AddTextComponentSubstringKeyboardDisplay(text)
		SetTextColour(255,255,255,150)
		SetTextScale(0.35,0.35)
		SetTextFont(4)
		SetTextCentre(1)
		EndTextCommandDisplayText(_x,_y)

		local width = string.len(text) / 160 * 0.45
		DrawRect(_x,_y + 0.0125,width,0.03,15,15,15,175)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAKECOLLECTMARKED
-----------------------------------------------------------------------------------------------------------------------------------------
function makeCollectMarked(x,y,z)
	if DoesBlipExist(blipCollect) then
		RemoveBlip(blipCollect)
		blipCollect = nil
	end

	if inService then
		blipCollect = AddBlipForCoord(x,y,z)
		SetBlipSprite(blipCollect,12)
		SetBlipColour(blipCollect,2)
		SetBlipScale(blipCollect,0.9)
		SetBlipRoute(blipCollect,true)
		SetBlipAsShortRange(blipCollect,true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Coletar")
		EndTextCommandSetBlipName(blipCollect)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAKEDELIVERYMARKED
-----------------------------------------------------------------------------------------------------------------------------------------
function makeDeliveryMarked(x,y,z)
	if DoesBlipExist(blipDelivery) then
		RemoveBlip(blipDelivery)
		blipDelivery = nil
	end

	if inService then
		blipDelivery = AddBlipForCoord(x,y,z)
		SetBlipSprite(blipDelivery,12)
		SetBlipColour(blipDelivery,5)
		SetBlipScale(blipDelivery,0.9)
		SetBlipRoute(blipDelivery,true)
		SetBlipAsShortRange(blipDelivery,true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Entregar")
		EndTextCommandSetBlipName(blipDelivery)
	end
end