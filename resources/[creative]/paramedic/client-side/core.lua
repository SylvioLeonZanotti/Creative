-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Kaduzera = {}
Tunnel.bindInterface("paramedic",Kaduzera)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Damaged = {}
local Bleeding = 0
local BloodTick = 0
local Injuried = GetGameTimer()
local BloodTimers = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- GAMEEVENTTRIGGERED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("gameEventTriggered",function(name,Message)
	if LocalPlayer["state"]["Route"] < 900000 then
		if name == "CEventNetworkEntityDamage" then
			if PlayerPedId() == Message[1] and LocalPlayer["state"]["Active"] then
				if GetGameTimer() >= Injuried then
					if not IsPedInAnyVehicle(Message[1]) and GetEntityHealth(Message[1]) > 100 then
						Injuried = GetGameTimer() + 1000

						local Hit,Mark = GetPedLastDamageBone(Message[1])
						if Hit and not Damaged[Mark] and Mark ~= 0 then
							TriggerServerEvent("evidence:dropEvidence","yellow")
							Bleeding = Bleeding + 1
							Damaged[Mark] = true
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:RESET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("paramedic:Reset")
AddEventHandler("paramedic:Reset",function()
	Damaged = {}
	Bleeding = 0
	BloodTick = 0
	Injuried = GetGameTimer()
	BloodTimers = GetGameTimer()
	ClearPedBloodDamage(PlayerPedId())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLEEDING
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Bleeding()
	return Bleeding
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANDAGE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Bandage()
	local Humanes = ""
	for Number,_ in pairs(Damaged) do
		TriggerEvent("Notify","amarelo","Passou ataduras no(a) <b>"..Bone(Number).."</b>.",3000)
		TriggerEvent("sounds:Private","bandage",0.5)
		Bleeding = Bleeding - 1
		Humanes = Bone(Number)
		Damaged[Number] = nil
		BloodTick = 0
		break
	end

	if Bleeding <= 0 then
		ClearPedBloodDamage(PlayerPedId())
	end

	return Humanes
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:INJURIES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("paramedic:Injuries")
AddEventHandler("paramedic:Injuries",function()
	local Wounds = 0
	local Injuries = ""
	local Damages = false

	for Number,_ in pairs(Damaged) do
		if not Damages then
			Injuries = Injuries.."<b>Danos Superficiais:</b><br>"
			Damages = true
		end

		Wounds = Wounds + 1
		Injuries = Injuries.."<b>"..Wounds.."</b>: "..Bone(Number).."<br>"
	end

	if Injuries == "" then
		TriggerEvent("Notify","amarelo","Nenhum ferimento encontrado.",5000)
	else
		TriggerEvent("Notify","amarelo",Injuries,10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIAGNOSTIC
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Diagnostic()
	return Damaged,Bleeding
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARMS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Arms",function()
	if Damaged[18905] or Damaged[18905] or Damaged[60309] or Damaged[36029] or Damaged[57005] or Damaged[28422] or Damaged[6286] then
		return true
	end

	return false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LEGS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Legs",function()
	if Damaged[14201] or Damaged[65245] or Damaged[57717] or Damaged[52301] or Damaged[35502] or Damaged[24806] then
		return true
	end

	return false
end)