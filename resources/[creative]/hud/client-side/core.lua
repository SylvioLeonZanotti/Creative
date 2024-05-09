-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPS = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Hensa = {}
Tunnel.bindInterface("hud",Hensa)
vSERVER = Tunnel.getInterface("hud")
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
Display = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Road = ""
local Gemstone = 0
local Crossing = ""
local Hood = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRINCIPAL
-----------------------------------------------------------------------------------------------------------------------------------------
local Health = 999
local Armour = 999
-----------------------------------------------------------------------------------------------------------------------------------------
-- THIRST
-----------------------------------------------------------------------------------------------------------------------------------------
local Thirst = 999
local ThirstTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
local Hunger = 999
local HungerTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- STRESS
-----------------------------------------------------------------------------------------------------------------------------------------
local Stress = 999
local StressTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- WANTED
-----------------------------------------------------------------------------------------------------------------------------------------
local Wanted = 0
local WantedTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPOSED
-----------------------------------------------------------------------------------------------------------------------------------------
local Reposed = 0
local ReposedTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- LUCK
-----------------------------------------------------------------------------------------------------------------------------------------
local Luck = 0
local LuckTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEXTERITY
-----------------------------------------------------------------------------------------------------------------------------------------
local Dexterity = 0
local DexterityTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMER
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		if LocalPlayer["state"]["Active"] then
			local Ped = PlayerPedId()

			if IsPauseMenuActive() then
				SendNUIMessage({ name = "Body", payload = false })
			else
				if Display then
					SendNUIMessage({ name = "Body", payload = true })

					local Coords = GetEntityCoords(Ped)
					local Armouring = GetPedArmour(Ped)
					local Healing = GetEntityHealth(Ped)
					local MinRoad,MinCross = GetStreetNameAtCoord(Coords["x"],Coords["y"],Coords["z"])
					local FullRoad = GetStreetNameFromHashKey(MinRoad)
					local FullCross = GetStreetNameFromHashKey(MinCross)

					if Health ~= Healing then
						if Healing < 0 then
							Healing = 0
						end

						SendNUIMessage({ name = "Health", payload = Healing - 100 })
						Health = Healing
					end

					if Armour ~= Armouring then
						SendNUIMessage({ name = "Armour", payload = Armouring })
						Armour = Armouring
					end

					if FullRoad ~= "" and Road ~= FullRoad then
						SendNUIMessage({ name = "Road", payload = FullRoad })
						Road = FullRoad
					end

					if FullCross ~= "" and Crossing ~= FullCross then
						SendNUIMessage({ name = "Crossing", payload = FullCross })
						Crossing = FullCross
					end

					SendNUIMessage({ name = "Clock", payload = { GlobalState["Hours"], GlobalState["Minutes"] } })
				end
			end

			if Luck > 0 and LuckTimer <= GetGameTimer() then
				Luck = Luck - 1
				LuckTimer = GetGameTimer() + 1000
				SendNUIMessage({ name = "Luck", payload = Luck })
			end

			if Dexterity > 0 and DexterityTimer <= GetGameTimer() then
				Dexterity = Dexterity - 1
				DexterityTimer = GetGameTimer() + 1000
				SendNUIMessage({ name = "Dexterity", payload = Dexterity })
			end

			if Wanted > 0 and WantedTimer <= GetGameTimer() then
				Wanted = Wanted - 1
				WantedTimer = GetGameTimer() + 1000
				SendNUIMessage({ name = "Wanted", payload = Wanted })
			end

			if Reposed > 0 and ReposedTimer <= GetGameTimer() then
				Reposed = Reposed - 1
				ReposedTimer = GetGameTimer() + 1000
				SendNUIMessage({ name = "Reposed", payload = Reposed })
			end

			if HungerTimer <= GetGameTimer() then
				HungerTimer = GetGameTimer() + 60000

				if Hunger < 10 and GetEntityHealth(Ped) > 100 then
					ApplyDamageToPed(Ped,math.random(2),false)
					TriggerEvent("Notify","hunger","Sofrendo de fome.",2500)
				end
			end

			if ThirstTimer <= GetGameTimer() then
				ThirstTimer = GetGameTimer() + 60000

				if Thirst < 10 and GetEntityHealth(Ped) > 100 then
					ApplyDamageToPed(Ped,math.random(2),false)
					TriggerEvent("Notify","thirst","Sofrendo de sede.",2500)
				end
			end

			if Stress >= 65 and StressTimer <= GetGameTimer() then
				StressTimer = GetGameTimer() + 10000

				AnimpostfxPlay("MenuMGIn")
				SetTimeout(2500,function()
					AnimpostfxStop("MenuMGIn")
					TriggerEvent("Notify","amarelo","Sofrendo de Stress.",4000)
				end)
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDSTATEBAGCHANGEHANDLER:PASSPORT
-----------------------------------------------------------------------------------------------------------------------------------------
AddStateBagChangeHandler("Passport",("player:%s"):format(LocalPlayer["state"]["Player"]),function(Name,Key,Value)
	SendNUIMessage({ name = "Passport", payload = Value })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDSTATEBAGCHANGEHANDLER:INSAFEZONE
-----------------------------------------------------------------------------------------------------------------------------------------
AddStateBagChangeHandler("SafeZone",("player:%s"):format(LocalPlayer["state"]["Player"]),function(Name,Key,Value)
	SendNUIMessage({ name = "Safezone", payload = (Value or LocalPlayer["state"]["Safezone"] or false) or false })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:VOIP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Voip")
AddEventHandler("hud:Voip",function(Number)
	local Target = { "Baixo","Normal","Médio","Alto","Megafone" }

	SendNUIMessage({ name = "Voip", payload = Target[Number] })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:VOICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Voice")
AddEventHandler("hud:Voice",function(Status)
	SendNUIMessage({ name = "Voice", payload = Status })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:WANTED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Wanted")
AddEventHandler("hud:Wanted",function(Seconds)
	Wanted = Seconds
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WANTED
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Wanted",function()
	return Wanted > 0 and true or false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:REPOSED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Reposed")
AddEventHandler("hud:Reposed",function(Seconds)
	Reposed = Seconds
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPOSED
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Reposed",function()
	return Reposed > 0 and true or false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:ACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("hud:Active",function(Status)
	SendNUIMessage({ name = "Body", payload = { Status = Display } })
	Display = Status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hud",function()
	Display = not Display
	SendNUIMessage({ name = "Body", payload = { Display } })

	if not Display then
		if IsMinimapRendering() then
			DisplayRadar(false)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROGRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Progress")
AddEventHandler("Progress",function(Message,Timer)
	SendNUIMessage({ name = "Progress", payload = { Timer } })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MUMBLECONNECTED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("mumbleConnected",function()
	SendNUIMessage({ name = "Voip", payload = "Online" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MUMBLEDISCONNECTED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("mumbleDisconnected",function()
	SendNUIMessage({ name = "Voip", payload = "Offline" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:THIRST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Thirst")
AddEventHandler("hud:Thirst",function(Number)
	if Thirst ~= Number then
		SendNUIMessage({ name = "Thirst", payload = Number })
		Thirst = Number
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:HUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Hunger")
AddEventHandler("hud:Hunger",function(Number)
	if Hunger ~= Number then
		SendNUIMessage({ name = "Hunger", payload = Number })
		Hunger = Number
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:STRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Stress")
AddEventHandler("hud:Stress",function(Number)
	if Stress ~= Number then
		SendNUIMessage({ name = "Stress", payload = Number })
		Stress = Number
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:LUCK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Luck")
AddEventHandler("hud:Luck",function(Seconds)
	Luck = Seconds
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:DEXTERITY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Dexterity")
AddEventHandler("hud:Dexterity",function(Seconds)
	Dexterity = Seconds
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:TOGGLEHOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:toggleHood")
AddEventHandler("hud:toggleHood",function()
	Hood = not Hood

	if Hood then
		SetPedComponentVariation(PlayerPedId(),1,69,0,1)
	else
		SetPedComponentVariation(PlayerPedId(),1,0,0,1)
	end

	SendNUIMessage({ Action = "Hood", Status = Hood })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:REMOVEHOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:RemoveHood")
AddEventHandler("hud:RemoveHood",function()
	if Hood then
		Hood = false
		SendNUIMessage({ Action = "Hood", Status = Hood })
		SetPedComponentVariation(PlayerPedId(),1,0,0,1)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:ADDGEMSTONE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:AddGems")
AddEventHandler("hud:AddGems",function(Number)
	Gemstone = Gemstone + Number

	SendNUIMessage({ name = "Gemstone", payload = Gemstone })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:REMOVEGEMSTONE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:RemoveGems")
AddEventHandler("hud:RemoveGems",function(Number)
	Gemstone = Gemstone - Number

	if Gemstone < 0 then
		Gemstone = 0
	end

	SendNUIMessage({ name = "Gemstone", payload = Gemstone })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:RADIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Radio")
AddEventHandler("hud:Radio",function(Frequency)
	if type(Frequency) == "number" then
		SendNUIMessage({ name = "Frequency", payload = Frequency })
	else
		SendNUIMessage({ name = "Frequency", payload = Frequency })
	end
end)

exports("handleTimeSync", function(bool)
	if bool == true then
		SetWeatherTypeNow("CLEAR")
		SetWeatherTypePersist("CLEAR")
		SetWeatherTypeNowPersist("CLEAR")
	end

	shouldSync = bool
end)