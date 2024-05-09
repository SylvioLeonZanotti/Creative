-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Previous = nil
local Treatment = false
local TreatmentTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- BEDS
-----------------------------------------------------------------------------------------------------------------------------------------
local Beds = {
	-- Medical Center Sul
	{ ["Coords"] = vec3(1126.41,-1562.6,34.9), ["Heading"] = 0.0 },
	{ ["Coords"] = vec3(1123.64,-1562.59,34.9), ["Heading"] = 0.0 },
	{ ["Coords"] = vec3(1121.0,-1562.59,34.9), ["Heading"] = 0.0 },
	{ ["Coords"] = vec3(1121.65,-1553.35,34.9), ["Heading"] = 0.0 },
	{ ["Coords"] = vec3(1124.4,-1553.36,34.9), ["Heading"] = 0.0 },
	{ ["Coords"] = vec3(1127.33,-1553.35,34.9), ["Heading"] = 0.0 },
	{ ["Coords"] = vec3(1126.69,-1547.41,34.9), ["Heading"] = 175.75 },
	{ ["Coords"] = vec3(1123.64,-1547.41,34.9), ["Heading"] = 175.75 },
	{ ["Coords"] = vec3(1120.52,-1547.41,34.9), ["Heading"] = 175.75 },
	{ ["Coords"] = vec3(1121.1,-1538.06,34.9), ["Heading"] = 175.75 },
	{ ["Coords"] = vec3(1124.16,-1538.06,34.9), ["Heading"] = 175.75 },
	{ ["Coords"] = vec3(1127.16,-1538.07,34.9), ["Heading"] = 175.75 },
	{ ["Coords"] = vec3(-668.3,321.73,87.92), ["Heading"] = 175.01, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-665.38,321.5,87.92), ["Heading"] = 175.01, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-662.67,321.23,87.92), ["Heading"] = 175.01, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-659.93,321.04,87.92), ["Heading"] = 175.01, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-657.01,320.77,87.92), ["Heading"] = 175.01, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-657.92,314.42,87.92), ["Heading"] = 355.0, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-661.01,314.42,87.92), ["Heading"] = 355.0, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-663.84,314.7,87.92), ["Heading"] = 355.0, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-667.05,314.9,87.92), ["Heading"] = 355.0, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-671.58,315.3,87.92), ["Heading"] = 355.0, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-676.24,315.7,87.92), ["Heading"] = 355.0, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-680.9,320.23,87.92), ["Heading"] = 265.0, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-680.55,324.8,87.92), ["Heading"] = 265.0, ["Distance"] = 1.25 },

	{ ["Coords"] = vec3(-684.31,350.09,82.98), ["Heading"] = 175.01, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-685.63,350.29,82.98), ["Heading"] = 175.01, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-694.84,347.52,82.98), ["Heading"] = 265.0, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-695.33,341.26,82.98), ["Heading"] = 265.0, ["Distance"] = 1.25 },

	{ ["Coords"] = vec3(-649.22,318.53,88.03), ["Heading"] = 355.0, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(-648.49,327.05,88.03), ["Heading"] = 175.01, ["Distance"] = 1.25 },

	{ ["Coords"] = vec3(-661.3,336.23,87.83), ["Heading"] = 175.01, ["Distance"] = 1.25 },

	{ ["Coords"] = vec3(-669.7,336.9,88.03), ["Heading"] = 355.0, ["Distance"] = 1.25 },
	-- Medical Center Norte
	{ ["Coords"] = vec3(1824.76,3681.69,34.19), ["Heading"] = 209.77 },
	{ ["Coords"] = vec3(1827.86,3683.42,34.19), ["Heading"] = 209.77 },
	{ ["Coords"] = vec3(1830.23,3679.29,34.19), ["Heading"] = 25.52 },
	{ ["Coords"] = vec3(1827.29,3677.57,34.19), ["Heading"] = 25.52 },
	-- Boolingbroke
	{ ["Coords"] = vec3(1761.87,2591.56,45.66), ["Heading"] = 272.13 },
	{ ["Coords"] = vec3(1761.87,2594.64,45.66), ["Heading"] = 272.13 },
	{ ["Coords"] = vec3(1761.87,2597.73,45.66), ["Heading"] = 272.13 },
	{ ["Coords"] = vec3(1771.98,2597.95,45.66), ["Heading"] = 87.88 },
	{ ["Coords"] = vec3(1771.98,2594.88,45.66), ["Heading"] = 87.88 },
	{ ["Coords"] = vec3(1771.98,2591.79,45.66), ["Heading"] = 87.88 },
	-- Clandestine
	{ ["Coords"] = vec3(-471.87,6287.56,13.63), ["Heading"] = 53.86 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number,v in pairs(Beds) do
		AddBoxZone("Beds:"..Number,v["Coords"],1.0,1.0,{
			name = "Beds:"..Number,
			heading = v["Heading"],
			minZ = v["Coords"]["z"] - 0.01,
			maxZ = v["Coords"]["z"] + 0.01
		},{
			shop = Number,
			Distance = 1.25,
			options = {
				{
					event = "target:PutBed",
					label = "Deitar",
					tunnel = "client"
				},{
					event = "target:Treatment",
					label = "Tratamento",
					tunnel = "client"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:PUTBED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:PutBed")
AddEventHandler("target:PutBed",function(Number)
	if not Previous then
		local Ped = PlayerPedId()
		Previous = GetEntityCoords(Ped)
		SetEntityCoords(Ped,Beds[Number]["Coords"]["x"],Beds[Number]["Coords"]["y"],Beds[Number]["Coords"]["z"] - 1,false,false,false,false)
		vRP.playAnim(false,{"anim@gangops@morgue@table@","body_search"},true)
		SetEntityHeading(Ped,Beds[Number]["Heading"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:UPBED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:UpBed")
AddEventHandler("target:UpBed",function()
	if Previous then
		local Ped = PlayerPedId()
		SetEntityCoords(Ped,Previous["x"],Previous["y"],Previous["z"] - 1,false,false,false,false)
		Previous = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:TREATMENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:Treatment")
AddEventHandler("target:Treatment",function(Number)
	if not Previous then
		if vSERVER.CheckIn() then
			local Ped = PlayerPedId()
			Previous = GetEntityCoords(Ped)
			SetEntityCoords(Ped,Beds[Number]["Coords"]["x"],Beds[Number]["Coords"]["y"],Beds[Number]["Coords"]["z"] - 1,false,false,false,false)
			vRP.playAnim(false,{"anim@gangops@morgue@table@","body_search"},true)
			SetEntityHeading(Ped,Beds[Number]["Heading"])

			TriggerEvent("inventory:preventWeapon",true)
			LocalPlayer["state"]["Commands"] = true
			LocalPlayer["state"]["Cancel"] = true
			TriggerEvent("paramedic:Reset")

			if GetEntityHealth(Ped) <= 100 then
				exports["survival"]:Revive(101)
			end

			Treatment = true
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTTREATMENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:StartTreatment")
AddEventHandler("target:StartTreatment",function()
	if not Treatment then
		LocalPlayer["state"]["Commands"] = true
		LocalPlayer["state"]["Cancel"] = true
		Treatment = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBEDS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		if Previous and not IsEntityPlayingAnim(Ped,"anim@gangops@morgue@table@","body_search",3) then
			SetEntityCoords(Ped,Previous["x"],Previous["y"],Previous["z"] - 1,false,false,false,false)
			Previous = nil
		end

		Citizen.Wait(10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTREATMENT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		if Treatment then
			if GetGameTimer() >= TreatmentTimer then
				local Ped = PlayerPedId()
				local Health = GetEntityHealth(Ped)
				TreatmentTimer = GetGameTimer() + 1000

				if Health < 200 then
					SetEntityHealth(Ped,Health + 1)
				else
					Treatment = false
					LocalPlayer["state"]["Cancel"] = false
					LocalPlayer["state"]["Commands"] = false
					TriggerEvent("Notify","amarelo","Tratamento concluido.",5000)
				end
			end
		end

		Wait(1000)
	end
end)