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
Kaduzera = {}
Tunnel.bindInterface("survival",Kaduzera)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Death = false
local DeathTimer = 300
local Cooldown = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999

		if LocalPlayer["state"]["Active"] then
			local Ped = PlayerPedId()
			if GetEntityHealth(Ped) <= 100 then
				if not Death then
					Death = true

					local Coords = GetEntityCoords(Ped)
					NetworkResurrectLocalPlayer(Coords,0.0)

					SetFacialIdleAnimOverride(Ped,"mood_sleeping_1",0)
					LocalPlayer["state"]:set("Invincible",true,false)
					NetworkSetFriendlyFireOption(false)
					SetEntityInvincible(Ped,true)
					SetEntityHealth(Ped,100)
					DeathTimer = 300

					TriggerEvent("hud:RemoveHood")
					TriggerEvent("hud:ScubaRemove")
					TriggerEvent("radio:RadioClean")
					TriggerServerEvent("inventory:Cancel")
					TriggerServerEvent("paramedic:bloodDeath")
					exports["pma-voice"]:Mute(true)

					SendNUIMessage({ name = "Open", payload = true })
					vRP.playAnim(false,{"dead","dead_a"},true)
					TriggerEvent("inventory:preventWeapon")
					TriggerEvent("hud:Active",false)
					TriggerEvent("inventory:Close")
				--	exports["smartphone"]:close()
				else
					TimeDistance = 1
					SetEntityHealth(Ped,100)

					DisableControlAction(0,18,true)
					DisableControlAction(0,22,true)
					DisableControlAction(0,24,true)
					DisableControlAction(0,25,true)
					DisableControlAction(0,68,true)
					DisableControlAction(0,70,true)
					DisableControlAction(0,91,true)
					DisableControlAction(0,69,true)
					DisableControlAction(0,75,true)
					DisableControlAction(0,140,true)
					DisableControlAction(0,142,true)
					DisableControlAction(0,257,true)
					DisablePlayerFiring(Ped,true)

					if GetGameTimer() >= Cooldown then
						Cooldown = GetGameTimer() + 1000

						if DeathTimer > 0 then
							DeathTimer = DeathTimer - 1
							SendNUIMessage({ name = "Update", payload = DeathTimer })
						end
					end

					if not IsEntityPlayingAnim(Ped,"dead","dead_a",3) and not IsPedInAnyVehicle(Ped) then
						TaskPlayAnim(Ped,"dead","dead_a",8.0,8.0,-1,1,1,0,0,0)
					end

					if IsPedInAnyVehicle(Ped) then
						local Vehicle = GetVehiclePedIsUsing(Ped)
						if GetPedInVehicleSeat(Vehicle,-1) == Ped then
							SetVehicleEngineOn(Vehicle,false,true,true)
						end
					end
				end
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKDEATH
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.CheckDeath()
	if Death and DeathTimer <= 0 then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEATHTIMER
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.DeathTimer()
	return DeathTimer
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Respawn()
	Death = false
	DeathTimer = 300

	ClearPedTasks(PlayerPedId())
	NetworkSetFriendlyFireOption(true)
	ClearPedBloodDamage(PlayerPedId())
	SetEntityHealth(PlayerPedId(),200)
	SetEntityInvincible(PlayerPedId(),false)
	ClearFacialIdleAnimOverride(PlayerPedId())
	LocalPlayer["state"]:set("Invincible",false,false)

	TriggerEvent("paramedic:Reset")
	TriggerEvent("inventory:CleanWeapons")
	LocalPlayer["state"]:set("Handcuff",false,true)
	exports["pma-voice"]:Mute(false)

	DoScreenFadeOut(0)
	TriggerEvent("hud:Active",true)
	SetEntityHeading(PlayerPedId(),158.75)
	SendNUIMessage({ name = "Open", payload = false })
	SetEntityCoords(PlayerPedId(),-1192.2,-1513.12,4.36)

	SetTimeout(1000,function()
		DoScreenFadeIn(1000)
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REVIVE
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Revive",function(Health)
	local Ped = PlayerPedId()

	SetEntityHealth(Ped,Health)
	SetEntityInvincible(Ped,false)
	LocalPlayer["state"]:set("Invincible",false,false)

	if Death then
		Death = false
		DeathTimer = 300

		ClearPedTasks(Ped)
		ClearFacialIdleAnimOverride(Ped)
		NetworkSetFriendlyFireOption(true)

		TriggerEvent("hud:Active",true)
		SendNUIMessage({ name = "Open", payload = false })

		exports["pma-voice"]:Mute(false)
		TriggerEvent("paramedic:Reset")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REVIVE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Revive(Health)
	exports["survival"]:Revive(Health)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SURVIVAL:DeathLogin
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("survival:DeathLogin")
AddEventHandler("survival:DeathLogin",function()
	DeathTimer = 240
end)