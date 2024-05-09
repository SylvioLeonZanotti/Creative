-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local OpenMenu = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHCONTROL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("vehControl",function(source,args)
	if not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not IsPauseMenuActive() then
		local Ped = PlayerPedId()
		if not IsEntityInWater(Ped) and GetEntityHealth(Ped) > 101 then
			local Vehicle = vRP.ClosestVehicle(7)
			if Vehicle then
				SendNUIMessage({ show = true })
				SetCursorLocation(0.5,0.8)
				SetNuiFocus(true,true)
				OpenMenu = true
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHCONTROL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("vehControl","Abrir o menu rapido.","keyboard","f4")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSESYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeSystem",function(data)
	SendNUIMessage({ show = false })
	SetCursorLocation(0.5,0.5)
	SetNuiFocus(false,false)
	OpenMenu = false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MENUACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("menuActive",function(data)
	local Ped = PlayerPedId()
	if GetVehiclePedIsTryingToEnter(Ped) <= 0 then
		if data["active"] == "door1" then
			TriggerServerEvent("player:Doors","1")
		elseif data["active"] == "door2" then
			TriggerServerEvent("player:Doors","2")
		elseif data["active"] == "door3" then
			TriggerServerEvent("player:Doors","3")
		elseif data["active"] == "door4" then
			TriggerServerEvent("player:Doors","4")
		elseif data["active"] == "trunk" then
			TriggerServerEvent("player:Doors","5")
		elseif data["active"] == "hood" then
			TriggerServerEvent("player:Doors","6")
		elseif data["active"] == "vtuning" then
			TriggerEvent("engine:Vehrify")

			SendNUIMessage({ show = false })
			SetCursorLocation(0.5,0.5)
			SetNuiFocus(false,false)
			OpenMenu = false
		end
	end
end)