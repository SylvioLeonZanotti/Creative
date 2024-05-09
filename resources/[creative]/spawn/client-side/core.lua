-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("spawn")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Camera = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCATE
-----------------------------------------------------------------------------------------------------------------------------------------
local Locate = {
	{ ["Coords"] = vec3(-1191.67,-1512.72,4.36), ["name"] = "" },
	{ ["Coords"] = vec3(-1191.67,-1512.72,4.36), ["name"] = "Los Santos" },
	{ ["Coords"] = vec3(1622.56,3568.96,35.15), ["name"] = "Sandy Shores" },
	{ ["Coords"] = vec3(-133.74,6353.28,31.49), ["name"] = "Paleto Bay" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMS
-----------------------------------------------------------------------------------------------------------------------------------------
local Anims = {
	{ ["Dict"] = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", ["Name"] = "hi_dance_crowd_17_v2_male^2" },
	{ ["Dict"] = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", ["Name"] = "high_center_down" },
	{ ["Dict"] = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", ["Name"] = "med_center_up" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWN:OPENED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("spawn:Opened")
AddEventHandler("spawn:Opened",function()
	local Ped = PlayerPedId()
	SetEntityCoords(Ped,558.7,-448.14,-70.66,false,false,false,false)
	LocalPlayer["state"]:set("Invincible",true,true)
	LocalPlayer["state"]:set("Invisible",true,true)
	SetEntityVisible(Ped,false,false)
	FreezeEntityPosition(Ped,true)
	SetEntityInvincible(Ped,true)
	SetEntityHeading(Ped,269.3)
	SetEntityHealth(Ped,101)
	SetPedArmour(Ped,0)

	Camera = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
	SetCamCoord(Camera,560.75,-448.9,-69.66)
	RenderScriptCams(true,true,0,true,true)
	SetCamRot(Camera,0.0,0.0,87.88,2)
	SetCamActive(Camera,true)

	Characters = vSERVER.Characters()
	if parseInt(#Characters) > 0 then
		Customization(Characters[1])
	end

	Wait(5000)

	SendNUIMessage({ Action = "Spawn", Table = Characters })
	SetNuiFocus(true,true)

	if IsScreenFadedOut() then
		DoScreenFadeIn(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERCHOSEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("CharacterChosen",function(Data,Callback)
	if vSERVER.CharacterChosen(Data["Passport"]) then
		SendNUIMessage({ Action = "Close" })
	end

	vSERVER.FinshSpawn()
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NEWCHARACTER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("NewCharacter",function(Data,Callback)
	vSERVER.NewCharacter(Data["name"],Data["lastname"],Data["sex"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SWITCHCHARACTER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("SwitchCharacter",function(Data,Callback)
	for _,v in pairs(Characters) do
		if v["Passport"] == Data["Passport"] then
			Customization(v,true)
			break
		end
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- spawn:justSpawn
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("spawn:justSpawn")
AddEventHandler("spawn:justSpawn",function(Open,Barbershop)
	local source = source
	if Open then
		Locate[1] = { ["Coords"] = Barbershop, ["name"] = "" }

		for Number,v in pairs(Locate) do
			local Road = GetStreetNameAtCoord(v["Coords"]["x"],v["Coords"]["y"],v["Coords"]["z"])
			Locate[Number]["name"] = GetStreetNameFromHashKey(Road)
		end

		SetCamCoord(Camera,Locate[1]["Coords"]["x"],Locate[1]["Coords"]["y"],Locate[1]["Coords"]["z"] + 1)
		SendNUIMessage({ Action = "Location", Table = Locate })
		LocalPlayer["state"]:set("Invisible",true,true)
		SetEntityVisible(PlayerPedId(),false,false)
		SetCamRot(Camera,0.0,0.0,0.0,2)
	else
		SetEntityVisible(PlayerPedId(),true,false)
		LocalPlayer["state"]:set("Invisible",false,true)
		SendNUIMessage({ Action = "Close" })
		TriggerEvent("hud:Active",true)
		SetNuiFocus(false,false)

		if DoesCamExist(Camera) then
			RenderScriptCams(false,false,0,false,false)
			SetCamActive(Camera,false)
			DestroyCam(Camera,false)
			Camera = nil
		end

		if Barbershop then
			TriggerServerEvent("vRP:BucketClient","Enter")
			TriggerEvent("barbershop:Open","open")
				Wait(5000)
				FreezeEntityPosition(PlayerPedId(), false)
				Wait(60000)
				TriggerEvent("initial:Open")
			end
		end
	end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Spawn",function(Data,Callback)
	if DoesCamExist(Camera) then
		RenderScriptCams(false,false,0,false,false)
		SetCamActive(Camera,false)
		DestroyCam(Camera,false)
		Camera = nil
	end

	SetEntityVisible(PlayerPedId(),true,false)
	LocalPlayer["state"]:set("Invisible",false,true)
	SendNUIMessage({ Action = "Close" })
	TriggerEvent("hud:Active",true)
	SetNuiFocus(false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHOSEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Chosen",function(Data,Callback)
	local Ped = PlayerPedId()
	local Index = Data["index"]

	SetEntityCoords(Ped,Locate[Index]["Coords"]["x"],Locate[Index]["Coords"]["y"],Locate[Index]["Coords"]["z"] - 1)
	SetCamCoord(Camera,Locate[Index]["Coords"]["x"],Locate[Index]["Coords"]["y"],Locate[Index]["Coords"]["z"] + 1)
	SetCamRot(Camera,0.0,0.0,0.0,2)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CUSTOMIZATION
-----------------------------------------------------------------------------------------------------------------------------------------
function Customization(Table,Check)
	if not Table["Skin"] then
		Table["Skin"] = "mp_m_freemode_01"
	end

	if LoadModel(Table["Skin"]) then
		if Check then
			if GetEntityModel(PlayerPedId()) ~= GetHashKey(Table["Skin"]) then
				SetPlayerModel(PlayerId(),Table["Skin"])
				SetPedComponentVariation(PlayerPedId(),5,0,0,1)
			end
		else
			SetPlayerModel(PlayerId(),Table["Skin"])
			SetPedComponentVariation(PlayerPedId(),5,0,0,1)
		end

		local Ped = PlayerPedId()
		local Random = math.random(#Anims)
		if LoadAnim(Anims[Random]["Dict"]) then
			TaskPlayAnim(Ped,Anims[Random]["Dict"],Anims[Random]["Name"],8.0,8.0,-1,1,0,0,0,0)
		end

		exports["skinshop"]:Apply(Table["Clothes"],Ped)
		exports["barbershop"]:Apply(Table["Barber"],Ped)

		for Index,Overlay in pairs(Table["Tattoos"]) do
			AddPedDecorationFromHashes(Ped,Overlay,Index)
		end

		SetEntityVisible(Ped,true,false)
		LocalPlayer["state"]:set("Invisible",false,true)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWN:INCREMENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("spawn:Increment")
AddEventHandler("spawn:Increment",function(Tables)
	for _,v in pairs(Tables) do
		Locate[#Locate + 1] = { ["Coords"] = v["Coords"], ["name"] = "" }
	end
end)