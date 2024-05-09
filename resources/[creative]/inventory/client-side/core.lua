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
Tunnel.bindInterface("inventory",Kaduzera)
vGARAGE = Tunnel.getInterface("garages")
vSERVER = Tunnel.getInterface("inventory")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Drops = {}
local Types = ""
local Weapon = ""
local UseSlots = 1
local Actived = false
local Backpack = false
local TakeWeapon = false
local StoreWeapon = false
local Reloaded = GetGameTimer()
local UseCooldown = GetGameTimer()
LocalPlayer["state"]["Buttons"] = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:CANCEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Cancel")
AddEventHandler("inventory:Cancel",function()
	vSERVER.Cancel()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:VERIFYOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:VerifyObjects")
AddEventHandler("inventory:VerifyObjects",function(Entity,Service)
	vSERVER.VerifyObjects(Entity,Service)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:LOOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Loot")
AddEventHandler("inventory:Loot",function(Entity,Service)
	vSERVER.Loot(Entity,Service)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:STEALTRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:StealTrunk")
AddEventHandler("inventory:StealTrunk",function(Entity)
	vSERVER.StealTrunk(Entity)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:ANIMALS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Animals")
AddEventHandler("inventory:Animals",function(Entity,Service)
	vSERVER.Animals(Entity,Service)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:STOREOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:StoreObjects")
AddEventHandler("inventory:StoreObjects",function(Number)
	vSERVER.StoreObjects(Number)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:MAKEPRODUCTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:MakeProducts")
AddEventHandler("inventory:MakeProducts",function(Service)
	vSERVER.MakeProducts(Service)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:DISMANTLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Dismantle")
AddEventHandler("inventory:Dismantle",function(Entity)
	vSERVER.Dismantle(Entity)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:REMOVETYRES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:RemoveTyres")
AddEventHandler("inventory:RemoveTyres",function(Entity)
	vSERVER.RemoveTyres(Entity)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:CLEANWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:CleanWeapons")
AddEventHandler("inventory:CleanWeapons",function(Create)
	if Weapon ~= "" then
		if Create and UseSlots <= 5 then
			TriggerEvent("inventory:CreateWeapon",Weapon)
		end

		RemoveAllPedWeapons(PlayerPedId(),true)
	end

	TriggerEvent("hud:Weapon",false)
	TriggerEvent("Weapon","")
	Actived = false
	Weapon = ""
	Types = ""
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBLOCKBUTTONS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		local Ped = PlayerPedId()

		if LocalPlayer["state"]["Buttons"] then
			TimeDistance = 1
			DisableControlAction(1,75,true)
			DisableControlAction(1,47,true)
			DisableControlAction(1,257,true)
			DisablePlayerFiring(Ped,true)
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Close")
AddEventHandler("inventory:Close",function()
	if Backpack then
		Backpack = false
		SetNuiFocus(false,false)
		SetCursorLocation(0.5,0.5)
		SendNUIMessage({ action = "hideMenu" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("invClose",function(Data,Callback)
	TriggerEvent("inventory:Close")

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Craft",function(Data,Callback)
	Backpack = false
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hideMenu" })

	TriggerEvent("crafting:openSource")

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELIVER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Deliver",function(Data,Callback)
	vSERVER.Deliver(Data["slot"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Trash",function(Data,Callback)
	vSERVER.Trash(Data["slot"],Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:SLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Slot")
AddEventHandler("inventory:Slot",function(Number,Amount)
	UseSlots = parseInt(Number)
	vSERVER.UseItem(Number,Amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- USEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("useItem",function(Data,Callback)
	if GetGameTimer() >= UseCooldown then
		TriggerEvent("inventory:Slot",Data["slot"],Data["amount"])
		UseCooldown = GetGameTimer() + 1000
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SENDITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("sendItem",function(Data,Callback)
	vSERVER.SendItem(Data["slot"],Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot",function(Data,Callback)
	vRPS.invUpdate(Data["slot"],Data["target"],Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Update")
AddEventHandler("inventory:Update",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:VERIFYWEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:verifyWeapon")
AddEventHandler("inventory:verifyWeapon",function(Item)
	local Split = splitString(Item,"-")
	local Name = Split[1]

	if Weapon == Name then
		local Ped = PlayerPedId()
		local Ammo = GetAmmoInPedWeapon(Ped,Weapon)
		if not vSERVER.verifyWeapon(Weapon,Ammo) then
			TriggerEvent("inventory:CleanWeapons",false)
		end
	else
		if Weapon == "" then
			vSERVER.verifyWeapon(Name)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:PREVENTWEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:preventWeapon")
AddEventHandler("inventory:preventWeapon",function()
	if Weapon ~= "" then
		local Ped = PlayerPedId()
		local Ammo = GetAmmoInPedWeapon(Ped,Weapon)

		TriggerEvent("inventory:CreateWeapon",Weapon)
		vSERVER.preventWeapon(Weapon,Ammo)
		TriggerEvent("hud:Weapon",false)
		RemoveAllPedWeapons(Ped,true)
		TriggerEvent("Weapon","")

		Actived = false
		Weapon = ""
		Types = ""
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENBACKPACK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("openBackpack",function()
	if not IsPauseMenuActive() and GetEntityHealth(PlayerPedId()) > 100 and not LocalPlayer["state"]["Buttons"] and not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not IsPlayerFreeAiming(PlayerId()) then
		Backpack = true
		SetNuiFocus(true,true)
		SetCursorLocation(0.5,0.5)
		SendNUIMessage({ action = "showMenu" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KEYMAPPING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("openBackpack","Manusear a mochila.","keyboard","OEM_3")
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPAIRENGINE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:repairEngine")
AddEventHandler("inventory:repairEngine",function(Index,Plate)
	if NetworkDoesNetworkIdExist(Index) then
		local Vehicle = NetToEnt(Index)
		if DoesEntityExist(Vehicle) then
			if GetVehicleNumberPlateText(Vehicle) == Plate then
				local Tyres = {}

				for i = 0,7 do
					local Status = false

					if GetTyreHealth(Vehicle,i) ~= 1000.0 then
						Status = true
					end

					Tyres[i] = Status
				end

				local Fuel = GetVehicleFuelLevel(Vehicle)

				SetVehicleEngineHealth(Vehicle,1000.0)
				SetVehiclePetrolTankHealth(Vehicle,1000.0)

				SetVehicleFuelLevel(Vehicle,Fuel)

				for Tyre,Burst in pairs(Tyres) do
					if Burst then
						SetVehicleTyreBurst(Vehicle,Tyre,true,1000.0)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPAIRVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:repairVehicle")
AddEventHandler("inventory:repairVehicle",function(Index,Plate)
	if NetworkDoesNetworkIdExist(Index) then
		local Vehicle = NetToEnt(Index)
		if DoesEntityExist(Vehicle) then
			if GetVehicleNumberPlateText(Vehicle) == Plate then
				local vehTyres = {}

				for i = 0,7 do
					local Status = false

					if GetTyreHealth(Vehicle,i) ~= 1000.0 then
						Status = true
					end

					vehTyres[i] = Status
				end

				local Fuel = GetVehicleFuelLevel(Vehicle)

				SetVehicleFixed(Vehicle)
				SetVehicleDeformationFixed(Vehicle)

				SetVehicleFuelLevel(Vehicle,Fuel)

				for Tyre,Burst in pairs(vehTyres) do
					if Burst then
						SetVehicleTyreBurst(Vehicle,Tyre,true,1000.0)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:REPAIRTYRE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:repairTyre")
AddEventHandler("inventory:repairTyre",function(Vehicle,Tyres,Plate)
	if NetworkDoesNetworkIdExist(Vehicle) then
		local Vehicle = NetToEnt(Vehicle)
		if DoesEntityExist(Vehicle) then
			if GetVehicleNumberPlateText(Vehicle) == Plate then
				for i = 0,7 do
					if GetTyreHealth(Vehicle,i) ~= 1000.0 then
						SetVehicleTyreBurst(Vehicle,i,true,1000.0)
					end
				end

				SetVehicleTyreFixed(Vehicle,Tyres)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPAIRPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:repairPlayer")
AddEventHandler("inventory:repairPlayer",function(Index,Plate)
	if NetworkDoesNetworkIdExist(Index) then
		local Vehicle = NetToEnt(Index)
		if DoesEntityExist(Vehicle) then
			if GetVehicleNumberPlateText(Vehicle) == Plate then
				SetVehicleEngineHealth(Vehicle,1000.0)
				SetVehicleBodyHealth(Vehicle,1000.0)
				SetEntityHealth(Vehicle,1000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPAIRADMIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:repairAdmin")
AddEventHandler("inventory:repairAdmin",function(Index,Plate)
	if NetworkDoesNetworkIdExist(Index) then
		local Vehicle = NetToEnt(Index)
		if DoesEntityExist(Vehicle) then
			if GetVehicleNumberPlateText(Vehicle) == Plate then
				local Fuel = GetVehicleFuelLevel(Vehicle)

				SetVehicleFixed(Vehicle)
				SetVehicleDeformationFixed(Vehicle)

				SetVehicleFuelLevel(Vehicle,Fuel)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEALARM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:vehicleAlarm")
AddEventHandler("inventory:vehicleAlarm",function(Index,Plate)
	if NetworkDoesNetworkIdExist(Index) then
		local Vehicle = NetToEnt(Index)
		if DoesEntityExist(Vehicle) then
			if GetVehicleNumberPlateText(Vehicle) == Plate then
				SetVehicleAlarm(Vehicle,true)
				StartVehicleAlarm(Vehicle)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARACHUTE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.parachuteColors()
	local Ped = PlayerPedId()
	GiveWeaponToPed(Ped,"GADGET_PARACHUTE",1,false,true)
	SetPedParachuteTintIndex(Ped,math.random(7))
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FISHINGCOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Fishing()
	local Ped = PlayerPedId()
	local Coords = GetEntityCoords(Ped)
	local Fishings = vec3(-1227.49,4389.84,5.12)

	if #(Coords - Fishings) <= 150 then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FISHINGANIM
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.fishingAnim()
	local Ped = PlayerPedId()
	if IsEntityPlayingAnim(Ped,"amb@world_human_stand_fishing@idle_a","idle_c",3) then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMALANIM
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.animalAnim()
	local Ped = PlayerPedId()
	if IsEntityPlayingAnim(Ped,"anim@gangops@facility@servers@bodysearch@","player_search",3) then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RETURNWEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.returnWeapon()
	if Weapon ~= "" then
		return Weapon
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKWEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.checkWeapon(Hash)
	if Weapon == Hash then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEAPONATTACHS
-----------------------------------------------------------------------------------------------------------------------------------------
local weaponAttachs = {
	["attachsFlashlight"] = {
		["WEAPON_PISTOL"] = "COMPONENT_AT_PI_FLSH",
		["WEAPON_PISTOL_MK2"] = "COMPONENT_AT_PI_FLSH_02",
		["WEAPON_APPISTOL"] = "COMPONENT_AT_PI_FLSH",
		["WEAPON_HEAVYPISTOL"] = "COMPONENT_AT_PI_FLSH",
		["WEAPON_MICROSMG"] = "COMPONENT_AT_PI_FLSH",
		["WEAPON_SNSPISTOL_MK2"] = "COMPONENT_AT_PI_FLSH_03",
		["WEAPON_PISTOL50"] = "COMPONENT_AT_PI_FLSH",
		["WEAPON_COMBATPISTOL"] = "COMPONENT_AT_PI_FLSH",
		["WEAPON_CARBINERIFLE"] = "COMPONENT_AT_AR_FLSH",
		["WEAPON_CARBINERIFLE_MK2"] = "COMPONENT_AT_AR_FLSH",
		["WEAPON_BULLPUPRIFLE"] = "COMPONENT_AT_AR_FLSH",
		["WEAPON_BULLPUPRIFLE_MK2"] = "COMPONENT_AT_AR_FLSH",
		["WEAPON_SPECIALCARBINE"] = "COMPONENT_AT_AR_FLSH",
		["WEAPON_SPECIALCARBINE_MK2"] = "COMPONENT_AT_AR_FLSH",
		["WEAPON_PUMPSHOTGUN"] = "COMPONENT_AT_AR_FLSH",
		["WEAPON_PUMPSHOTGUN_MK2"] = "COMPONENT_AT_AR_FLSH",
		["WEAPON_SMG"] = "COMPONENT_AT_AR_FLSH",
		["WEAPON_SMG_MK2"] = "COMPONENT_AT_AR_FLSH",
		["WEAPON_ASSAULTRIFLE"] = "COMPONENT_AT_AR_FLSH",
		["WEAPON_ASSAULTRIFLE_MK2"] = "COMPONENT_AT_AR_FLSH",
		["WEAPON_ASSAULTSMG"] = "COMPONENT_AT_AR_FLSH"
	},
	["attachsCrosshair"] = {
		["WEAPON_PISTOL_MK2"] = "COMPONENT_AT_PI_RAIL",
		["WEAPON_SNSPISTOL_MK2"] = "COMPONENT_AT_PI_RAIL_02",
		["WEAPON_MICROSMG"] = "COMPONENT_AT_SCOPE_MACRO",
		["WEAPON_CARBINERIFLE"] = "COMPONENT_AT_SCOPE_MEDIUM",
		["WEAPON_CARBINERIFLE_MK2"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
		["WEAPON_BULLPUPRIFLE"] = "COMPONENT_AT_SCOPE_SMALL",
		["WEAPON_BULLPUPRIFLE_MK2"] = "COMPONENT_AT_SCOPE_MACRO_02_MK2",
		["WEAPON_SPECIALCARBINE"] = "COMPONENT_AT_SCOPE_MEDIUM",
		["WEAPON_SPECIALCARBINE_MK2"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
		["WEAPON_PUMPSHOTGUN_MK2"] = "COMPONENT_AT_SCOPE_SMALL_MK2",
		["WEAPON_SMG"] = "COMPONENT_AT_SCOPE_MACRO_02",
		["WEAPON_SMG_MK2"] = "COMPONENT_AT_SCOPE_SMALL_SMG_MK2",
		["WEAPON_ASSAULTRIFLE"] = "COMPONENT_AT_SCOPE_MACRO",
		["WEAPON_ASSAULTRIFLE_MK2"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
		["WEAPON_ASSAULTSMG"] = "COMPONENT_AT_SCOPE_MACRO"
	},
	["attachsMagazine"] = {
		["WEAPON_PISTOL"] = "COMPONENT_PISTOL_CLIP_02",
		["WEAPON_PISTOL_MK2"] = "COMPONENT_PISTOL_MK2_CLIP_02",
		["WEAPON_COMPACTRIFLE"] = "COMPONENT_COMPACTRIFLE_CLIP_02",
		["WEAPON_APPISTOL"] = "COMPONENT_APPISTOL_CLIP_02",
		["WEAPON_HEAVYPISTOL"] = "COMPONENT_HEAVYPISTOL_CLIP_02",
		["WEAPON_MACHINEPISTOL"] = "COMPONENT_MACHINEPISTOL_CLIP_02",
		["WEAPON_MICROSMG"] = "COMPONENT_MICROSMG_CLIP_02",
		["WEAPON_MINISMG"] = "COMPONENT_MINISMG_CLIP_02",
		["WEAPON_SNSPISTOL"] = "COMPONENT_SNSPISTOL_CLIP_02",
		["WEAPON_SNSPISTOL_MK2"] = "COMPONENT_SNSPISTOL_MK2_CLIP_02",
		["WEAPON_VINTAGEPISTOL"] = "COMPONENT_VINTAGEPISTOL_CLIP_02",
		["WEAPON_PISTOL50"] = "COMPONENT_PISTOL50_CLIP_02",
		["WEAPON_COMBATPISTOL"] = "COMPONENT_COMBATPISTOL_CLIP_02",
		["WEAPON_CARBINERIFLE"] = "COMPONENT_CARBINERIFLE_CLIP_02",
		["WEAPON_CARBINERIFLE_MK2"] = "COMPONENT_CARBINERIFLE_MK2_CLIP_02",
		["WEAPON_ADVANCEDRIFLE"] = "COMPONENT_ADVANCEDRIFLE_CLIP_02",
		["WEAPON_BULLPUPRIFLE"] = "COMPONENT_BULLPUPRIFLE_CLIP_02",
		["WEAPON_BULLPUPRIFLE_MK2"] = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_02",
		["WEAPON_SPECIALCARBINE"] = "COMPONENT_SPECIALCARBINE_CLIP_02",
		["WEAPON_SPECIALCARBINE_MK2"] = "COMPONENT_SPECIALCARBINE_MK2_CLIP_02",
		["WEAPON_SMG"] = "COMPONENT_SMG_CLIP_02",
		["WEAPON_SMG_MK2"] = "COMPONENT_SMG_MK2_CLIP_02",
		["WEAPON_ASSAULTRIFLE"] = "COMPONENT_ASSAULTRIFLE_CLIP_02",
		["WEAPON_ASSAULTRIFLE_MK2"] = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
		["WEAPON_ASSAULTSMG"] = "COMPONENT_ASSAULTSMG_CLIP_02",
		["WEAPON_GUSENBERG"] = "COMPONENT_GUSENBERG_CLIP_02"
	},
	["attachsSilencer"] = {
		["WEAPON_PISTOL"] = "COMPONENT_AT_PI_SUPP_02",
		["WEAPON_APPISTOL"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_MACHINEPISTOL"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_BULLPUPRIFLE"] = "COMPONENT_AT_AR_SUPP",
		["WEAPON_PUMPSHOTGUN_MK2"] = "COMPONENT_AT_SR_SUPP_03",
		["WEAPON_SMG"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_SMG_MK2"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_CARBINERIFLE"] = "COMPONENT_AT_AR_SUPP",
		["WEAPON_COLTXM177"] = "COMPONENT_COLTXM177_SUPP",
		["WEAPON_ASSAULTSMG"] = "COMPONENT_AT_AR_SUPP_02"
	},
	["attachsGrip"] = {
		["WEAPON_CARBINERIFLE"] = "COMPONENT_AT_AR_AFGRIP",
		["WEAPON_CARBINERIFLE_MK2"] = "COMPONENT_AT_AR_AFGRIP_02",
		["WEAPON_BULLPUPRIFLE_MK2"] = "COMPONENT_AT_MUZZLE_01",
		["WEAPON_SPECIALCARBINE"] = "COMPONENT_AT_AR_AFGRIP",
		["WEAPON_SPECIALCARBINE_MK2"] = "COMPONENT_AT_MUZZLE_01",
		["WEAPON_PUMPSHOTGUN_MK2"] = "COMPONENT_AT_MUZZLE_08",
		["WEAPON_SMG_MK2"] = "COMPONENT_AT_MUZZLE_01",
		["WEAPON_ASSAULTRIFLE"] = "COMPONENT_AT_AR_AFGRIP",
		["WEAPON_ASSAULTRIFLE_MK2"] = "COMPONENT_AT_AR_AFGRIP_02"
	},
	["attachsMuzzleFat"] = {
		["WEAPON_PISTOL_MK2"] = "COMPONENT_AT_PI_COMP",
		["WEAPON_CARBINERIFLE_MK2"] = "COMPONENT_AT_MUZZLE_03",
		["WEAPON_SPECIALCARBINE_MK2"] = "COMPONENT_AT_MUZZLE_03",
		["WEAPON_BULLPUPRIFLE_MK2"] = "COMPONENT_AT_MUZZLE_03",
		["WEAPON_SMG_MK2"] = "COMPONENT_AT_MUZZLE_03",
		["WEAPON_ASSAULTRIFLE_MK2"] = "COMPONENT_AT_MUZZLE_03"
	},
	["attachsBarrel"] = {
		["WEAPON_BULLPUPRIFLE_MK2"] = "COMPONENT_AT_BP_BARREL_02",
		["WEAPON_ASSAULTRIFLE_MK2"] = "COMPONENT_AT_AR_BARREL_02",
		["WEAPON_CARBINERIFLE_MK2"] = "COMPONENT_AT_CR_BARREL_02",
		["WEAPON_SPECIALCARBINE_MK2"] = "COMPONENT_AT_SC_BARREL_02",
		["WEAPON_SMG_MK2"] = "COMPONENT_AT_SB_BARREL_02"
	},
	["attachsMuzzleHeavy"] = {
		["WEAPON_PISTOL_MK2"] = "COMPONENT_AT_PI_COMP",
		["WEAPON_CARBINERIFLE_MK2"] = "COMPONENT_AT_MUZZLE_05",
		["WEAPON_SPECIALCARBINE_MK2"] = "COMPONENT_AT_MUZZLE_05",
		["WEAPON_BULLPUPRIFLE_MK2"] = "COMPONENT_AT_MUZZLE_05",
		["WEAPON_SMG_MK2"] = "COMPONENT_AT_MUZZLE_05",
		["WEAPON_ASSAULTRIFLE_MK2"] = "COMPONENT_AT_MUZZLE_05"
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKATTACHS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.checkAttachs(nameItem,nameWeapon)
	return weaponAttachs[nameItem][nameWeapon]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PUTATTACHS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.putAttachs(nameItem,nameWeapon)
	GiveWeaponComponentToPed(PlayerPedId(),nameWeapon,weaponAttachs[nameItem][nameWeapon])
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PUTWEAPONHANDS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.putWeaponHands(Name,Ammo,Components,Type)
	if not TakeWeapon then
		if not Ammo then
			Ammo = 0
		end

		if Ammo > 0 then
			Actived = true
		end

		TakeWeapon = true
		LocalPlayer["state"]:set("Cancel",true,true)

		local Ped = PlayerPedId()
		if HasPedGotWeapon(Ped,GetHashKey("GADGET_PARACHUTE"),false) then
			RemoveAllPedWeapons(Ped,true)
			Kaduzera.parachuteColors()
		else
			RemoveAllPedWeapons(Ped,true)
		end

		if not IsPedInAnyVehicle(Ped) then
			if LoadAnim("rcmjosh4") then
				TaskPlayAnim(Ped,"rcmjosh4","josh_leadout_cop2",8.0,8.0,-1,48,0,0,0,0)
			end

			Wait(200)

			Weapon = Name
			TriggerEvent("Weapon",Name)
			TriggerEvent("inventory:RemoveWeapon",Name)
			GiveWeaponToPed(Ped,Name,Ammo,false,true)

			Wait(300)

			ClearPedTasks(Ped)
		else
			Weapon = Name
			TriggerEvent("Weapon",Name)
			TriggerEvent("inventory:RemoveWeapon",Name)
			GiveWeaponToPed(Ped,Name,Ammo,false,true)
		end

		if Components then
			for nameItem,_ in pairs(Components) do
				Kaduzera.putAttachs(nameItem,Name)
			end
		end

		if Type then
			Types = Type
		end

		TakeWeapon = false
		LocalPlayer["state"]:set("Cancel",false,true)

		if itemAmmo(Name) then
			TriggerEvent("hud:Weapon",true,Name)
		end

		if vSERVER.dropWeapons(Name) then
			TriggerEvent("inventory:CleanWeapons",true)
		end

		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREWEAPONHANDS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.storeWeaponHands()
	if not StoreWeapon then
		StoreWeapon = true

		local Last = Weapon
		local Ped = PlayerPedId()
		LocalPlayer["state"]:set("Cancel",true,true)

		if not IsPedInAnyVehicle(Ped) then
			if LoadAnim("weapons@pistol@") then
				TaskPlayAnim(Ped,"weapons@pistol@","aim_2_holster",8.0,8.0,-1,48,0,0,0,0)
			end

			Wait(450)

			ClearPedTasks(Ped)
		end

		local Ammos = GetAmmoInPedWeapon(Ped,Weapon)

		StoreWeapon = false
		TriggerEvent("inventory:CleanWeapons",true)
		LocalPlayer["state"]:set("Cancel",false,true)

		return true,Ammos,Last
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEAPONAMMOS
-----------------------------------------------------------------------------------------------------------------------------------------
local weaponAmmos = {
	["WEAPON_PISTOL_AMMO"] = {
		"WEAPON_PISTOL",
		"WEAPON_PISTOL_MK2",
		"WEAPON_PISTOL50",
		"WEAPON_REVOLVER",
		"WEAPON_COMBATPISTOL",
		"WEAPON_APPISTOL",
		"WEAPON_HEAVYPISTOL",
		"WEAPON_SNSPISTOL",
		"WEAPON_SNSPISTOL_MK2",
		"WEAPON_VINTAGEPISTOL"
	},
	["WEAPON_NAIL_AMMO"] = {
		"WEAPON_NAILGUN"
	},
	["WEAPON_RPG_AMMO"] = {
		"WEAPON_RPG"
	},
	["WEAPON_SMG_AMMO"] = {
		"WEAPON_MICROSMG",
		"WEAPON_MINISMG",
		"WEAPON_SMG",
		"WEAPON_SMG_MK2",
		"WEAPON_GUSENBERG",
		"WEAPON_MACHINEPISTOL",
		"WEAPON_ASSAULTSMG",
		"WEAPON_COMPACTRIFLE"
	},
	["WEAPON_RIFLE_AMMO"] = {
		"WEAPON_FNFAL",
		"WEAPON_PARAFAL",
		"WEAPON_COLTXM177",
		"WEAPON_CARBINERIFLE",
		"WEAPON_CARBINERIFLE_MK2",
		"WEAPON_BULLPUPRIFLE",
		"WEAPON_BULLPUPRIFLE_MK2",
		"WEAPON_ADVANCEDRIFLE",
		"WEAPON_TACTICALRIFLE",
		"WEAPON_ASSAULTRIFLE",
		"WEAPON_HEAVYRIFLE",
		"WEAPON_ASSAULTRIFLE_MK2",
		"WEAPON_SPECIALCARBINE",
		"WEAPON_SPECIALCARBINE_MK2"
	},
	["WEAPON_SHOTGUN_AMMO"] = {
		"WEAPON_PUMPSHOTGUN",
		"WEAPON_PUMPSHOTGUN_MK2",
		"WEAPON_SAWNOFFSHOTGUN"
	},
	["WEAPON_MUSKET_AMMO"] = {
		"WEAPON_MUSKET",
		"WEAPON_SAUER"
	},
	["WEAPON_PETROLCAN_AMMO"] = {
		"WEAPON_PETROLCAN"
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- RECHARGECHECK
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.rechargeCheck(ammoType)
	local weaponAmmo = 0
	local weaponHash = nil
	local Ped = PlayerPedId()
	local weaponStatus = false

	if weaponAmmos[ammoType] then
		weaponAmmo = GetAmmoInPedWeapon(Ped,Weapon)

		for _,v in pairs(weaponAmmos[ammoType]) do
			if Weapon == v then
				weaponHash = Weapon
				weaponStatus = true
				break
			end
		end
	end

	return weaponStatus,weaponHash,weaponAmmo
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RECHARGEWEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.rechargeWeapon(Hash,Ammo)
	AddAmmoToPed(PlayerPedId(),Hash,Ammo)
	Actived = true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTOREWEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		if Actived and Weapon ~= "" then
			TimeDistance = 10

			local Ped = PlayerPedId()
			local Ammo = GetAmmoInPedWeapon(Ped,Weapon)

			if GetGameTimer() >= Reloaded and IsPedReloading(Ped) then
				vSERVER.preventWeapon(Weapon,Ammo)
				Reloaded = GetGameTimer() + 100
			end

			if Ammo <= 0 or (Weapon == "WEAPON_PETROLCAN" and Ammo <= 135 and IsPedShooting(Ped)) or IsPedSwimming(Ped) then
				if Types ~= "" then
					vSERVER.removeThrowing(Types)
				else
					vSERVER.preventWeapon(Weapon,Ammo)
				end

				TriggerEvent("inventory:CleanWeapons",true)
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIRECRACKER
-----------------------------------------------------------------------------------------------------------------------------------------
local Firecracker = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKCRACKER
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.checkCracker()
	if GetGameTimer() <= Firecracker then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIRECRACKER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Firecracker")
AddEventHandler("inventory:Firecracker",function()
	if LoadPtfxAsset("scr_indep_fireworks") then
		Firecracker = GetGameTimer() + (5 * 60000)

		local Explosive = 25
		local Ped = PlayerPedId()
		local Coords = GetOffsetFromEntityInWorldCoords(Ped,0.0,0.6,0.0)
		local Progression,Network = vRPS.CreateObject("ind_prop_firework_03",Coords["x"],Coords["y"],Coords["z"])
		if Progression then
			local Entity = LoadNetwork(Network)
			FreezeEntityPosition(Entity,true)
			PlaceObjectOnGroundProperly(Entity)
			SetModelAsNoLongerNeeded("ind_prop_firework_03")

			Wait(8000)

			repeat
				Wait(2000)
				Explosive = Explosive - 1
				UseParticleFxAssetNextCall("scr_indep_fireworks")
				StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst",Coords["x"],Coords["y"],Coords["z"],0.0,0.0,0.0,2.5,false,false,false,false)
			until Explosive <= 0

			TriggerServerEvent("DeleteObject",Network)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKWATER
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.checkWater()
	return IsPedSwimming(PlayerPedId())
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DROPITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("dropItem",function(Data,Callback)
	if not TakeWeapon and not StoreWeapon then
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)
		local _,Z = GetGroundZFor_3dCoord(Coords["x"],Coords["y"],Coords["z"])

		vSERVER.Drops(Data["item"],Data["slot"],Data["amount"],Coords["x"],Coords["y"],Z)
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DROPS:TABLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("drops:Table")
AddEventHandler("drops:Table",function(Table)
	Drops = Table
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DROPS:ADICIONAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("drops:Adicionar")
AddEventHandler("drops:Adicionar",function(Number,Table)
	Drops[Number] = Table
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DROPS:REMOVER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("drops:Remover")
AddEventHandler("drops:Remover",function(Number)
	if Drops[Number] then
		Drops[Number] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DROPS:ATUALIZAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("drops:Atualizar")
AddEventHandler("drops:Atualizar",function(Number,Amount)
	if Drops[Number] then
		Drops[Number]["amount"] = Amount
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADDROPBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		if LocalPlayer["state"]["Route"] < 900000 then
			local Ped = PlayerPedId()
			local Coords = GetEntityCoords(Ped)

			for _,v in pairs(Drops) do
				local Distance = #(Coords - vec3(v["Coords"][1],v["Coords"][2],v["Coords"][3]))
				if Distance <= 50 then
					TimeDistance = 1
					DrawMarker(23,v["Coords"][1],v["Coords"][2],v["Coords"][3] + 0.05,0.0,0.0,0.0,0.0,180.0,0.0,0.15,0.15,0.0,96,10,245,50,0,0,0,0)
					DrawMarker(21,v["Coords"][1],v["Coords"][2],v["Coords"][3] + 0.25,0.0,0.0,0.0,0.0,180.0,0.0,0.20,0.20,0.20,96,10,245,125,0,0,0,1)
				end
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTINVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestInventory",function(Data,Callback)
	local Items = {}

	if LocalPlayer["state"]["Route"] < 900000 then
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)
		local _,Z = GetGroundZFor_3dCoord(Coords["x"],Coords["y"],Coords["z"])

		for Index,v in pairs(Drops) do
			local Distance = #(vec3(Coords["x"],Coords["y"],Z) - vec3(v["Coords"][1],v["Coords"][2],v["Coords"][3]))
			if Distance <= 0.9 then
				local Number = #Items + 1

				Items[Number] = v
				Items[Number]["id"] = Index
			end
		end
	end

	local inventario,invPeso,invMaxpeso = vSERVER.requestInventory()
	if inventario then
		Callback({ inventario = inventario, drop = Items, invPeso = invPeso, invMaxpeso = invMaxpeso })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PICKUPITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("pickupItem",function(Data,Callback)
	vSERVER.Pickup(Data["id"],Data["amount"],Data["target"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WHEELCHAIR
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.wheelChair(Plate)
	local Ped = PlayerPedId()
	local heading = GetEntityHeading(Ped)
	local Coords = GetOffsetFromEntityInWorldCoords(Ped,0.0,0.75,0.0)
	local myVehicle = vGARAGE.ServerVehicle("wheelchair",Coords["x"],Coords["y"],Coords["z"],heading,Plate,0,nil,1000)

	if NetworkDoesNetworkIdExist(myVehicle) then
		local vehicleNet = NetToEnt(myVehicle)
		if NetworkDoesNetworkIdExist(vehicleNet) then
			SetVehicleOnGroundProperly(vehicleNet)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WHEELTREADS
-----------------------------------------------------------------------------------------------------------------------------------------
local Wheelchair = false
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		if IsPedInAnyVehicle(Ped) then
			local Vehicle = GetVehiclePedIsUsing(Ped)
			local Model = GetEntityModel(Vehicle)
			if Model == -1178021069 then
				if not IsEntityPlayingAnim(Ped,"missfinale_c2leadinoutfin_c_int","_leadin_loop2_lester",3) then
					vRP.playAnim(true,{"missfinale_c2leadinoutfin_c_int","_leadin_loop2_lester"},true)
					Wheelchair = true
				end
			end
		else
			if Wheelchair then
				vRP.Destroy("one")
				Wheelchair = false
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARISCANNER
-----------------------------------------------------------------------------------------------------------------------------------------
local scanTable = {}
local initSounds = {}
local SoundScanner = 999
local InitScanner = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- SCANCOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
local scanCoords = {
	{ -1811.94,-968.5,1.72,357.17 },
	{ -1788.29,-958.0,3.35,328.82 },
	{ -1756.9,-942.98,6.91,311.82 },
	{ -1759.97,-910.12,7.58,334.49 },
	{ -1791.44,-904.11,5.12,39.69 },
	{ -1827.87,-900.32,2.48,68.04 },
	{ -1840.76,-882.39,2.81,51.03 },
	{ -1793.4,-819.9,7.73,328.82 },
	{ -1737.69,-791.3,9.44,317.49 },
	{ -1714.6,-784.61,9.82,306.15 },
	{ -1735.88,-757.92,10.11,2.84 },
	{ -1763.22,-764.65,9.49,65.2 },
	{ -1786.23,-782.4,8.71,99.22 },
	{ -1809.5,-798.29,7.89,104.89 },
	{ -1816.35,-827.68,6.44,141.74 },
	{ -1833.23,-856.58,3.52,147.41 },
	{ -1842.88,-869.45,2.98,144.57 },
	{ -1865.34,-858.4,2.12,99.22 },
	{ -1868.01,-835.58,3.0,51.03 },
	{ -1860.76,-810.59,4.04,8.51 },
	{ -1848.85,-790.99,6.3,348.67 },
	{ -1834.31,-767.03,8.17,337.33 },
	{ -1819.3,-742.04,8.85,331.66 },
	{ -1804.76,-713.39,9.76,331.66 },
	{ -1805.32,-695.22,10.23,348.67 },
	{ -1824.32,-685.97,10.23,36.86 },
	{ -1849.16,-699.25,9.45,85.04 },
	{ -1868.9,-716.3,8.86,110.56 },
	{ -1890.07,-736.57,6.27,124.73 },
	{ -1909.8,-759.44,3.52,130.4 },
	{ -1920.19,-782.25,2.8,144.57 },
	{ -1939.84,-765.34,1.99,85.04 },
	{ -1932.96,-746.47,3.05,8.51 },
	{ -1954.69,-722.8,3.03,28.35 },
	{ -1954.53,-688.85,4.06,11.34 },
	{ -1939.8,-651.94,8.74,351.5 },
	{ -1926.48,-627.37,10.67,348.67 },
	{ -1920.73,-615.67,10.95,340.16 },
	{ -1924.48,-596.03,11.56,51.03 },
	{ -1952.53,-597.0,11.02,70.87 },
	{ -1972.12,-609.32,8.73,102.05 },
	{ -1989.01,-629.48,5.21,124.73 },
	{ -2002.97,-659.48,3.03,141.74 },
	{ -2028.03,-658.61,1.82,107.72 },
	{ -2045.57,-637.91,2.02,65.2 },
	{ -2031.42,-618.65,3.23,0.0 },
	{ -2003.74,-603.38,6.3,328.82 },
	{ -1982.79,-588.43,10.01,317.49 },
	{ -1968.4,-565.72,11.42,323.15 },
	{ -1980.98,-545.43,11.58,5.67 },
	{ -1996.36,-552.72,11.68,17.01 },
	{ -2013.33,-573.78,8.95,102.05 },
	{ -2030.05,-604.62,3.93,133.23 },
	{ -2035.79,-626.99,3.0,150.24 },
	{ -2053.05,-626.67,2.31,113.39 },
	{ -2062.58,-596.05,3.03,45.36 },
	{ -2096.8,-579.13,2.75,53.86 },
	{ -2116.49,-559.09,2.29,48.19 },
	{ -2093.8,-539.57,3.74,22.68 },
	{ -2067.11,-526.37,6.98,328.82 },
	{ -2049.71,-516.4,9.13,308.98 },
	{ -2029.87,-507.17,11.49,300.48 },
	{ -2049.27,-492.94,11.17,11.34 },
	{ -2073.38,-483.05,9.13,42.52 },
	{ -2102.99,-470.71,6.52,56.7 },
	{ -2119.62,-451.87,6.67,48.19 },
	{ -2134.43,-460.37,5.24,93.55 },
	{ -1805.06,-936.1,2.53,189.93 },
	{ -1786.4,-932.99,4.38,269.3},
	{ -1744.87,-926.96,7.65,269.3 },
	{ -1763.18,-925.72,6.99,104.89 },
	{ -1773.65,-895.76,7.35,357.17 },
	{ -1750.28,-883.7,7.75,277.8 },
	{ -1733.24,-862.29,8.17,311.82 },
	{ -1703.01,-838.56,9.03,300.48 },
	{ -1720.85,-834.19,8.95,31.19 },
	{ -1747.12,-839.86,8.39,138.9 },
	{ -1764.27,-856.95,7.75,147.41 },
	{ -1776.27,-868.44,7.78,119.06 },
	{ -1803.86,-872.72,5.34,93.55 },
	{ -1744.12,-901.55,7.7,79.38 },
	{ -1765.09,-808.12,8.58,31.19 },
	{ -1773.17,-728.07,10.01,8.51 },
	{ -1849.14,-729.09,8.85,136.07 },
	{ -1866.65,-758.66,6.96,150.24 },
	{ -1886.42,-794.12,3.25,158.75 },
	{ -1795.97,-748.07,9.17,297.64 },
	{ -1915.8,-682.79,8.0,62.37 },
	{ -1911.86,-651.71,10.26,0.0 },
	{ -1899.29,-623.49,11.34,345.83 },
	{ -1847.11,-670.69,10.45,17.01 },
	{ -1874.69,-647.34,10.92,39.69 },
	{ -1958.9,-629.78,8.34,73.71 },
	{ -1951.39,-575.59,11.53,343.0 },
	{ -1991.28,-569.55,10.72,164.41 },
	{ -2056.68,-569.32,4.57,99.22 },
	{ -2088.29,-560.62,3.27,87.88 },
	{ -2042.45,-542.51,8.46,308.98 },
	{ -2020.91,-528.58,11.12,306.15 },
	{ -2092.91,-499.58,5.37,79.38 },
	{ -2113.6,-521.59,2.27,147.41 },
	{ -2139.09,-496.06,2.27,48.19 },
	{ -2122.44,-486.23,3.56,280.63 },
	{ -2034.27,-577.42,6.74,294.81 },
	{ -2003.72,-536.62,11.78,320.32 },
	{ -2023.41,-551.31,9.59,255.12 },
	{ -2014.0,-626.04,3.76,189.93 },
	{ -1967.67,-656.53,5.24,255.12 },
	{ -1878.77,-672.36,9.76,257.96 },
	{ -1827.96,-702.26,9.67,240.95 },
	{ -1855.87,-771.67,6.94,164.41 },
	{ -1846.08,-830.98,3.79,175.75 },
	{ -1830.72,-804.5,6.67,334.49 },
	{ -1770.76,-835.92,7.84,311.82 },
	{ -1724.61,-812.2,9.25,303.31 },
	{ -1828.9,-719.11,9.3,65.2 },
	{ -1893.81,-707.65,7.73,110.56 },
	{ -1921.84,-716.82,5.22,212.6 },
	{ -1891.7,-756.03,4.95,218.27 },
	{ -1890.51,-818.0,2.95,303.31 },
	{ -1806.69,-770.32,8.29,306.15 },
	{ -1763.57,-747.01,9.81,303.31 },
	{ -1980.27,-691.34,3.02,189.93 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:UPDATESCANNER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:updateScanner")
AddEventHandler("inventory:updateScanner",function(Status)
	InitScanner = Status
	SoundScanner = 999
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSCANNER
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		if InitScanner then
			local Ped = PlayerPedId()
			if not IsPedInAnyVehicle(Ped) then
				local Coords = GetEntityCoords(Ped)

				for k,v in pairs(scanTable) do
					local Distance = #(Coords - vec3(v[1],v[2],v[3]))
					if Distance <= 7.25 then
						SoundScanner = 1000

						if not initSounds[k] then
							initSounds[k] = true
						end

						if Distance <= 1.25 then
							TimeDistance = 1
							SoundScanner = 250

							if IsControlJustPressed(1,38) then
								TriggerEvent("inventory:MakeProducts","scanner")

								local rand = math.random(#scanCoords)
								scanTable[k] = scanCoords[rand]
								initSounds[k] = nil
								SoundScanner = 999
							end
						end
					else
						if initSounds[k] then
							initSounds[k] = nil
							SoundScanner = 999
						end
					end
				end
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSCANNERSOUND
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		if InitScanner and (SoundScanner == 1000 or SoundScanner == 250) then
			PlaySoundFrontend(-1,"MP_IDLE_TIMER","HUD_FRONTEND_DEFAULT_SOUNDSET")
		end

		Wait(SoundScanner)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:EXPLODETYRES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:explodeTyres")
AddEventHandler("inventory:explodeTyres",function(Network,Plate,Tyre)
	if NetworkDoesNetworkIdExist(Network) then
		local Vehicle = NetToEnt(Network)
		if DoesEntityExist(Vehicle) then
			if GetVehicleNumberPlateText(Vehicle) == Plate then
				SetVehicleTyreBurst(Vehicle,Tyre,true,1000.0)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TYRELIST
-----------------------------------------------------------------------------------------------------------------------------------------
local tyreList = {
	["wheel_lf"] = 0,
	["wheel_rf"] = 1,
	["wheel_lm"] = 2,
	["wheel_rm"] = 3,
	["wheel_lr"] = 4,
	["wheel_rr"] = 5
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TYRESTATUS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.tyreStatus()
	local Ped = PlayerPedId()
	if not IsPedInAnyVehicle(Ped) then
		local Vehicle = vRP.ClosestVehicle(7)
		if IsEntityAVehicle(Vehicle) then
			local Coords = GetEntityCoords(Ped)

			for Index,Tyre in pairs(tyreList) do
				local Selected = GetEntityBoneIndexByName(Vehicle,Index)
				if Selected ~= -1 then
					local CoordsWheel = GetWorldPositionOfEntityBone(Vehicle,Selected)
					local Distance = #(Coords - CoordsWheel)
					if Distance <= 1.0 then
						return true,Tyre,VehToNet(Vehicle),GetVehicleNumberPlateText(Vehicle)
					end
				end
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TYREHEALTH
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.tyreHealth(Network,Tyre)
	if NetworkDoesNetworkIdExist(Network) then
		local Vehicle = NetToEnt(Network)
		if DoesEntityExist(Vehicle) then
			return GetTyreHealth(Vehicle,Tyre)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOESOBJECTEXIST
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.objectExist(Coords,Hash)
	return DoesObjectOfTypeExistAtCoords(Coords["x"],Coords["y"],Coords["z"],0.35,Hash,true)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ATMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local ATMList = {
	["1"] = { 228.18,338.4,105.56 },
	["2"] = { 158.63,234.22,106.63 },
	["3"] = { -57.67,-92.62,57.78 },
	["4"] = { 356.97,173.54,103.07 },
	["5"] = { -1415.94,-212.03,46.51 },
	["6"] = { -1430.2,-211.08,46.51 },
	["7"] = { -1282.54,-210.9,42.44 },
	["8"] = { -1286.25,-213.44,42.44 },
	["9"] = { -1289.32,-226.82,42.44 },
	["10"] = { -1285.58,-224.28,42.44 },
	["11"] = { -1109.8,-1690.82,4.36 },
	["12"] = { 1686.84,4815.82,42.01 },
	["13"] = { 1701.21,6426.57,32.76 },
	["14"] = { 1822.66,3683.04,34.27 },
	["15"] = { 1171.56,2702.58,38.16 },
	["16"] = { 1172.5,2702.59,38.16 },
	["17"] = { -1091.49,2708.66,18.96 },
	["18"] = { -3144.38,1127.6,20.86 },
	["19"] = { 527.36,-160.69,57.09 },
	["20"] = { 285.45,143.39,104.17 },
	["21"] = { -846.27,-341.28,38.67 },
	["22"] = { -846.85,-340.2,38.67 },
	["23"] = { -721.06,-415.56,34.98 },
	["24"] = { -1410.34,-98.75,52.42 },
	["25"] = { -1409.78,-100.49,52.39 },
	["26"] = { -712.9,-818.92,23.72 },
	["27"] = { -710.05,-818.9,23.72 },
	["28"] = { -660.71,-854.07,24.48 },
	["29"] = { -594.58,-1161.29,22.33 },
	["30"] = { -596.09,-1161.28,22.33 },
	["31"] = { -821.64,-1081.91,11.12 },
	["32"] = { 155.93,6642.86,31.59 },
	["33"] = { 174.14,6637.94,31.58 },
	["34"] = { -283.01,6226.11,31.49 },
	["35"] = { -95.55,6457.19,31.46 },
	["36"] = { -97.3,6455.48,31.46 },
	["37"] = { -132.93,6366.52,31.48 },
	["38"] = { -386.74,6046.08,31.49 },
	["39"] = { 24.47,-945.96,29.35 },
	["40"] = { 5.24,-919.83,29.55 },
	["41"] = { 295.77,-896.1,29.22 },
	["42"] = { 296.47,-894.21,29.23 },
	["43"] = { 1138.22,-468.93,66.73 },
	["44"] = { 1166.97,-456.06,66.79 },
	["45"] = { 1077.75,-776.54,58.23 },
	["46"] = { 289.1,-1256.8,29.44 },
	["47"] = { 288.81,-1282.37,29.64 },
	["48"] = { -1571.05,-547.38,34.95 },
	["49"] = { -1570.12,-546.72,34.95 },
	["50"] = { -1305.4,-706.41,25.33 },
	["51"] = { -2072.36,-317.28,13.31 },
	["52"] = { -2295.48,358.13,174.6 },
	["53"] = { -2294.7,356.46,174.6 },
	["54"] = { -2293.92,354.8,174.6 },
	["55"] = { 2558.75,351.01,108.61 },
	["56"] = { 89.69,2.47,68.29 },
	["57"] = { -866.69,-187.75,37.84 },
	["58"] = { -867.62,-186.09,37.84 },
	["59"] = { -618.22,-708.89,30.04 },
	["60"] = { -618.23,-706.89,30.04 },
	["61"] = { -614.58,-704.83,31.24 },
	["62"] = { -611.93,-704.83,31.24 },
	["63"] = { -537.82,-854.49,29.28 },
	["64"] = { -526.62,-1222.98,18.45 },
	["65"] = { -165.15,232.7,94.91 },
	["66"] = { -165.17,234.78,94.91 },
	["67"] = { -303.25,-829.74,32.42 },
	["68"] = { -301.7,-830.01,32.42 },
	["69"] = { -203.81,-861.37,30.26 },
	["70"] = { 119.06,-883.72,31.12 },
	["71"] = { 112.58,-819.4,31.34 },
	["72"] = { 111.26,-775.25,31.44 },
	["73"] = { 114.43,-776.38,31.41 },
	["74"] = { -256.23,-715.99,33.53 },
	["75"] = { -258.87,-723.38,33.48 },
	["76"] = { -254.42,-692.49,33.6 },
	["77"] = { -28.0,-724.52,44.23 },
	["78"] = { -30.23,-723.69,44.23 },
	["79"] = { -1315.75,-834.69,16.95 },
	["80"] = { -1314.81,-835.96,16.95 },
	["81"] = { -2956.86,487.64,15.47 },
	["82"] = { -2956.89,487.63,15.47 },
	["83"] = { -2958.98,487.73,15.47 },
	["84"] = { -3043.97,594.56,7.73 },
	["85"] = { -3241.17,997.6,12.55 },
	["86"] = { -1205.78,-324.79,37.86 },
	["87"] = { -1205.02,-326.3,37.84 },
	["88"] = { 147.58,-1035.77,29.34 },
	["89"] = { 146.0,-1035.17,29.34 },
	["90"] = { 33.18,-1348.24,29.49 },
	["91"] = { 2558.51,389.48,108.61 },
	["92"] = { 1153.65,-326.78,69.2 },
	["93"] = { -717.71,-915.66,19.21 },
	["94"] = { -56.98,-1752.1,29.42 },
	["95"] = { 380.75,323.39,103.56 },
	["96"] = { -3240.58,1008.59,12.82 },
	["97"] = { 1735.24,6410.52,35.03 },
	["98"] = { 540.31,2671.14,42.16 },
	["99"] = { 1968.07,3743.57,32.33 },
	["100"] = { 2683.1,3286.55,55.23 },
	["101"] = { 1703.0,4933.6,42.06 },
	["102"] = { -1827.3,784.88,138.3 },
	["103"] = { -3040.72,593.11,7.9 },
	["104"] = { 238.32,215.99,106.29 },
	["105"] = { 237.9,216.89,106.29 },
	["106"] = { 237.47,217.81,106.29 },
	["107"] = { 237.04,218.72,106.29 },
	["108"] = { 236.62,219.64,106.29 },
	["109"] = { 126.82,-1296.6,29.27 },
	["110"] = { 127.81,-1296.03,29.27 },
	["111"] = { -248.08,6327.53,32.42 },
	["112"] = { 315.09,-593.68,43.29 },
	["113"] = { 1836.24,3681.04,34.27 },
	["114"] = { -677.36,5834.58,17.32 },
	["115"] = { 472.3,-1001.57,30.68 },
	["116"] = { 468.52,-990.55,26.27 },
	["117"] = { -1431.2,-447.75,35.91 },
	["118"] = { 349.86,-594.51,28.8 },
	["119"] = { -556.12,-205.21,38.22 },
	["120"] = { 560.5,2742.61,42.87 },
	["121"] = { 1099.77,207.12,-49.44 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKATM
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.checkAtm(Coords)
	local BombZone = false
	local AtmSelected = false

	for Number,v in pairs(ATMList) do
		local Distance = #(vec3(Coords["x"],Coords["y"],Coords["z"]) - vec3(v[1],v[2],v[3]))
		if Distance <= 1.0 then
			BombZone = vec3(v[1],v[2],v[3] - 1)
			AtmSelected = Number
			break
		end
	end

	return BombZone,AtmSelected
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local DrugsPeds = {}
local StealPeds = {}
local DrugsWeapons = { "WEAPON_KATANA","WEAPON_KARAMBIT","WEAPON_BAT","WEAPON_HATCHET","WEAPON_POOLCUE","WEAPON_FLASHLIGHT","WEAPON_HATCHET","WEAPON_BATTLEAXE","WEAPON_STONE_HATCHET","WEAPON_HAMMER","WEAPON_KNUCKLE","WEAPON_GOLFCLUB" }
local StealWeapons = { "WEAPON_KATANA","WEAPON_KARAMBIT","WEAPON_BAT","WEAPON_HATCHET","WEAPON_POOLCUE","WEAPON_SNSPISTOL" }
local DrugsTimer = GetGameTimer()
local StealTimer = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTEALNPCS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		local Ped = PlayerPedId()

		if not IsPedInAnyVehicle(Ped) and IsPedArmed(Ped,7) then
			local Handler,Selected = FindFirstPed()

			repeat
				if not IsEntityDead(Selected) and not StealPeds[Selected] and not DrugsPeds[Selected] and not IsPedDeadOrDying(Selected) and GetPedArmour(Selected) <= 0 and not IsPedAPlayer(Selected) and not IsPedInAnyVehicle(Selected) and GetPedType(Selected) ~= 28 then
					local Coords = GetEntityCoords(Ped)
					local pCoords = GetEntityCoords(Selected)
					local Distance = #(Coords - pCoords)

					if Distance <= 5 then
						TimeDistance = 100

						local Pid = PlayerId()
						if Distance <= 2 and (IsPedInMeleeCombat(Ped) or IsPlayerFreeAiming(Pid)) then
							ClearPedTasks(Selected)
							ClearPedSecondaryTask(Selected)
							ClearPedTasksImmediately(Selected)

							TaskSetBlockingOfNonTemporaryEvents(Selected,true)
							SetBlockingOfNonTemporaryEvents(Selected,true)
							SetEntityAsMissionEntity(Selected,true,true)
							SetPedDropsWeaponsWhenDead(Selected,false)
							TaskTurnPedToFaceEntity(Selected,Ped,3.0)
							SetPedSuffersCriticalHits(Selected,false)
							StealPeds[Selected] = true

							local SelectedRobbery = 500
							LocalPlayer["state"]["Buttons"] = true
							LocalPlayer["state"]["Commands"] = true

							if math.random(100) >= 75 then
								vSERVER.CallPolice()

								LocalPlayer["state"]["Buttons"] = false
								LocalPlayer["state"]["Commands"] = false

								local Weapon = StealWeapons[math.random(#StealWeapons)]
								SetPedArmour(Selected,99)
								SetPedAccuracy(Selected,100)
								SetPedRelationshipGroupHash(Selected,GetHashKey("HATES_PLAYER"))
								SetPedKeepTask(Selected,true)
								SetCanAttackFriendly(Selected,false,true)
								TaskCombatPed(Selected,Ped,0,16)
								SetPedCombatAttributes(Selected,46,true)
								SetPedCombatAbility(Selected,0)
								SetPedCombatAttributes(Selected,0,true)
								GiveWeaponToPed(Selected,Weapon,-1,false,true)
								SetPedDropsWeaponsWhenDead(Selected,false)
								SetPedCombatRange(Selected,2)
								SetPedFleeAttributes(Selected,0,0)
								SetPedConfigFlag(Selected,58,true)
								SetPedConfigFlag(Selected,75,true)
								SetPedFiringPattern(Selected,-957453492)
								SetBlockingOfNonTemporaryEvents(Selected,true)

								SetModelAsNoLongerNeeded(GetEntityModel(Selected))

								SetTimeout(60000,function()
									ClearPedTasks(Selected)
									TaskWanderStandard(Selected,10.0,10)
									TaskReactAndFleePed(Selected,Ped)
									SetPedKeepTask(Selected,true)
								end)
							else
								if LoadAnim("random@mugging3") then
									TaskPlayAnim(Selected,"random@mugging3","handsup_standing_base",8.0,8.0,-1,16,0,0,0,0)
								end
	
								while true do
									local Coords = GetEntityCoords(Ped)
									local pCoords = GetEntityCoords(Selected)
									local Distance = #(Coords - pCoords)
	
									if Distance <= 2 and (IsPedInMeleeCombat(Ped) or IsPlayerFreeAiming(Pid)) then
										SelectedRobbery = SelectedRobbery - 1
	
										if not IsEntityPlayingAnim(Selected,"random@mugging3","handsup_standing_base",3) then
											TaskPlayAnim(Selected,"random@mugging3","handsup_standing_base",8.0,8.0,-1,16,0,0,0,0)
										end
	
										if SelectedRobbery <= 0 then
											if LoadModel("prop_paper_bag_small") then
												local Object = CreateObject("prop_paper_bag_small",Coords["x"],Coords["y"],Coords["z"],false,false,false)
												AttachEntityToEntity(Object,Selected,GetPedBoneIndex(Selected,28422),0.0,-0.05,0.05,180.0,0.0,0.0,false,false,false,false,2,true)
												
												if LoadAnim("mp_safehouselost@") then
													TaskPlayAnim(Selected,"mp_safehouselost@","package_dropoff",8.0,8.0,-1,16,0,0,0,0)
												end
	
												Wait(3000)
	
												if DoesEntityExist(Object) then
													DeleteEntity(Object)
												end
	
												vSERVER.StealPeds(Selected)
												ClearPedSecondaryTask(Selected)
												TaskWanderStandard(Selected,10.0,10)
	
												LocalPlayer["state"]["Buttons"] = false
												LocalPlayer["state"]["Commands"] = false
	
												break
											end
										end
									else
										ClearPedSecondaryTask(Selected)
										TaskWanderStandard(Selected,10.0,10)
	
										LocalPlayer["state"]["Buttons"] = false
										LocalPlayer["state"]["Commands"] = false
	
										break
									end
	
									Wait(1)
								end
							end
						end
					end
				end

				Success,Selected = FindNextPed(Handler)
			until not Success EndFindPed(Handler)
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISVARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local disSelect = 1
local disPlate = nil
local disModel = nil
local disActive = false
local disVehicle = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
local disCoords = {
	vec4(2055.47,3179.24,44.97,59.53),
	vec4(2175.76,3499.56,45.17,340.16),
	vec4(2480.51,3829.97,39.92,85.04),
	vec4(2467.19,4106.69,37.86,337.33),
	vec4(2505.29,4214.18,39.73,144.57),
	vec4(2637.09,4246.96,44.62,314.65),
	vec4(2588.58,4664.46,33.88,317.49),
	vec4(2142.51,4783.96,40.78,25.52),
	vec4(2011.63,4970.06,41.37,116.23),
	vec4(1665.84,4970.69,42.07,133.23),
	vec4(1728.26,4772.97,41.65,0.0),
	vec4(1342.81,4309.73,37.79,167.25),
	vec4(736.69,4176.68,40.52,345.83),
	vec4(17.36,3685.17,39.5,291.97),
	vec4(472.46,3568.16,33.04,167.25),
	vec4(899.0,3579.55,33.18,0.0),
	vec4(1272.59,3621.74,32.86,107.72),
	vec4(1484.0,3751.71,33.58,212.6),
	vec4(1704.33,3765.01,34.17,317.49),
	vec4(1963.98,3834.32,31.81,209.77),
	vec4(1959.72,3764.37,32.0,28.35),
	vec4(1127.61,2647.57,37.79,0.0),
	vec4(970.73,2724.43,39.29,348.67),
	vec4(565.84,2719.71,41.87,2.84),
	vec4(466.12,2591.94,43.08,11.34),
	vec4(262.59,2581.57,44.74,99.22),
	vec4(-448.95,2865.45,35.64,124.73),
	vec4(-1159.67,2674.09,17.89,221.11),
	vec4(-1906.89,2008.71,141.39,272.13),
	vec4(-2530.33,2347.3,32.86,212.6),
	vec4(-2308.52,3271.63,32.64,59.53),
	vec4(-2078.14,2818.11,32.62,266.46),
	vec4(-2283.83,4269.35,43.89,238.12),
	vec4(-1051.88,5322.76,44.96,297.64),
	vec4(-579.04,5370.35,70.16,252.29),
	vec4(-743.45,5536.11,33.3,28.35),
	vec4(-674.75,5779.26,17.14,62.37),
	vec4(-480.18,6260.08,12.92,246.62),
	vec4(-202.91,6570.24,10.78,223.94),
	vec4(-82.87,6561.1,31.29,223.94),
	vec4(435.01,6534.1,27.72,87.88),
	vec4(3321.63,5141.53,18.16,99.22),
	vec4(2866.44,4729.55,48.54,195.6),
	vec4(2949.8,4642.16,48.34,226.78),
	vec4(3002.34,4113.8,57.12,172.92),
	vec4(2976.39,3485.07,71.24,138.9),
	vec4(3511.77,3783.87,29.74,167.25),
	vec4(2541.2,2585.87,37.74,90.71),
	vec4(2547.05,2613.71,37.76,19.85),
	vec4(2364.07,3166.83,47.65,99.22),
	vec4(2173.02,3357.06,45.17,300.48),
	vec4(2388.51,3297.53,47.26,136.07),
	vec4(2616.57,3267.45,55.05,257.96),
	vec4(2460.94,3447.67,49.66,184.26),
	vec4(2013.9,3059.77,46.86,56.7),
	vec4(1967.06,3834.33,31.81,300.48),
	vec4(1756.99,3828.91,34.41,28.35),
	vec4(1498.32,3759.42,33.73,212.6),
	vec4(1420.57,3622.94,34.68,201.26),
	vec4(1272.31,3622.11,32.86,289.14),
	vec4(949.97,3615.49,32.42,90.71),
	vec4(898.37,3653.07,32.57,87.88),
	vec4(909.97,3590.13,33.01,269.3),
	vec4(326.7,3422.87,36.33,257.96),
	vec4(329.79,3457.82,35.81,34.02),
	vec4(232.83,3094.32,42.29,93.55),
	vec4(238.09,3164.7,42.43,99.22),
	vec4(205.21,3039.34,42.71,274.97),
	vec4(365.87,2633.27,44.3,34.02),
	vec4(408.06,2600.56,43.35,2.84),
	vec4(462.78,2603.97,43.08,8.51),
	vec4(497.75,2614.17,42.76,8.51),
	vec4(566.19,2588.22,42.61,102.05),
	vec4(738.24,2527.48,73.01,272.13),
	vec4(736.69,2512.9,73.03,272.13),
	vec4(757.81,2525.89,72.94,87.88),
	vec4(711.59,2324.55,49.96,0.0),
	vec4(160.78,2234.08,89.98,348.67),
	vec4(256.88,2578.01,45.02,96.38),
	vec4(41.1,2800.59,57.68,138.9),
	vec4(-47.68,2879.56,58.67,158.75),
	vec4(709.39,4172.1,40.54,351.5),
	vec4(1785.22,4583.33,37.22,187.09),
	vec4(1723.8,4629.95,43.05,116.23),
	vec4(1684.42,4681.4,42.87,269.3),
	vec4(1690.55,4774.24,41.72,87.88),
	vec4(1654.61,4825.28,41.8,274.97),
	vec4(2012.13,4982.76,41.03,223.94),
	vec4(1960.74,4648.11,40.59,255.12),
	vec4(2552.62,4673.06,33.77,17.01),
	vec4(2523.26,4983.92,44.48,127.56),
	vec4(3315.8,5140.13,18.08,90.71),
	vec4(3713.6,4522.59,21.47,141.74),
	vec4(3811.47,4465.88,3.88,317.49)
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISMANTLECATEGORY
-----------------------------------------------------------------------------------------------------------------------------------------
local DismantleCategory = {
	["B"] = {
		"panto","prairie","rhapsody","blista","dilettante","emperor2","emperor","bfinjection","ingot","regina"
	},
	["B+"] = {
		"asbo","brioso","club","weevil","felon","felon2","jackal","oracle","zion","zion2","buccaneer","virgo",
		"voodoo","bifta","rancherxl","bjxl","cavalcade","gresley","habanero","rocoto","primo","stratum","pigalle",
		"peyote","manana","streiter"
	},
	["A"] = {
		"exemplar","windsor","windsor2","blade","clique","dominator","faction2","gauntlet","moonbeam","nightshade",
		"sabregt2","tampa","rebel","baller","cavalcade2","fq2","huntley","landstalker","patriot","radi","xls","blista2",
		"retinue","stingergt","surano","specter","sultan","schwarzer","schafter2","ruston","rapidgt","raiden","ninef",
		"ninef2","omnis","massacro","jester","feltzer2","futo","carbonizzare"
	},
	["A+"] = {
		"voltic","sc1","sultanrs","tempesta","nero","nero2","reaper","gp1","infernus","bullet","banshee2","turismo2","retinue",
		"mamba","infernus2","feltzer3","coquette2","futo2","zr350","tampa2","sugoi","sultan2","schlagen","penumbra","pariah",
		"paragon","jester3","gb200","elegy","furoregt"
	},
	["S"] = {
		"zentorno","xa21","visione","vagner","vacca","turismor","t20","osiris","italigtb","entityxf","cheetah","autarch","sultan3",
		"cypher","vectre","growler","comet6","jester4","euros","calico","neon","kuruma","issi7","italigto","komoda","elegy2","coquette4"
	},
	["S+"] = {
		"mazdarx72","rangerover","civictyper","subaruimpreza","corvettec7","ferrariitalia","mustang1969","vwtouareg",
		"mercedesg65","bugattiatlantic","m8competition","audirs6","audir8","silvias15","camaro","mercedesamg63",
		"dodgechargerrt69","skyliner342","astonmartindbs","panameramansory","lamborghinihuracanlw","lancerevolutionx",
		"porsche911","jeepcherokee","dodgecharger1970","golfgti","subarubrz","nissangtr","mustangfast","golfmk7",
		"lancerevolution9","shelbygt500","ferrari812","bmwm4gts","ferrarif12","bmwm5e34","toyotasupra2","escalade2021",
		"fordmustang","mclarensenna","lamborghinihuracan","acuransx","toyotasupra","escaladegt900","bentleybacalar"
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISMANTLE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Dismantle(Experience)
	if not disActive then
		disActive = true
		disSelect = math.random(#disCoords)
		disPlate = "DISM"..(1000 + LocalPlayer["state"]["Passport"])

		local Category = ClassCategory(Experience)
		local ModelRandom = math.random(#DismantleCategory[Category])
		disModel = DismantleCategory[Category][ModelRandom]

		local RandomX = math.random(25,100)
		local RandomY = math.random(25,100)

		if math.random(2) >= 2 then
			TriggerEvent("NotifyPush",{ code = 20, title = "Localização do Veículo", x = disCoords[disSelect][1] + RandomX + 0.0, y = disCoords[disSelect][2] - RandomY + 0.0, z = disCoords[disSelect][3], vehicle = VehicleName(disModel).." - "..disPlate, blipColor = 60 })
		else
			TriggerEvent("NotifyPush",{ code = 20, title = "Localização do Veículo", x = disCoords[disSelect][1] - RandomX + 0.0, y = disCoords[disSelect][2] + RandomY + 0.0, z = disCoords[disSelect][3], vehicle = VehicleName(disModel).." - "..disPlate, blipColor = 60 })
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISMANTLESTATUS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.DismantleStatus()
	return disActive
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:DISRESET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Disreset")
AddEventHandler("inventory:Disreset",function()
	disSelect = 1
	disPlate = nil
	disModel = nil
	disActive = false
	disVehicle = false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADDISMANTLE
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		if disActive and not disVehicle then
			local Ped = PlayerPedId()
			local Coords = GetEntityCoords(Ped)
			local Distance = #(Coords - vec3(disCoords[disSelect][1],disCoords[disSelect][2],disCoords[disSelect][3]))

			if Distance <= 125 then
				disVehicle = vGARAGE.ServerVehicle(disModel,disCoords[disSelect][1],disCoords[disSelect][2],disCoords[disSelect][3],disCoords[disSelect][4],disPlate,1000,nil,1000)

				if NetworkDoesNetworkIdExist(disVehicle) then
					local Network = NetToEnt(disVehicle)
					if NetworkDoesNetworkIdExist(Network) then
						SetVehicleOnGroundProperly(Network)
					end
				end
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:DISMANTLEBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:DismantleBlips")
AddEventHandler("inventory:DismantleBlips",function(Coords)
	local disVehicle = AddBlipForCoord(Coords["x"],Coords["y"],Coords["z"])
	SetBlipSprite(disVehicle,225)
	SetBlipDisplay(disVehicle,4)
	SetBlipHighDetail(disVehicle,true)
	SetBlipAsShortRange(disVehicle,true)
	SetBlipColour(disVehicle,5)
	SetBlipScale(disVehicle,1.0)
	SetBlipFlashes(disVehicle,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Veículo Procurado")
	EndTextCommandSetBlipName(disVehicle)

	SetTimeout(10000,function()
		if DoesBlipExist(disVehicle) then
			RemoveBlip(disVehicle)
		end
	end)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPEDS
-----------------------------------------------------------------------------------------------------------------------------------------
local disPeds = {
	"ig_abigail","a_m_m_afriamer_01","ig_mp_agent14","csb_agent","ig_amandatownley","s_m_y_ammucity_01","u_m_y_antonb","g_m_m_armboss_01",
	"g_m_m_armgoon_01","g_m_m_armlieut_01","ig_ashley","s_m_m_autoshop_01","ig_money","g_m_y_ballaeast_01","g_f_y_ballas_01","g_m_y_ballasout_01",
	"s_m_y_barman_01","u_m_y_baygor","a_m_o_beach_01","ig_bestmen","a_f_y_bevhills_01","a_m_m_bevhills_02","u_m_m_bikehire_01","u_f_y_bikerchic",
	"mp_f_boatstaff_01","s_m_m_bouncer_01","ig_brad","ig_bride","u_m_y_burgerdrug_01","a_m_m_business_01","a_m_y_business_02","s_m_o_busker_01",
	"ig_car3guy2","cs_carbuyer","g_m_m_chiboss_01","g_m_m_chigoon_01","g_m_m_chigoon_02","u_f_y_comjane","ig_dale","ig_davenorton","s_m_y_dealer_01",
	"ig_denise","ig_devin","a_m_y_dhill_01","ig_dom","a_m_y_downtown_01","ig_dreyfuss"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
local disWeapons = { "WEAPON_HEAVYPISTOL","WEAPON_SMG","WEAPON_ASSAULTSMG","WEAPON_APPISTOL","WEAPON_SPECIALCARBINE","WEAPON_PUMPSHOTGUN" }
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:DISPED
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterNetEvent("inventory:DisPed")
-- AddEventHandler("inventory:DisPed",function()
-- local Ped = PlayerPedId()
-- 	local Rand = math.random(#disPeds)
-- 	local Coords = GetEntityCoords(Ped)
-- 	local Weapon = math.random(#disWeapons)
-- 	local cX = Coords["x"] + math.random(-25.0,25.0)
-- 	local cY = Coords["y"] + math.random(-25.0,25.0)
-- 	local Hit,EntCoords = GetSafeCoordForPed(cX,cY,Coords["z"],false,16)
-- 	local Entity,EntityNet = vRPS.CreatePed(disPeds[Rand],EntCoords["x"],EntCoords["y"],EntCoords["z"],3374176,4)
-- 	if Entity then
-- 		Wait(1000)

-- 		local NetEntity = LoadNetwork(EntityNet)

-- 		SetPedArmour(NetEntity,99)
-- 		SetPedAccuracy(NetEntity,100)
-- 		SetPedRelationshipGroupHash(NetEntity,GetHashKey("HATES_PLAYER"))
-- 		SetPedKeepTask(NetEntity,true)
-- 		SetCanAttackFriendly(NetEntity,false,true)
-- 		TaskCombatPed(NetEntity,Ped,0,16)
-- 		SetPedCombatAttributes(NetEntity,46,true)
-- 		SetPedCombatAbility(NetEntity,0)
-- 		SetPedCombatAttributes(NetEntity,0,true)
-- 		GiveWeaponToPed(NetEntity,disWeapons[Weapon],-1,false,true)
-- 		SetPedDropsWeaponsWhenDead(NetEntity,false)
-- 		SetPedCombatRange(NetEntity,2)
-- 		SetPedFleeAttributes(NetEntity,0,0)
-- 		SetPedConfigFlag(NetEntity,58,true)
-- 		SetPedConfigFlag(NetEntity,75,true)
-- 		SetPedFiringPattern(NetEntity,-957453492)
-- 		SetBlockingOfNonTemporaryEvents(NetEntity,true)

-- 		SetModelAsNoLongerNeeded(disPeds[Rand])
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKMODS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.CheckMods(Vehicle,Mod)
	return GetNumVehicleMods(Vehicle,Mod) - 1
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKCAR
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.CheckCar(Vehicle)
	local Model = GetEntityModel(Vehicle)
	return IsThisModelACar(Model)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEMODS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.ActiveMods(Vehicle,Plate,Mod,Number)
	if NetworkDoesNetworkIdExist(Vehicle) then
		local Vehicle = NetToEnt(Vehicle)
		if DoesEntityExist(Vehicle) then
			if GetVehicleNumberPlateText(Vehicle) == Plate then
				SetVehicleMod(Vehicle,Mod,Number)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BURGERSHOT
-----------------------------------------------------------------------------------------------------------------------------------------
local BurgerShot = PolyZone:Create({
	vector2(-1174.21,-898.17),
	vector2(-1188.63,-908.10),
	vector2(-1198.07,-906.52),
	vector2(-1208.42,-891.13),
	vector2(-1188.37,-877.37)
},{ name = "BurgerShot" })
-----------------------------------------------------------------------------------------------------------------------------------------
-- PIZZATHIS
-----------------------------------------------------------------------------------------------------------------------------------------
local PizzaThis = PolyZone:Create({
	vector2(793.94,-747.72),
	vector2(794.00,-768.85),
	vector2(814.90,-768.82),
	vector2(814.93,-747.62),
	vector2(812.48,-739.99),
	vector2(794.07,-740.05)
},{ name = "PizzaThis" })
-----------------------------------------------------------------------------------------------------------------------------------------
-- BEANMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
local BeanMachine = PolyZone:Create({
	vector2(129.73,-1029.63),
	vector2(118.45,-1025.35),
	vector2(110.82,-1046.34),
	vector2(122.31,-1050.47)
},{ name = "BeanMachine" })
-----------------------------------------------------------------------------------------------------------------------------------------
-- UWUCOFFEE
-----------------------------------------------------------------------------------------------------------------------------------------
local UwUCoffee = PolyZone:Create({
	vector2(-565.30,-1071.24),
	vector2(-575.38,-1070.52),
	vector2(-601.44,-1069.51),
	vector2(-601.53,-1046.78),
	vector2(-565.33,-1047.50)
},{ name = "UwUCoffee" })
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESTAURANT
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Restaurant(Name)
	local Return = false
	local Ped = PlayerPedId()
	local Coords = GetEntityCoords(Ped)

	if Name == "BurgerShot" then
		if BurgerShot:isPointInside(Coords) then
			Return = true
		end
	elseif Name == "PizzaThis" then
		if PizzaThis:isPointInside(Coords) then
			Return = true
		end
	elseif Name == "BeanMachine" then
		if BeanMachine:isPointInside(Coords) then
			Return = true
		end
	elseif Name == "UwuCoffee" then
		if UwUCoffee:isPointInside(Coords) then
			Return = true
		end
	end

	return Return
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local amountCoords = 0
	repeat
		amountCoords = amountCoords + 1
		local rand = math.random(#scanCoords)
		scanTable[amountCoords] = scanCoords[rand]
		Wait(1)
	until amountCoords == 25

	for Number,v in pairs(ATMList) do
		exports["target"]:AddCircleZone("Atm:"..Number,vec3(v[1],v[2],v[3]),0.5,{
			name = "Atm:"..Number,
			heading = 3374176
		},{
			Distance = 1.0,
			options = {
				{
					event = "Bank",
					label = "Abrir",
					tunnel = "client"
				}
			}
		})
	end
end)