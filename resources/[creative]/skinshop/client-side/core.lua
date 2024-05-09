-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Hypex = {}
Tunnel.bindInterface("skinshop",Hypex)
vSERVER = Tunnel.getInterface("skinshop")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Init = "hat"
local Camera = nil
local Animation = false
local Command = false
cityName = GetConvar("cityName", "Santa")
local Bucket = 1
local Newbie = false
local CachedCoords
-----------------------------------------------------------------------------------------------------------------------------------------
-- DATASET
-----------------------------------------------------------------------------------------------------------------------------------------
local Dataset = {
	["pants"] = { item = 0, texture = 0 },
	["arms"] = { item = 0, texture = 0 },
	["tshirt"] = { item = 1, texture = 0 },
	["torso"] = { item = 0, texture = 0 },
	["vest"] = { item = 0, texture = 0 },
	["shoes"] = { item = 0, texture = 0 },
	["mask"] = { item = 0, texture = 0 },
	["backpack"] = { item = 0, texture = 0 },
	["hat"] = { item = -1, texture = 0 },
	["glass"] = { item = 0, texture = 0 },
	["ear"] = { item = -1, texture = 0 },
	["watch"] = { item = -1, texture = 0 },
	["bracelet"] = { item = -1, texture = 0 },
	["accessory"] = { item = 0, texture = 0 },
	["decals"] = { item = 0, texture = 0 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINSHOP:APPLY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:Apply")
AddEventHandler("skinshop:Apply",function(Table)
	for Index,v in pairs(Dataset) do
		if not Table[Index] then
			Table[Index] = v
		end
	end
    LocalPlayer["state"]["Skinshop"] = Table
	Dataset = Table
	vSERVER.Update(Dataset)
	exports["skinshop"]:Apply()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINSHOPS
-----------------------------------------------------------------------------------------------------------------------------------------
local Skinshops = {
	-- Skinshops
	{ 72.78,-1399.34,29.37 },
	{ -710.22,-153.07,37.41 },
	{ -163.14,-302.99,39.73 },
	{ -829.16,-1074.3,11.32 },
	{ -1188.06,-768.69,17.32 },
	{ -1450.43,-237.04,49.81 },
	{ 11.28,6514.82,31.88 },
	{ 428.6,-799.93,29.49 },
	{ -1107.66,2707.98,19.11 },
	{ -3175.35,1042.19,20.86 },
	{ 1190.27,2712.99,38.22 },
	{ 617.75,2766.35,42.09 },
	{ 121.01,-225.53,54.56 },
	{ 1695.53,4829.45,42.06 },
	-- Paramedic-1
	{ -1815.75,-359.98,49.45 }, -- F
	{ -1817.55,-361.81,49.45 }, -- F
	{ -1813.56,-357.71,49.45 }, -- M
	{ -1811.93,-355.7,49.47 }, -- M
	-- Paramedico-2
	{ 1824.44,3672.56,34.27 },
	-- Paramedico-3
	{ -256.85,6327.76,32.42 },
	-- Policia-1
	{ -951.89,-2046.51,12.92 },
	{ -954.51,-2050.76,12.92 },
	-- Policia-2
	{ 853.51,-1312.91,28.24 },
	-- Policia-3
	{ 1771.42,2573.39,45.73 },
	-- Policia-4
	{ 1853.45,3688.83,29.81 },
	-- Policia-5
	{ -437.67,6009.04,36.99 },
	{ -439.37,6011.13,36.99 },
	-- Harmony
	{ 1187.54,2636.33,38.4 },
	-- Mecanico
	{ 822.82,-942.67,26.47 },
	-- Bennys
	{ -797.22,-2604.59,17.25 },
	-- Pearls
	{ -1838.29,-1186.62,14.31 }
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local Tables = {}

	for Number = 1,#Skinshops do
		Tables[#Tables + 1] = { Skinshops[Number][1],Skinshops[Number][2],Skinshops[Number][3],2.0,"E","Loja de Roupas","Pressione para abrir" }
	end

	TriggerEvent("hoverfy:Insert",Tables)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		if LocalPlayer["state"]["Route"] < 900000 then
			local Ped = PlayerPedId()
			if not IsPedInAnyVehicle(Ped) then
				local Coords = GetEntityCoords(Ped)

				for Number = 1,#Skinshops do
					local Distance = #(Coords - vec3(Skinshops[Number][1],Skinshops[Number][2],Skinshops[Number][3]))
					if Distance <= 2 then
						TimeDistance = 1

						if IsControlJustPressed(0,38) then
                            if not LocalPlayer["state"]["Plaster"] then
                                OpenSkinshop()
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
-- SKINSHOP:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:Open")
AddEventHandler("skinshop:Open",function(Boolean,Variable)
	TriggerEvent("dynamic:closeSystem")
    if Variable then
        Newbie = true
        OpenSkinshop()
        return
    end
	if not exports["hud"]:Wanted()   then
        if Boolean then
            Command = true
        end
		OpenSkinshop()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAXVALUES
-----------------------------------------------------------------------------------------------------------------------------------------
function MaxValues()
	local MaxValues = {}
	local Ped = PlayerPedId()
    local isMale = GetEntityModel(Ped) == GetHashKey("mp_m_freemode_01")
	for Index, dump in pairs(SharedClothingData) do
        local v = {}
        v["min"] = dump["min"]
        v["max"] = dump["max"]
        v["id"] = dump["id"]
        v["mode"] = dump["mode"]
        v["vips"] = dump["vips"]
        v["diamonds"] = dump["diamonds"]
        v["prices"] = dump["prices"]
        v["reset"] = dump["reset"]

		if v["mode"] == "variation" then
			v["item"] = GetNumberOfPedDrawableVariations(Ped,v["id"])
			v["texture"] = GetNumberOfPedTextureVariations(Ped,v["id"],GetPedDrawableVariation(Ped,v["id"])) - 1
		elseif v["mode"] == "prop" then
			v["item"] = GetNumberOfPedPropDrawableVariations(Ped,v["id"])
			v["texture"] = GetNumberOfPedPropTextureVariations(Ped,v["id"],GetPedPropIndex(Ped,v["id"])) - 1
		end

        if isMale then
            v["diamonds"] = v["diamonds"]["mp_m_freemode_01"]
            v["vips"] = v["vips"]["mp_m_freemode_01"]
            v["prices"] = v["prices"]["mp_m_freemode_01"]
        else
            v["diamonds"] = v["diamonds"]["mp_f_freemode_01"]
            v["vips"] = v["vips"]["mp_f_freemode_01"]
            v["prices"] = v["prices"]["mp_f_freemode_01"]
        end

        if isMale then
            v["reset"] = v["reset"]["mp_m_freemode_01"]
        else
            v["reset"] = v["reset"]["mp_f_freemode_01"]
        end

		if v["texture"] < 0 then
			v["texture"] = 0
		end
        MaxValues[Index] = v
	end

	return MaxValues
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENSKINSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function OpenSkinshop()
	LocalPlayer["state"]["Skinshop"] = Dataset
    Bucket = LocalPlayer["state"]["Route"]
    if not Command then
    end
    SendNUIMessage({ action = "setVisible", data = "" })

	vRP.playAnim(true,{"mp_sleep","bind_pose_180"},true)
    CachedCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.25,1.0,0.0)

	SetNuiFocus(true,true)
	CameraActive()
    TriggerEvent("hud:Active",false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAMERAACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
local function UpdateCameraBasedOnInit()
	local Ped = PlayerPedId()
    if not CachedCoords then
        CachedCoords = GetOffsetFromEntityInWorldCoords(Ped,0.25,1.0,0.0)
    end

	if Init == "hat" then
		SetCamCoord(Camera,CachedCoords["x"],CachedCoords["y"],CachedCoords["z"] + 0.45)
    elseif Init == "mask" then
        SetCamCoord(Camera,CachedCoords["x"],CachedCoords["y"],CachedCoords["z"] + 0.45)
	elseif Init == "shirt" then
		SetCamCoord(Camera,CachedCoords["x"],CachedCoords["y"],CachedCoords["z"] + 0.25)
	elseif Init == "pants" then
		SetCamCoord(Camera,CachedCoords["x"],CachedCoords["y"],CachedCoords["z"] - 0.45)
	elseif Init == "watch" then
		SetCamCoord(Camera,CachedCoords["x"],CachedCoords["y"],CachedCoords["z"] + 0.05)
    elseif Init == "bracelet" then
        SetCamCoord(Camera,CachedCoords["x"],CachedCoords["y"],CachedCoords["z"] + 0.05)
    elseif Init == "arms" then
        SetCamCoord(Camera,CachedCoords["x"],CachedCoords["y"],CachedCoords["z"] + 0.15)
    elseif Init == "vest" then
        SetCamCoord(Camera,CachedCoords["x"],CachedCoords["y"],CachedCoords["z"] + 0.15)
    elseif Init == "shoes" then
        SetCamCoord(Camera,CachedCoords["x"],CachedCoords["y"],CachedCoords["z"] - 0.75)
    else
        SetCamCoord(Camera,CachedCoords["x"],CachedCoords["y"],CachedCoords["z"] + 0.25)
	end
end

function CameraActive(Number,NPC)
	if DoesCamExist(Camera) then
		RenderScriptCams(false,false,0,false,false)
		SetCamActive(Camera,false)
		DestroyCam(Camera,false)
		Camera = nil
	end

	local Ped = PlayerPedId()

	if Number then
		SetEntityCoords(Ped,Skinshops[Number][1],Skinshops[Number][2],Skinshops[Number][3] - 1)
		SetEntityHeading(Ped,Skinshops[Number][4])
	end

    if NPC then
        SetEntityCoords(Ped,NPC["x"],NPC["y"],NPC["z"] - 1)
        SetEntityHeading(Ped,NPC["w"])
    end

	local Heading = GetEntityHeading(Ped)
	Camera = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
    UpdateCameraBasedOnInit()

	RenderScriptCams(true,true,100,true,true)
	SetCamRot(Camera,0.0,0.0,Heading + 180)
	SetEntityHeading(Ped,Heading)
	SetCamActive(Camera,true)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- APPLY
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Apply",function(Data,Ped)
	if not Ped then
		Ped = PlayerPedId()
	end

	if not Data then
		Data = Dataset
	end

	for Index,v in pairs(Dataset) do
		if not Data[Index] then
			Data[Index] = {
				["item"] = v["item"],
				["texture"] = v["texture"]
			}
		end
	end

	SetPedComponentVariation(Ped,4,Data["pants"]["item"],Data["pants"]["texture"],1)
	SetPedComponentVariation(Ped,3,Data["arms"]["item"],Data["arms"]["texture"],1)
	SetPedComponentVariation(Ped,5,Data["backpack"]["item"],Data["backpack"]["texture"],1)
	SetPedComponentVariation(Ped,8,Data["tshirt"]["item"],Data["tshirt"]["texture"],1)
	SetPedComponentVariation(Ped,9,Data["vest"]["item"],Data["vest"]["texture"],1)
	SetPedComponentVariation(Ped,11,Data["torso"]["item"],Data["torso"]["texture"],1)
	SetPedComponentVariation(Ped,6,Data["shoes"]["item"],Data["shoes"]["texture"],1)
	SetPedComponentVariation(Ped,1,Data["mask"]["item"],Data["mask"]["texture"],1)
	SetPedComponentVariation(Ped,10,Data["decals"]["item"],Data["decals"]["texture"],1)
	SetPedComponentVariation(Ped,7,Data["accessory"]["item"],Data["accessory"]["texture"],1)

	if Data["hat"]["item"] ~= -1 and Data["hat"]["item"] ~= 0 then
		SetPedPropIndex(Ped,0,Data["hat"]["item"],Data["hat"]["texture"],1)
	else
		ClearPedProp(Ped,0)
	end

	if Data["glass"]["item"] ~= -1 and Data["glass"]["item"] ~= 0 then
		SetPedPropIndex(Ped,1,Data["glass"]["item"],Data["glass"]["texture"],1)
	else
		ClearPedProp(Ped,1)
	end

	if Data["ear"]["item"] ~= -1 and Data["ear"]["item"] ~= 0 then
		SetPedPropIndex(Ped,2,Data["ear"]["item"],Data["ear"]["texture"],1)
	else
		ClearPedProp(Ped,2)
	end

	if Data["watch"]["item"] ~= -1 and Data["watch"]["item"] ~= 0 then
		SetPedPropIndex(Ped,6,Data["watch"]["item"],Data["watch"]["texture"],1)
	else
		ClearPedProp(Ped,6)
	end

	if Data["bracelet"]["item"] ~= -1 and Data["bracelet"]["item"] ~= 0 then
		SetPedPropIndex(Ped,7,Data["bracelet"]["item"],Data["bracelet"]["texture"],1)
	else
		ClearPedProp(Ped,7)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSESKINSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("getDataOfCategory", function(tag, Callback)
    local Ped = PlayerPedId()
    local isMale = GetEntityModel(Ped) == GetHashKey("mp_m_freemode_01")
    local currentsOfTag = Dataset[tag]
    local maxsOfTag = MaxValues()[tag]
    Callback({
        current = currentsOfTag,
        max = maxsOfTag,
        isVip = false,
        isMale = isMale
    })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateDataOfCategory",function(Data,Callback)
	local _Dataset = Dataset
    
    _Dataset[Data["category"]]["item"] = Data["item"]
    _Dataset[Data["category"]]["texture"] = Data["texture"]
	exports["skinshop"]:Apply()

	Callback(MaxValues())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateCamera",function(Data,Callback)
	Init = Data
    UpdateCameraBasedOnInit()

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("getIsFirstLogin",function(Data,Callback)
	Callback(LocalPlayer["state"]["FirstLogin"])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("save",function(Data,Callback)
	if DoesCamExist(Camera) then
		RenderScriptCams(false,false,0,false,false)
		SetCamActive(Camera,false)
		DestroyCam(Camera,false)
		Camera = nil
	end
    if not Command then
        vSERVER.Cancel()
    end
    Command = false
	SetNuiFocus(false,false)
	vSERVER.Update(Dataset)
	vRP.removeObjects()
    if Newbie then
        vSERVER.Cancel()
        Newbie = false
    end
    Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("hideFrame",function(Data,Callback)
    if LocalPlayer["state"]["FirstLogin"] then
        return
    end
	if DoesCamExist(Camera) then
		RenderScriptCams(false,false,0,false,false)
		SetCamActive(Camera,false)
		DestroyCam(Camera,false)
		Camera = nil
	end

	exports["skinshop"]:Apply(LocalPlayer["state"]["Skinshop"])
    if not Command then
        vSERVER.Cancel()
    end
    Command = false
	Dataset = LocalPlayer["state"]["Skinshop"]
	LocalPlayer["state"]["Skinshop"] = {}
	SetNuiFocus(false,false)
    SendNUIMessage({ action = "setVisible", data = false })
    TriggerEvent("hud:Active",true)
	vRP.removeObjects()
	vRP.Destroy()
    if Newbie then
        if LocalPlayer["state"]["DefaultSpawn"] then
            TriggerEvent("talknpc:NpcVovo2")
		else
            TriggerEvent("talknpc:NpcVovo")
		end
        Newbie = false
    end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Rotate",function(Data,Callback)
	local Ped = PlayerPedId()

	if Data == "Left" then
		SetEntityHeading(Ped,GetEntityHeading(Ped) - 5)
	elseif Data == "Right" then
		SetEntityHeading(Ped,GetEntityHeading(Ped) + 5)
	elseif Data == "Top" then
		local Coords = GetCamCoord(Camera)
		SetCamCoord(Camera,Coords["x"],Coords["y"],Coords["z"] + 0.05)
	elseif Data == "Bottom" then
		local Coords = GetCamCoord(Camera)
		SetCamCoord(Camera,Coords["x"],Coords["y"],Coords["z"] - 0.05)
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETHAT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setHat")
AddEventHandler("skinshop:setHat",function()
	if not Animation and not LocalPlayer["state"]["Buttons"] then
		Animation = true
		local Ped = PlayerPedId()
		vRP.playAnim(true,{"mp_masks@standard_car@ds@","put_on_mask"},true)

		Wait(1000)

		if GetPedPropIndex(Ped,0) == Dataset["hat"]["item"] then
			ClearPedProp(Ped,0)
		else
			SetPedPropIndex(Ped,0,Dataset["hat"]["item"],Dataset["hat"]["texture"],1)
		end

		vRP.Destroy()
		Animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETMASK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setMask")
AddEventHandler("skinshop:setMask",function()
	if not Animation and not LocalPlayer["state"]["Buttons"] then
		Animation = true
		local Ped = PlayerPedId()
		vRP.playAnim(true,{"missfbi4","takeoff_mask"},true)

		Wait(1000)

		if GetPedDrawableVariation(Ped,1) == Dataset["mask"]["item"] then
			SetPedComponentVariation(Ped,1,0,0,1)
		else
			SetPedComponentVariation(Ped,1,Dataset["mask"]["item"],Dataset["mask"]["texture"],1)
		end

		vRP.Destroy()
		Animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETGLASSES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setGlasses")
AddEventHandler("skinshop:setGlasses",function()
	if not Animation and not LocalPlayer["state"]["Buttons"] then
		Animation = true
		local Ped = PlayerPedId()
		vRP.playAnim(true,{"clothingspecs","take_off"},true)

		Wait(1000)

		if GetPedPropIndex(Ped,1) == Dataset["glass"]["item"] then
			ClearPedProp(Ped,1)
		else
			SetPedPropIndex(Ped,1,Dataset["glass"]["item"],Dataset["glass"]["texture"],1)
		end

		vRP.Destroy()
		Animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETSHIRT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setShirt")
AddEventHandler("skinshop:setShirt",function()
	if not Animation and not LocalPlayer["state"]["Buttons"] then
		Animation = true
		vRP.playAnim(true,{"clothingtie","try_tie_negative_a"},true)
		Wait(1000)
	
		local Ped = PlayerPedId()
	
		if GetPedDrawableVariation(Ped,8) == Dataset["tshirt"]["item"] then
			SetPedComponentVariation(Ped,8,15,0,1)
			SetPedComponentVariation(Ped,3,15,0,1)
		else
			SetPedComponentVariation(Ped,8,Dataset["tshirt"]["item"],Dataset["tshirt"]["texture"],1)
		end
	
		vRP.Destroy()
		Animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETTORSO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setTorso")
AddEventHandler("skinshop:setTorso",function()
	if not Animation and not LocalPlayer["state"]["Buttons"] then
		Animation = true
		vRP.playAnim(true,{"clothingtie","try_tie_negative_a"},true)
		Wait(1000)

		local Ped = PlayerPedId()

		if GetPedDrawableVariation(Ped,11) == Dataset["torso"]["item"] then
			SetPedComponentVariation(Ped,11,15,0,1)
			SetPedComponentVariation(Ped,3,15,0,1)
		else
			SetPedComponentVariation(Ped,11,Dataset["torso"]["item"],Dataset["torso"]["texture"],1)
		end

		vRP.Destroy()
		Animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETARMS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setArms")
AddEventHandler("skinshop:setArms",function()
	if not Animation and not LocalPlayer["state"]["Buttons"] then
		Animation = true
		vRP.playAnim(true,{"clothingtie","try_tie_negative_a"},true)
		Wait(1000)

		local Ped = PlayerPedId()

		if GetPedDrawableVariation(Ped,3) == Dataset["arms"]["item"] then
			SetPedComponentVariation(Ped,3,15,0,1)
		else
			SetPedComponentVariation(Ped,3,Dataset["arms"]["item"],Dataset["arms"]["texture"],1)
		end

		vRP.Destroy()
		Animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETVEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setVest")
AddEventHandler("skinshop:setVest",function()
	if not Animation and not LocalPlayer["state"]["Buttons"] then
		Animation = true
		vRP.playAnim(true,{"clothingtie","try_tie_negative_a"},true)
		Wait(1000)

		local Ped = PlayerPedId()

		if GetPedDrawableVariation(Ped,9) == Dataset["vest"]["item"] then
			SetPedComponentVariation(Ped,9,0,0,1)
		else
			SetPedComponentVariation(Ped,9,Dataset["vest"]["item"],Dataset["vest"]["texture"],1)
		end

		vRP.Destroy()
		Animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETPANTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setPants")
AddEventHandler("skinshop:setPants",function()
	if not Animation and not LocalPlayer["state"]["Buttons"] then
		Animation = true
		vRP.playAnim(true,{"clothingtie","try_tie_negative_a"},true)
		Wait(1000)

		local Ped = PlayerPedId()

		if GetPedDrawableVariation(Ped,4) == Dataset["pants"]["item"] then
			if GetEntityModel(Ped) == GetHashKey("mp_m_freemode_01") then
				SetPedComponentVariation(Ped,4,14,0,1)
			elseif GetEntityModel(Ped) == GetHashKey("mp_f_freemode_01") then
				SetPedComponentVariation(Ped,4,15,0,1)
			end
		else
			SetPedComponentVariation(Ped,4,Dataset["pants"]["item"],Dataset["pants"]["texture"],1)
		end

		vRP.Destroy()
		Animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETSHOES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setShoes")
AddEventHandler("skinshop:setShoes",function()
	if not Animation and not LocalPlayer["state"]["Buttons"] then
		Animation = true
		vRP.playAnim(true,{"clothingtie","try_tie_negative_a"},true)
		Wait(1000)

		local Ped = PlayerPedId()

		if GetPedDrawableVariation(Ped,6) == Dataset["shoes"]["item"] then
			SetPedComponentVariation(Ped,6,5,0,1)
		else
			SetPedComponentVariation(Ped,6,Dataset["shoes"]["item"],Dataset["shoes"]["texture"],1)
		end

		vRP.Destroy()
		Animation = false
	end
end)