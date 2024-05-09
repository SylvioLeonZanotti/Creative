-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Weapon = ""
local Timer = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
local Drunk = 0
local DrunkTimer = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENERGETIC
-----------------------------------------------------------------------------------------------------------------------------------------
local Energetic = 0
local EnergeticTimer = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- COCAINE
-----------------------------------------------------------------------------------------------------------------------------------------
local Cocaine = 0
local CocaineTimer = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- METHAMPHETAMINE
-----------------------------------------------------------------------------------------------------------------------------------------
local Methamphetamine = 0
local MethamphetamineTimer = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- METADONE
-----------------------------------------------------------------------------------------------------------------------------------------
local Metadone = 0
local MetadoneTimer = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- HEROIN
-----------------------------------------------------------------------------------------------------------------------------------------
local Heroin = 0
local HeroinTimer = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRACK
-----------------------------------------------------------------------------------------------------------------------------------------
local Crack = 0
local CrackTimer = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- JOINT
-----------------------------------------------------------------------------------------------------------------------------------------
local Joint = 0
local JointTimer = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- OXYCONTIN
-----------------------------------------------------------------------------------------------------------------------------------------
local Oxycontin = 0
local OxycontinTimer = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		local Ped = PlayerPedId()

		if not IsPedInAnyVehicle(Ped) then
			local Progress = 500
			local Pid = PlayerId()
			local Entitys = ClosestPed(2)
			if Entitys and not Entity(Entitys)["state"]["Drugs"] then
				TimeDistance = 1

				if IsControlJustPressed(1,38) and GetVehiclePedIsIn(Entitys,true) == 0 and GetGameTimer() >= Timer and vSERVER.CheckDrugs() then
					Timer = GetGameTimer() + 5000

					ClearPedTasks(Entitys)
					ClearPedSecondaryTask(Entitys)
					ClearPedTasksImmediately(Entitys)

					TaskSetBlockingOfNonTemporaryEvents(Entitys,true)
					SetBlockingOfNonTemporaryEvents(Entitys,true)
					SetEntityAsMissionEntity(Entitys,true,true)
					SetPedDropsWeaponsWhenDead(Entitys,false)
					SetPedSuffersCriticalHits(Entitys,false)
					TaskTurnPedToFaceEntity(Entitys,Ped,0.0)

					LocalPlayer["state"]:set("Buttons",true,true)
					LocalPlayer["state"]:set("Commands",true,true)
					Entity(Entitys)["state"]:set("Drugs",true,true)

					SetTimeout(1000,function()
						if LoadAnim("jh_1_ig_3-2") then
							TaskPlayAnim(Entitys,"jh_1_ig_3-2","cs_jewelass_dual-2",4.0,4.0,-1,16,0,0,0,0)
						end
					end)

					while true do
						local Ped = PlayerPedId()
						local Coords = GetEntityCoords(Ped)
						local EntityCoords = GetEntityCoords(Entitys)

						if #(Coords - EntityCoords) <= 2 then
							Progress = Progress - 1

							if Progress <= 0 and LoadModel("prop_anim_cash_note") then
								local Object = CreateObject("prop_anim_cash_note",Coords["x"],Coords["y"],Coords["z"],false,false,false)
								AttachEntityToEntity(Object,Entitys,GetPedBoneIndex(Entitys,28422),0.0,0.0,0.0,90.0,0.0,0.0,false,false,false,false,2,true)
								vRP.CreateObjects("mp_safehouselost@","package_dropoff","prop_paper_bag_small",16,28422,0.0,-0.05,0.05,180.0,0.0,0.0)
								SetModelAsNoLongerNeeded("prop_anim_cash_note")

								if LoadAnim("mp_safehouselost@") then
									TaskPlayAnim(Entitys,"mp_safehouselost@","package_dropoff",4.0,4.0,-1,16,0,0,0,0)
								end

								Wait(3000)

								if DoesEntityExist(Object) then
									DeleteEntity(Object)
								end

								ClearPedSecondaryTask(Entitys)
								TaskWanderStandard(Entitys,10.0,10)
								SetEntityAsNoLongerNeeded(Entitys)
								vSERVER.PaymentDrugs()
								vRP.Destroy()

								LocalPlayer["state"]:set("Buttons",false,true)
								LocalPlayer["state"]:set("Commands",false,true)

								if math.random(100) >= 75 then
									SetTimeout(5000,function()
										SetPedRelationshipGroupHash(Entitys,GetHashKey("HATES_PLAYER"))
										TaskCombatPed(Entitys,Ped,0,16)
									end)
								end

								break
							end
						else
							ClearPedSecondaryTask(Entitys)
							TaskWanderStandard(Entitys,10.0,10)
							SetEntityAsNoLongerNeeded(Entitys)

							LocalPlayer["state"]:set("Buttons",false,true)
							LocalPlayer["state"]:set("Commands",false,true)

							if math.random(100) >= 50 then
								SetTimeout(5000,function()
									SetPedRelationshipGroupHash(Entitys,GetHashKey("HATES_PLAYER"))
									TaskCombatPed(Entitys,Ped,0,16)
								end)
							end

							break
						end

						Wait(1)
					end
				end
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOADANIMDIC
-----------------------------------------------------------------------------------------------------------------------------------------
function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSESTPED
-----------------------------------------------------------------------------------------------------------------------------------------
function ClosestPed(Radius)
	local Selected = false
	local Ped = PlayerPedId()
	local Radius = Radius + 0.0001
	local Coords = GetEntityCoords(Ped)
	local GamePool = GetGamePool("CPed")

	for _,Entity in pairs(GamePool) do
		if Entity ~= PlayerPedId() and not IsPedAPlayer(Entity) and not IsEntityDead(Entity) and not IsPedDeadOrDying(Entity,true) and NetworkGetEntityIsNetworked(Entity) and GetPedArmour(Entity) <= 0 and not IsPedInAnyVehicle(Entity) and GetPedType(Entity) ~= 28 then
			local EntityCoords = GetEntityCoords(Entity)
			local EntityDistance = #(Coords - EntityCoords)

			if EntityDistance < Radius then
				Radius = EntityDistance
				Selected = Entity
			end
		end
	end

	return Selected
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LEAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Lean")
AddEventHandler("Lean",function()
	if AnimpostfxIsRunning("Dont_tazeme_bro") then
		AnimpostfxStop("Dont_tazeme_bro")
	end

	if AnimpostfxIsRunning("MinigameTransitionIn") then
		AnimpostfxStop("MinigameTransitionIn")
	end

	if AnimpostfxIsRunning("Dont_tazeme_bro") then
		AnimpostfxStop("Dont_tazeme_bro")
	end

	if AnimpostfxIsRunning("DrugsDrivingOut") then
		AnimpostfxStop("DrugsDrivingOut")
	end

	if AnimpostfxIsRunning("DeathFailMPDark") then
		AnimpostfxStop("DeathFailMPDark")
	end

	if AnimpostfxIsRunning("DrugsMichaelAliensFight") then
		AnimpostfxStop("DrugsMichaelAliensFight")
	end

	if AnimpostfxIsRunning("HeistCelebPassBW") then
		AnimpostfxStop("HeistCelebPassBW")
	end

	if AnimpostfxIsRunning("DeathFailMPIn") then
		AnimpostfxStop("DeathFailMPIn")
	end

	if AnimpostfxIsRunning("DrugsMichaelAliensFight") then
		AnimpostfxStop("DrugsMichaelAliensFight")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENERGETIC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Energetic")
AddEventHandler("Energetic",function(Timer,Number)
	Energetic = Energetic + Timer
	SetRunSprintMultiplierForPlayer(PlayerId(),Number)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COCAINE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Cocaine")
AddEventHandler("Cocaine",function()
	if AnimpostfxIsRunning("MinigameTransitionIn") then
		AnimpostfxStop("MinigameTransitionIn")
	end

	AnimpostfxPlay("MinigameTransitionIn",0,true)
	Cocaine = Cocaine + 30
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- METHAMPHETAMINE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Methamphetamine")
AddEventHandler("Methamphetamine",function()
	if AnimpostfxIsRunning("Dont_tazeme_bro") then
		AnimpostfxStop("Dont_tazeme_bro")
	end

	AnimpostfxPlay("Dont_tazeme_bro",0,true)
	Methamphetamine = Methamphetamine + 30
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Drunk")
AddEventHandler("Drunk",function()
	if AnimpostfxIsRunning("DrugsDrivingOut") then
		AnimpostfxStop("DrugsDrivingOut")
	end

	AnimpostfxPlay("DrugsDrivingOut",0,true)
	Drunk = Drunk + 120

	if not LocalPlayer["state"]["Walk"] then
		LocalPlayer["state"]:set("Walk","move_m@drunk@verydrunk",false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- METADONE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Metadone")
AddEventHandler("Metadone",function()
	if AnimpostfxIsRunning("DeathFailMPDark") then
		AnimpostfxStop("DeathFailMPDark")
	end

	AnimpostfxPlay("DeathFailMPDark",90000,false)

	if not LocalPlayer["state"]["Megazord"] then
		LocalPlayer["state"]:set("Megazord",true,false)
	end

	SetPlayerMeleeWeaponDamageModifier(PlayerId(),1.1)
	SetPlayerWeaponDamageModifier(PlayerId(),1.1)
	SetAiMeleeWeaponDamageModifier(7.5)
	SetAiWeaponDamageModifier(0.75)
	Metadone = Metadone + 600
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HEROIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Heroin")
AddEventHandler("Heroin",function()
	if AnimpostfxIsRunning("DrugsMichaelAliensFight") then
		AnimpostfxStop("DrugsMichaelAliensFight")
	end

	AnimpostfxPlay("DrugsMichaelAliensFight",90000,false)
	SetEntityMaxHealth(PlayerPedId(),250)
	SetPedMaxHealth(PlayerPedId(),250)
	TriggerEvent("Health")

	Heroin = 900
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRACK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Crack")
AddEventHandler("Crack",function()
	if AnimpostfxIsRunning("HeistCelebPassBW") then
		AnimpostfxStop("HeistCelebPassBW")
	end

	AnimpostfxPlay("HeistCelebPassBW",90000,false)
	TriggerEvent("Hunger",180000)
	TriggerEvent("Thirst",180000)
	Crack = 900
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- JOINT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Joint")
AddEventHandler("Joint",function()
	if AnimpostfxIsRunning("DeathFailMPIn") then
		AnimpostfxStop("DeathFailMPIn")
	end

	AnimpostfxPlay("DeathFailMPIn",0,true)
	Joint = Joint + 30
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OXYCONTIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Oxycontin")
AddEventHandler("Oxycontin",function()
	if AnimpostfxIsRunning("DrugsMichaelAliensFight") then
		AnimpostfxStop("DrugsMichaelAliensFight")
	end

	AnimpostfxPlay("DrugsMichaelAliensFight",0,true)
	Oxycontin = 30
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADMETH
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local Pid = PlayerId()
		local Ped = PlayerPedId()

		if Energetic > 0 and GetGameTimer() >= EnergeticTimer then
			Energetic = Energetic - 1
			RestorePlayerStamina(Pid,1.0)
			EnergeticTimer = GetGameTimer() + 1000

			if Energetic <= 0 or GetEntityHealth(Ped) <= 100 then
				if AnimpostfxIsRunning("HeistTripSkipFade") then
					AnimpostfxStop("HeistTripSkipFade")
				end

				if AnimpostfxIsRunning("MinigameTransitionIn") then
					AnimpostfxStop("MinigameTransitionIn")
				end

				SetRunSprintMultiplierForPlayer(Pid,1.0)
				EnergeticTimer = GetGameTimer()
				Energetic = 0
			end
		end

		if Drunk > 0 and GetGameTimer() >= DrunkTimer then
			Drunk = Drunk - 1
			DrunkTimer = GetGameTimer() + 1000

			if Drunk <= 0 or GetEntityHealth(Ped) <= 100 then
				if AnimpostfxIsRunning("DrugsDrivingOut") then
					AnimpostfxStop("DrugsDrivingOut")
				end

				if LocalPlayer["state"]["Walk"] then
					LocalPlayer["state"]:set("Walk",false,false)
				end

				DrunkTimer = GetGameTimer()
				Drunk = 0
			end
		end

		if Cocaine > 0 and GetGameTimer() >= CocaineTimer then
			Cocaine = Cocaine - 1
			CocaineTimer = GetGameTimer() + 1000

			if Cocaine <= 0 or GetEntityHealth(Ped) <= 100 then
				if AnimpostfxIsRunning("MinigameTransitionIn") then
					AnimpostfxStop("MinigameTransitionIn")
				end

				CocaineTimer = GetGameTimer()
				Cocaine = 0
			end
		end

		if Methamphetamine > 0 and GetGameTimer() >= MethamphetamineTimer then
			Methamphetamine = Methamphetamine - 1
			MethamphetamineTimer = GetGameTimer() + 1000

			if Methamphetamine <= 0 or GetEntityHealth(Ped) <= 100 then
				if AnimpostfxIsRunning("Dont_tazeme_bro") then
					AnimpostfxStop("Dont_tazeme_bro")
				end

				MethamphetamineTimer = GetGameTimer()
				Methamphetamine = 0
			end
		end

		if Metadone > 0 and GetGameTimer() >= MetadoneTimer then
			Metadone = Metadone - 1
			MetadoneTimer = GetGameTimer() + 1000

			if Metadone <= 0 or GetEntityHealth(Ped) <= 100 then
				if AnimpostfxIsRunning("DeathFailMPDark") then
					AnimpostfxStop("DeathFailMPDark")
				end

				Metadone = 0
				MetadoneTimer = GetGameTimer()
				SetAiWeaponDamageModifier(0.5)
				SetAiMeleeWeaponDamageModifier(5.0)
				SetPlayerWeaponDamageModifier(Pid,1.0)
				SetPlayerMeleeWeaponDamageModifier(Pid,1.0)
				LocalPlayer["state"]:set("Megazord",false,false)
			end
		end

		if Heroin > 0 and GetGameTimer() >= HeroinTimer then
			Heroin = Heroin - 1
			HeroinTimer = GetGameTimer() + 1000

			if Heroin <= 0 or GetEntityHealth(Ped) <= 100 then
				if AnimpostfxIsRunning("DrugsMichaelAliensFight") then
					AnimpostfxStop("DrugsMichaelAliensFight")
				end

				HeroinTimer = GetGameTimer()
				SetEntityMaxHealth(Ped,200)
				SetPedMaxHealth(Ped,200)
				TriggerEvent("Health")
				Heroin = 0
			end
		end

		if Crack > 0 and GetGameTimer() >= CrackTimer then
			Crack = Crack - 1
			CrackTimer = GetGameTimer() + 1000

			if Crack <= 0 or GetEntityHealth(Ped) <= 100 then
				if AnimpostfxIsRunning("HeistCelebPassBW") then
					AnimpostfxStop("HeistCelebPassBW")
				end

				TriggerEvent("Hunger",90000)
				TriggerEvent("Thirst",90000)
				CrackTimer = GetGameTimer()
				Crack = 0
			end
		end

		if Joint > 0 and GetGameTimer() >= JointTimer then
			Joint = Joint - 1
			JointTimer = GetGameTimer() + 1000

			if Joint <= 0 or GetEntityHealth(Ped) <= 100 then
				if AnimpostfxIsRunning("DeathFailMPIn") then
					AnimpostfxStop("DeathFailMPIn")
				end

				if LocalPlayer["state"]["Walk"] then
					LocalPlayer["state"]:set("Walk",false,false)
				end

				SetRunSprintMultiplierForPlayer(Pid,1.0)
				JointTimer = GetGameTimer()
				Joint = 0
			end
		end

		if Oxycontin > 0 and GetGameTimer() >= OxycontinTimer then
			Oxycontin = Oxycontin - 1
			OxycontinTimer = GetGameTimer() + 1000

			if Oxycontin <= 0 or GetEntityHealth(Ped) <= 100 then
				if AnimpostfxIsRunning("DrugsMichaelAliensFight") then
					AnimpostfxStop("DrugsMichaelAliensFight")
				end

				OxycontinTimer = GetGameTimer()
				Oxycontin = 0
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Weapon",function(Value)
	Weapon = Value
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:DRUGSBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:DrugsBlips")
AddEventHandler("inventory:DrugsBlips",function(Coords)
	local Blip = AddBlipForCoord(Coords["x"],Coords["y"],Coords["z"])
	SetBlipSprite(Blip,126)
	SetBlipDisplay(Blip,4)
	SetBlipHighDetail(Blip,true)
	SetBlipAsShortRange(Blip,true)
	SetBlipColour(Blip,5)
	SetBlipScale(Blip,1.0)
	SetBlipFlashes(Blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Traficante Procurado")
	EndTextCommandSetBlipName(Blip)

	SetTimeout(10000,function()
		if DoesBlipExist(Blip) then
			RemoveBlip(Blip)
		end
	end)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PRÓXIMO À PORTA
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.checkNearDoor(vehNet)
	if NetworkDoesEntityExistWithNetworkId(vehNet) then
		local veh = NetToVeh(vehNet)
		local doorBone = GetEntityBoneIndexByName(veh,"door_dside_f")
		if doorBone ~= -1 then
			local doorCds = GetWorldPositionOfEntityBone(veh,doorBone)
			return #(GetEntityCoords(PlayerPedId())-doorCds) <= 1.5
		else
			return true
		end
	end
	return false
end


-- Chaiking algorithm --
local function chaikin(dest, points, iterations)
	local result = {}

	for i = 1, #points - 1 do
		result[#result + 1] = points[i]
		result[#result + 1] = vec3((points[i].x + points[i + 1].x) / 2, (points[i].y + points[i + 1].y) / 2, (points[i].z + points[i + 1].z) / 2)
	end

	result[#result + 1] = points[#points]

	if iterations > 1 then
		chaikin(dest, result, iterations - 1)
	else
		dest.points = result
	end

end

-- Draw curve --
local function draw_curve(points, particleDict, particleSet, scale, insertionTable)
	insertionTable = {}
	for i = 1, #points - 1 do
		local random_offset_x = math.random(-1, 1)
		local random_offset_y = math.random(-1, 2)
		local random_offset_z = math.random(-1, 2)

		local distance = math.sqrt(random_offset_x * random_offset_x + random_offset_y * random_offset_y)
		random_offset_x = random_offset_x / distance * 2
		random_offset_y = random_offset_y / distance * 2

		UseParticleFxAssetNextCall(particleDict)
		local fx = StartParticleFxLoopedAtCoord(particleSet, points[i].x + random_offset_x, points[i].y + random_offset_y, points[i].z + random_offset_z, 0.0, 0.0, 0.0, scale, false, false, false, false)
		
		table.insert(insertionTable, fx)
	end

	Wait(500)

	for i = 1, #insertionTable do
		StopParticleFxLooped(insertionTable[i], 0)
	end
end


local function quickFadeIn()
	DoScreenFadeOut(1000)
	Wait(1000)
	DoScreenFadeIn(1000)
end

local function LoadModelProperly(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
end

local function LoadAnimationDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(0)
	end
end

local function LoadNamedPtfxAsset(asset)
    if not HasNamedPtfxAssetLoaded(asset) then
        RequestNamedPtfxAsset(asset)

        while not HasNamedPtfxAssetLoaded(asset) do
            Wait(0)
        end
    end
end

-- hallucinogenic chicken weed effect --
RegisterNetEvent('inventory:client:hallucinogenic_chicken_weed', function()
	local playerPed = PlayerPedId()
	local playerHeading = GetEntityHeading(playerPed)
	local chickenModelHash = GetHashKey("a_c_hen")
	local playerForward, playerRight, _, _ = GetEntityMatrix(playerPed)
	local PlaceObjectOnGroundOrObjectProperly = PlaceObjectOnGroundProperly_2

	local chickenParticles = {}
	local chickenPeds = {}
	local chickenFx = {	dict = 'core', particle = 'ent_sht_feathers' }
	local chickenSpawnCoords = {
		playerForward = playerForward * 2.0,
		playerBackwards = playerForward * -2.0,
		playerLeft = playerRight * -2.0,
		playerRight = playerRight * 2.0
	}
	local chickenAnim = {
		dict = 'anim@mp_player_intcelebrationfemale@chicken_taunt',
		anim = 'chicken_taunt'
	}

	-- Chicken creation --
	LoadModelProperly(chickenModelHash)

	-- Chicken animation --
	LoadAnimationDict(chickenAnim.dict)

	-- Chicken particles --
	LoadNamedPtfxAsset(chickenFx.dict)

	local pedCoords = GetEntityCoords(playerPed)
	
	if not IsEntityPlayingAnim(playerPed, chickenAnim.dict, chickenAnim.anim, 3) then
		TaskPlayAnim(playerPed, chickenAnim.dict, chickenAnim.anim, 8.0, 8.0, -1, 1, 0, false, false, false)
	end

	Wait(3000)
	StopAnimTask(playerPed, chickenAnim.dict, chickenAnim.anim, 3.0)
	quickFadeIn()

	for i = 1, 5 do
		for _, value in pairs(chickenSpawnCoords) do

			-- Chicken creation
			local spawnCoords = pedCoords + value
			table.insert(chickenPeds, CreatePed(29, chickenModelHash, spawnCoords, playerHeading, false, false, false))
			local chickenPed = chickenPeds[#chickenPeds]
	
			-- Chicken assets
			PlaceObjectOnGroundOrObjectProperly(chickenPed)
			SetPtfxAssetNextCall(chickenFx.dict)
			table.insert(chickenParticles, StartParticleFxLoopedOnEntity(chickenFx.particle, chickenPed, vec3(0.0, 0.0, 0.0), vec3(0.0, 0.0, 0.0), 4.0, false, false, false))
		end
	end
	
	-- Follow task thread
	local cooldown = GetGameTimer() + (30 * 1000)
	Citizen.CreateThread(function()
		while true do
			
			for i = 1, #chickenPeds do
				local chickenPed = chickenPeds[i]

				if DoesEntityExist(chickenPed) then
					TaskGoToEntity(chickenPed, playerPed, -1, 1.0, 2.0, 0, 0)
				end

			end

			local curve = {}
			local playerCoords = GetEntityCoords(playerPed)
			local playerForward = GetEntityForwardVector(playerPed)

			chaikin(curve, { playerCoords, playerCoords + playerForward }, 4)
			draw_curve(curve.points, chickenFx.dict, chickenFx.particle, 3.0)

			if GetGameTimer() > cooldown then

				for i = 1, #chickenPeds do
					local chickenPed = chickenPeds[i]
			
					if DoesEntityExist(chickenPed) then
						SetEntityAsNoLongerNeeded(chickenPed)
						DeleteEntity(chickenPed)
						chickenPeds[i] = nil
					end
				end

				break
			end

			Citizen.Wait(1000)
		end
	end)

	exports['hud']:handleTimeSync(false)
	SetWeatherTypeNow("HALLOWEEN")
	SetWeatherTypePersist("HALLOWEEN")
	SetWeatherTypeNowPersist("HALLOWEEN")
	
	-- Camera effects
	while #chickenPeds > 1 do
		Wait(0)
	end

	if not IsEntityPlayingAnim(playerPed, chickenAnim.dict, chickenAnim.anim, 3) then
		TaskPlayAnim(playerPed, chickenAnim.dict, chickenAnim.anim, 8.0, 8.0, -1, 1, 0, false, false, false)
	end

	Wait(3000)
	StopAnimTask(playerPed, chickenAnim.dict, chickenAnim.anim, 3.0)

	quickFadeIn()

	SetModelAsNoLongerNeeded(chickenModelHash)
	RemoveNamedPtfxAsset(chickenFx.dict)
	RemoveAnimDict(chickenAnim.dict)

	TriggerEvent('Notify', 'amarelo', 'Você conseguiu escapar do frango.', 5000)
	exports['hud']:handleTimeSync(true)
end)

-- Hallucinogenic Pug Weed --
RegisterNetEvent('inventory:client:hallucinogenic_pug_weed', function()
	local playerPed = PlayerPedId()
	local playerHeading = GetEntityHeading(playerPed)
	local pugModelHash = GetHashKey("a_c_pug")
	local playerForward, playerRight, _, _ = GetEntityMatrix(playerPed)
	local PlaceObjectOnGroundOrObjectProperly = PlaceObjectOnGroundProperly_2

	local pugParticles = {}
	local pugPeds = {}
	local pugFx = {	dict = 'scr_rcbarry1', particle = 'scr_alien_teleport' }
	local pugSpawnCoords = {
		playerForward = playerForward * 2.0,
		playerBackwards = playerForward * -2.0,
		playerLeft = playerRight * -2.0,
		playerRight = playerRight * 2.0
	}
	local dogAnimation = {
		dict = 'missfam4leadinoutmcs2',
		anim = 'tracy_loop'
	}

	-- Pug creation --
	LoadModelProperly(pugModelHash)

	-- Pug animation --
	LoadAnimationDict(dogAnimation.dict)

	-- Pug particles --
	LoadNamedPtfxAsset(pugFx.dict)

	if not IsEntityPlayingAnim(playerPed, dogAnimation.dict, dogAnimation.anim, 3) then
		TaskPlayAnim(playerPed, dogAnimation.dict, dogAnimation.anim, 8.0, 8.0, -1, 1, 0, false, false, false)
	end


	Wait(3000)
	StopAnimTask(playerPed, dogAnimation.dict, dogAnimation.anim, 3.0)
	quickFadeIn()

	local pedCoords = GetEntityCoords(playerPed)

	for i = 1, 4 do
		for _, value in pairs(pugSpawnCoords) do

			-- Pug creation
			local spawnCoords = pedCoords + value
			table.insert(pugPeds, CreatePed(29, pugModelHash, spawnCoords, playerHeading, false, false, false))
			local pugPed = pugPeds[#pugPeds]
	
			-- Pug assets
			PlaceObjectOnGroundOrObjectProperly(pugPed)
			SetPtfxAssetNextCall(pugFx.dict)
			table.insert(pugParticles, StartParticleFxLoopedOnEntity(pugFx.particle, pugPed, vec3(0.0, 0.0, 0.0), vec3(0.0, 0.0, 0.0), 0.5, false, false, false))
		end
	end

	-- Follow task thread
	local cooldown = GetGameTimer() + (30 * 1000)
	Citizen.CreateThread(function()
		while true do
			
			for i = 1, #pugPeds do
				local pugPed = pugPeds[i]

				if DoesEntityExist(pugPed) then
					TaskGoToEntity(pugPed, playerPed, -1, 1.0, 2.0, 1073741824, 0)
				end

			end

			local curve = {}
			local playerCoords = GetEntityCoords(playerPed)
			local playerForward = GetEntityForwardVector(playerPed)

			chaikin(curve, { playerCoords, playerCoords + playerForward }, 4)
			draw_curve(curve.points, pugFx.dict, pugFx.particle, 0.5)

			if GetGameTimer() > cooldown then
				quickFadeIn()

				for i = 1, #pugPeds do
					local pugPed = pugPeds[i]
			
					if DoesEntityExist(pugPed) then
						SetEntityAsNoLongerNeeded(pugPed)
						DeleteEntity(pugPed)
						pugPeds[i] = nil
					end
				end

				break
			end

			Citizen.Wait(1000)
		end
	end)

	-- Camera effects
	while #pugPeds > 1 do
		Wait(0)
	end

	if not IsEntityPlayingAnim(playerPed, dogAnimation.dict, dogAnimation.anim, 3) then
		TaskPlayAnim(playerPed, dogAnimation.dict, dogAnimation.anim, 8.0, 8.0, -1, 1, 0, false, false, false)
	end

	Wait(3000)
	StopAnimTask(playerPed, dogAnimation.dict, dogAnimation.anim, 3.0)

	SetModelAsNoLongerNeeded(pugModelHash)
	RemoveNamedPtfxAsset(pugFx.dict)
	RemoveAnimDict(dogAnimation.dict)

	TriggerEvent('Notify', 'amarelo', 'Os pugs estão com saudades...', 7000)
end)

local function CreateMpPed(ped, custom)

end

-- Apply barbershop custom to ped -- 
local function ApplyBarbershopToPed(ped, custom)
    local weightFace = custom[2] / 100 + 0.0
    local weightSkin = custom[4] / 100 + 0.0

	SetPedHeadBlendData(ped,custom[41],custom[1],0,custom[41],custom[1],0,weightFace,weightSkin,0.0,false)

	SetPedEyeColor(ped,custom[3])

	if custom[5] == 0 then
		SetPedHeadOverlay(ped,0,custom[5],0.0)
	else
		SetPedHeadOverlay(ped,0,custom[5],1.0)
	end

	SetPedHeadOverlay(ped,6,custom[6],1.0)

	if custom[7] == 0 then
		SetPedHeadOverlay(ped,9,custom[7],0.0)
	else
		SetPedHeadOverlay(ped,9,custom[7],1.0)
	end

	SetPedHeadOverlay(ped,3,custom[8],1.0)

	SetPedComponentVariation(ped,2,custom[9],0,1)
	SetPedHairColor(ped,custom[10],custom[11])

	SetPedHeadOverlay(ped,4,custom[12],custom[13] * 0.1)
	SetPedHeadOverlayColor(ped,4,1,custom[14],custom[14])

	SetPedHeadOverlay(ped,8,custom[15],custom[16] * 0.1)
	SetPedHeadOverlayColor(ped,8,1,custom[17],custom[17])

	SetPedHeadOverlay(ped,2,custom[18],custom[19] * 0.1)
	SetPedHeadOverlayColor(ped,2,1,custom[20],custom[20])

	SetPedHeadOverlay(ped,1,custom[21],custom[22] * 0.1)
	SetPedHeadOverlayColor(ped,1,1,custom[23],custom[23])

	SetPedHeadOverlay(ped,5,custom[24],custom[25] * 0.1)
	SetPedHeadOverlayColor(ped,5,1,custom[26],custom[26])

	SetPedFaceFeature(ped,0,custom[27] * 0.1)
	SetPedFaceFeature(ped,1,custom[28] * 0.1)
	SetPedFaceFeature(ped,4,custom[29] * 0.1)
	SetPedFaceFeature(ped,6,custom[30] * 0.1)
	SetPedFaceFeature(ped,8,custom[31] * 0.1)
	SetPedFaceFeature(ped,9,custom[32] * 0.1)
	SetPedFaceFeature(ped,10,custom[33] * 0.1)
	SetPedFaceFeature(ped,12,custom[34] * 0.1)
	SetPedFaceFeature(ped,13,custom[35] * 0.1)
	SetPedFaceFeature(ped,14,custom[36] * 0.1)
	SetPedFaceFeature(ped,15,custom[37] * 0.1)
	SetPedFaceFeature(ped,16,custom[38] * 0.1)
	SetPedFaceFeature(ped,17,custom[39] * 0.1)
	SetPedFaceFeature(ped,19,custom[40] * 0.1)
end

-- Apply custom clothings to ped --
local function ApplyClothingToPed(ped, data, category)
	local item = data.item
	local texture = data.texture

	if category == "pants" then

		SetPedComponentVariation(ped, 4, item, 0, 1)
		SetPedComponentVariation(ped, 4, GetPedDrawableVariation(ped, 4), texture, 1)

	elseif category == "arms" then

		SetPedComponentVariation(ped, 3, item, 0, 1)
		SetPedComponentVariation(ped, 3, GetPedDrawableVariation(ped, 3), texture, 1)

	elseif category == "tshirt" then

		SetPedComponentVariation(ped, 8, item, 0, 1)
		SetPedComponentVariation(ped, 8, GetPedDrawableVariation(ped, 8), texture, 1)

	elseif category == "decals" then

		SetPedComponentVariation(ped, 10, item, 0, 1)
		SetPedComponentVariation(ped, 10, item, texture, 1)

	elseif category == "accessory" then

		SetPedComponentVariation(ped, 7, item, 0, 1)
		SetPedComponentVariation(ped, 7, item, texture, 1)

	elseif category == "torso" then

		SetPedComponentVariation(ped, 11, item, 0, 1)
		SetPedComponentVariation(ped, 11, GetPedDrawableVariation(ped, 11), texture, 1)

	elseif category == "shoes" then

		SetPedComponentVariation(ped, 6, item, 0, 1)
		SetPedComponentVariation(ped, 6, GetPedDrawableVariation(ped, 6), texture, 1)

	elseif category == "mask" then

		SetPedComponentVariation(ped, 1, item, 0, 1)
		SetPedComponentVariation(ped, 1, GetPedDrawableVariation(ped, 1), texture, 1)
	
	elseif category == "hat" then

		if item ~= -1 then
			SetPedPropIndex(ped, 0, item, texture, 1)
		else
			ClearPedProp(ped, 0)
		end

		SetPedPropIndex(ped, 0, item, texture, 1)

	elseif category == "glass" then

		if item ~= -1 then
			SetPedPropIndex(ped, 1, item, texture, 1)
		else
			ClearPedProp(ped, 1)
		end

		SetPedPropIndex(ped, 1, item, texture, 1)

	elseif category == "ear" then

		if item ~= -1 then
			SetPedPropIndex(ped, 2, item, texture, 1)
		else
			ClearPedProp(ped, 2)
		end

		SetPedPropIndex(ped, 2, item, texture, 1)
	
	elseif category == "watch" then

		if item ~= -1 then
			SetPedPropIndex(ped, 6, item, texture, 1)
		else
			ClearPedProp(ped, 6)
		end

		SetPedPropIndex(ped, 6, item, texture, 1)

	elseif category == "bracelet" then

		if item ~= -1 then
			SetPedPropIndex(ped, 7, item, texture, 1)
		else
			ClearPedProp(ped, 7)
		end

		SetPedPropIndex(ped, 7, item, texture, 1)

	end
end

-- Apply tattoos to ped --
local function ApplyTattoosToPed(ped, tattoos)
	for index, tatto in pairs(tattoos) do
		SetPedDecoration(ped, GetHashKey(tatto[1]), GetHashKey(index))
	end
end

-- Create MP ped --
local function CreateLocalPed(hash)
	RequestModel(hash)

	while not HasModelLoaded(hash) do
		Wait(0)
	end

	local ped = CreatePed(4, hash, GetEntityCoords(PlayerPedId()), false, false)

	return ped
end

-- Delete entity while using alpha -- 
local function DeleteEntityWhileUsingAlpha(entity)
	local alpha = 255

	while alpha > 0 do
		alpha = alpha - 1
		SetEntityAlpha(entity, alpha, false)
		Wait(0)
	end

	DeleteEntity(entity)
end

RegisterNetEvent('inventory:client:red_meth', function()
	local playerPed = PlayerPedId()
	local userPeds = {}
	local userVehicles = {}
	local cow = nil
	local isDrugRunning = false
	local pauloWalkStyle = "move_heist_lester"

	if hasGround then
		playerOffset = vector3(playerOffset.x, playerOffset.y, groundZ)
	end
	
	local paulaPliniaCustom = {
		pedModel = GetHashKey('mp_f_freemode_01'),
		offSet = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 5.0, 0.0),
		barbershop = { 43,0,0,100,21,7,17,14,0,0,0,6,10,33,8,10,33,27,10,0,9,4,0,4,10,23,10,-10,-10,10,10,10,0,-20,20,20,-20,20,20,20,24 },
		clothings = {
			pants = {item = 162, texture = 6},
			vest = {item = 0, texture = 0},
			arms = {item = 15, texture = 0},
			hat = {item = -1, texture = 0},
			shoes = {item = 20, texture = 4},
			glass = {item = -1, texture = 0},
			bracelet = {item = -1, texture = 0},
			accessory = {item = 167, texture = 0},
			watch = {item = -1, texture = 0},
			ear = {item = -1, texture = 0},
			torso = {item = 450, texture = 5},
			tshirt = {item = 15, texture = 0},
			mask = {item = 0, texture = 0},
			decals = {item = 0, texture = 0}
		}
	}

	local pauloPlinioCustom = {
		pedModel = GetHashKey('mp_m_freemode_01'),
		offSet = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, -5.0, 0.0),
		barbershop = { 43,0,12,100,0,0,0,0,34,0,0,39,10,62,8,10,22,34,10,0,23,0,0,0,0,25,10,-10,-10,10,10,10,20,-20,-20,20,-20,0,-20,20,45 },
		clothings = {
			["shoes"] = { item = 5, texture = 0 },
			["mask"] = { item = 0, texture = 0 },
			["pants"] = { item = 14, texture = 0 },
			["tshirt"] = { item = 15, texture = 0 },
			["torso"] = { item = 15, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["hat"] = { item = -1, texture = 0 },
			["arms"] = { item = 15, texture = 0 },
			["ear"] = { item = -1, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["accessory"] = { item = 0, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["decals"] = { item = 0, texture = 0 },
			["vest"] = { item = 0, texture = 0 }
		},
	}

	local cajuCustom = {
		pedModel = GetHashKey('mp_f_freemode_01'),
		offSet = GetOffsetFromEntityInWorldCoords(playerPed, 5.0, 0.0, 0.0),
		barbershop = { 8,0,8,100,0,5,4,15,218,17,4,7,0,49,3,9,19,2,10,3,0,0,0,0,4,21,1,0,-7,-1,-10,3,0,-7,6,6,-2,2,2,2,21 },
		clothings = { 
			["mask"] = { item = 183, texture = 1 },
			["watch"] = { item = -1, texture = 0 },
			["shoes"] = { item = 139, texture = 0 },
			["ear"] = { item = -1, texture = 0 },
			["hat"] = { item = 214, texture = 0 },
			["tshirt"] = { item = 207, texture = 0 },
			["pants"] = { item = 102, texture = 0 },
			["glass"] = { item = 55, texture = 2 },
			["torso"] = { item = 324, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["decals"] = { item = 15, texture = 0 },
			["arms"] = { item = 65, texture = 0 },
			["accessory"] = { item = 191, texture = 0 }
		},
		tattoos = {
			["FM_Tat_Award_F_001"] = { "multiplayer_overlays" },
			["MP_Gunrunning_Tattoo_020_F"] = { "mpgunrunning_overlays" },
			["MP_Gunrunning_Tattoo_013_F"] = { "mpgunrunning_overlays" },
			["FM_Tat_F_047"] = { "multiplayer_overlays" },
			["MP_Buis_F_Back_001"] = { "mpbusiness_overlays" },
			["FM_Tat_Award_F_004"] = { "multiplayer_overlays" },
			["MP_Smuggler_Tattoo_012_F"] = { "mpsmuggler_overlays" },
			["MP_Smuggler_Tattoo_020_F"] = { "mpsmuggler_overlays" },
			["MP_MP_Biker_Tat_002_F"] = { "mpbiker_overlays" },
			["MP_Gunrunning_Tattoo_008_F"] = { "mpgunrunning_overlays" },
			["FM_Tat_F_038"] = { "multiplayer_overlays" }
		}
	}

	local usersCustom = { 
		[2] = cajuCustom,
		[1208] = pauloPlinioCustom,
		[7392] = paulaPliniaCustom
	}

	SetPedToRagdoll(playerPed, 1000, 1000, 0, 0, 0, 0)
	-- Fade in/out
	DoScreenFadeOut(800)
	TriggerEvent('Notify', 'amarelo', 'Você sente uma terrível dor de cabeça.', 5000)

	exports['hud']:handleTimeSync(false)
		SetWeatherTypeNow("THUNDER")
		SetWeatherTypePersist("THUNDER")
		SetWeatherTypeNowPersist("THUNDER")

	-- Create peds
	for userID, user in pairs(usersCustom) do
		local userPed = CreateLocalPed(user.pedModel)
		userPeds[userID] = userPed

		if user.clothings then
			for index, clothing in pairs(user.clothings) do
				ApplyClothingToPed(userPed, clothing, index)
			end
		end
	
		if user.tattoos then
			ApplyTattoosToPed(userPed, user.tattoos)
		end
	
		if user.barbershop then
			ApplyBarbershopToPed(userPed, user.barbershop)
		end
	
		SetEntityCoordsNoOffset(userPed, user.offSet)
		SetBlockingOfNonTemporaryEvents(userPed, true)
		SetEntityInvincible(userPed, true)
		SetEntityHeading(userPed, GetEntityHeading(playerPed) - GetEntityHeading(userPed))
	end

	while IsScreenFadedOut() do
		Wait(0)
	end

	DoScreenFadeIn(450)


	-- Handle player ped
	SetGameplayCamRelativeHeading(0.0)	
	FreezeEntityPosition(playerPed, true)
	
	isDrugRunning = true
	Citizen.CreateThread(function()
		while isDrugRunning do
			
			DisableControlAction(0, 69, true) -- Disable attack

			Citizen.Wait(0)
		end
	end)

	-- Get Paula Plinio ped
	local paulaPlinioPed = userPeds[7392]
	if not DoesEntityExist(paulaPlinioPed) then
		return
	end

	-- Set ped walk style
	RequestAnimSet(pauloWalkStyle)
	while not HasAnimSetLoaded(pauloWalkStyle) do
		Wait(0)
	end

	SetPedMovementClipset(pauloPlinioPed, pauloWalkStyle, 0.25)
	RemoveClipSet(pauloWalkStyle)

	-- -- Get both ped coords
	local paulaPlinioHeading = GetEntityHeading(paulaPlinioPed)
	local paulaPlinioCoords = GetEntityCoords(paulaPlinioPed)
	local playerCoords = GetEntityCoords(playerPed)

	-- Wait for the distance between them to be close
	local cooldown = GetGameTimer() + 10000
	while #(paulaPlinioCoords - playerCoords) > 3.5 do
		paulaPlinioCoords = GetEntityCoords(paulaPlinioPed)
		playerCoords = GetEntityCoords(playerPed)

		TaskGoStraightToCoord(paulaPlinioPed, playerCoords, 1.0, 1000, 0.0, 0.0)

		if GetGameTimer() > cooldown then
			SetEntityCoords(paulaPlinioPed, playerCoords)
			return
		end

		Wait(0)
	end

	ClearPedTasks(paulaPlinioPed)

	-- Load animation that Paula will play
	local animDict = "missfam4leadinoutmcs2"
	local animSet = "tracy_loop"
	LoadAnimationDict(animDict)

	-- Play animation with custom sound
	TaskPlayAnim(paulaPlinioPed, animDict, animSet, 8.0, 8.0, -1, 1, 0, false, false, false)
	TriggerEvent('sounds:source', 'paulo_traira', 0.4)
	Wait(3000) -- Sound duration
	RemoveAnimDict(animDict)
	
	SetTimeout(400, function()
		TriggerEvent('sounds:source', 'paulo_traira_fdp', 0.4)
	end)

	Wait(7800) -- Sound duration

	if DoesEntityExist(paulaPlinioPed) then
		DeleteEntityWhileUsingAlpha(paulaPlinioPed)
	end


	-- Get Paulo Plinio ped
	local pauloPlinioPed = userPeds[1208]

	SetEntityHeading(playerPed, GetEntityHeading(playerPed) - 180)

	-- Set ped walk style
	SetPedMovementClipset(pauloPlinioPed, pauloWalkStyle, 0.25)
	RemoveClipSet(pauloWalkStyle)

	local pauloPlinioCoords = GetEntityCoords(pauloPlinioPed)
	local cooldown = GetGameTimer() + 10000
	while #(pauloPlinioCoords - playerCoords) > 2.5 do
		pauloPlinioCoords = GetEntityCoords(pauloPlinioPed)
		playerCoords = GetEntityCoords(playerPed)

		TaskGoStraightToCoord(pauloPlinioPed, playerCoords, 1.0, 1000, 0.0, 0.0)

		if GetGameTimer() > cooldown then
			SetEntityCoords(pauloPlinioPed, playerCoords)
			return
		end

		Wait(0)
	end
	
	-- Paulo Plinio animation
	local pauloAnimDict = "mini@strip_club@pole_dance@pole_dance2"
	local PauloAnimSet = "pd_dance_02"
	-- Player ped animation
	local playerAnimDict = "amb@world_human_cheering@male_d"
	local playerAnimSet = "base"

	LoadAnimationDict(pauloAnimDict)
	LoadAnimationDict(playerAnimDict)

	-- Play animations with custom sound
	TaskPlayAnim(pauloPlinioPed, pauloAnimDict, PauloAnimSet, 8.0, 8.0, -1, 1, 0, false, false, false)
	TaskPlayAnim(playerPed, playerAnimDict, playerAnimSet, 8.0, 8.0, -1, 1, 0, false, false, false)
	RemoveAnimDict(pauloAnimDict)
	RemoveAnimDict(playerAnimDict)
	
	-- Play sound
	TriggerEvent('sounds:source', 'luqueta_hoje_tem', 0.4)

	Wait(15000) -- 15 seconds of animation is enough

	-- Stop animations 
	StopAnimTask(pauloPlinioPed, pauloAnimDict, PauloAnimSet, 1.0)
	StopAnimTask(playerPed, playerAnimDict, playerAnimSet, 1.0)

	-- Give Paulo Plinio a shotgun
	local shotgunHash = GetHashKey("weapon_pumpshotgun")
	GiveWeaponToPed(pauloPlinioPed, shotgunHash, 10, false, true)
	SetCurrentPedWeapon(pauloPlinioPed, shotgunHash, true)

	-- Prepare player to combat
	local oldHealth = GetEntityHealth(playerPed)
	local oldArmour = GetPedArmour(playerPed)
	SetEntityHealth(playerPed, 101) -- Just enough for the player to get hit killed
	SetPedArmour(playerPed, 0)

	-- Shoot the player
	TaskAimGunAtEntity(pauloPlinioPed, playerPed, -1, false)
	Wait(2000)
	SetPedShootsAtCoord(pauloPlinioPed, GetEntityCoords(playerPed), true) -- Work around to make the ped shoot, for some reason it doesn't work with TaskShootAtEntity 
	ClearPedTasksImmediately(pauloPlinioPed)
	TriggerEvent('sounds:source', 'aqui_e_o_paulo', 0.4)
	Wait(6000)
	SetCurrentPedWeapon(pauloPlinioPed, GetHashKey("weapon_unarmed"), true)

	-- Play animation after shooting
	local animDict = "random@peyote@chicken"
	local animSet = "wakeup"
	LoadAnimationDict(animDict)
	TaskPlayAnim(pauloPlinioPed, animDict, animSet, 8.0, 8.0, -1, 1, 0, false, false, false)
	RemoveAnimDict(animDict)

	Wait(6000)

	if DoesEntityExist(pauloPlinioPed) then
		DeleteEntityWhileUsingAlpha(pauloPlinioPed)
	end

	FreezeEntityPosition(playerPed, false)

	-- Get caju's ped
	local cajuPed = userPeds[2]

	SetEntityHeading(playerPed, GetEntityHeading(playerPed) - 180.0)

	-- Wait for the player to be close enough to caju
	local cajuCoords = GetEntityCoords(cajuPed)
	local cooldown = GetGameTimer() + 10000
	while #(cajuCoords - playerCoords) > 1.0 do
		cajuCoords = GetEntityCoords(cajuPed)
		playerCoords = GetEntityCoords(playerPed)

		TaskGoStraightToCoord(cajuPed, playerCoords, 1.0, 1000, 0.0, 0.0)

		if GetGameTimer() > cooldown then
			SetEntityCoords(cajuPed, playerCoords)
			return
		end

		Wait(0)
	end

	ClearPedTasksImmediately(cajuPed)

	-- Load animation that caju will play
	local animDict = "mini@cpr@char_a@cpr_str"
	local animSet = "cpr_pumpchest"
	loadAnimDict(animDict)
	TaskPlayAnim(cajuPed, animDict, animSet, 8.0, 8.0, -1, 1, 0, false, false, false)
	RemoveAnimDict(animDict)

	TriggerEvent('sounds:source', 'caju_ele_gago', 0.4)
	
	Wait(5000) -- Animation time

	exports["survival"]:Revive(oldHealth) -- Restore player's health
	SetPedArmour(playerPed, oldArmour) -- Restore player's armour
	ClearPedTasksImmediately(playerPed) -- Force animation to be stopped (if any)

	StopAnimTask(cajuPed, animDict, animSet, 1.0)

	if DoesEntityExist(cajuPed) then
		DeleteEntityWhileUsingAlpha(cajuPed)
	end

	DoScreenFadeIn(450)

	TriggerEvent('sounds:source', 'luqueta_beijo_bochecha', 0.4)
	TriggerEvent('Notify', 'verde', 'Você foi ressuscitado pela sua amiga...', 10000)

	isDrugRunning = false
	exports['hud']:handleTimeSync(true)
end)

RegisterNetEvent('inventory:client:lancaperfume', function()
	local playerPed = PlayerPedId()

	-- Fade in/out to switch time
	DoScreenFadeOut(450)
	SetTimeout(1000, function()
		exports['hud']:handleTimeSync(false)
		SetWeatherTypeNow("XMAS")
		SetWeatherTypePersist("XMAS")
		SetWeatherTypeNowPersist("XMAS")
		ForceSnowPass(true)
		SetSnowLevel(1.0)
		DoScreenFadeIn(450)
	end)

	Wait(30000) -- 30 seconds

	-- Fade in/out to switch time
	DoScreenFadeOut(450)
	SetTimeout(1000, function()
		exports['hud']:handleTimeSync(true)
		ForceSnowPass(false)
		SetSnowLevel(-0.1) -- Needs to be less then 0.0 to disable snow
		DoScreenFadeIn(450)
	end)
end)

RegisterNetEvent('inventory:client:spoon', function()
	local playerPed = PlayerPedId()
	local animDict, animSet = "anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop"
	local objectModel = GetHashKey("bkr_prop_coke_spoon_01")

	LoadModelProperly(objectModel)
	loadAnimDict(animDict)

	local spoonObject = CreateObject(objectModel, GetEntityCoords(playerPed), true, false, false)
	
	TaskPlayAnim(playerPed, animDict, animSet, 8.0, 8.0, -1, 49, 0, false, false, false)
	AttachEntityToEntity(spoonObject, playerPed, GetPedBoneIndex(playerPed, 18905), vec3(0.1, 0.05, -0.0), vec3(180.0, 20.0, -30.0), false, false, false, false, 2, true)

	-- Async wait for animation to start
	while not IsEntityPlayingAnim(playerPed, animDict, animSet, 3) do
		Wait(0)
	end

	-- Async wait for animation to finish
	while IsEntityPlayingAnim(playerPed, animDict, animSet, 3) do
		Wait(0)
	end

	if DoesEntityExist(spoonObject) then
		DeleteEntity(spoonObject)
	end

	SetModelAsNoLongerNeeded(objectModel)
	RemoveAnimDict(animDict)
end)

RegisterNetEvent('inventory:womensDayEffect', function()
	local playerPed = PlayerPedId()
	local animDict, animSet = "anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop"
	local ptfxDict, ptfxSet = "scr_rcbarry2", "scr_clown_death"
	local objectModel = GetHashKey("prop_single_rose")

	LoadNamedPtfxAsset(ptfxDict)
	SetPtfxAssetNextCall(ptfxDict)
	LoadModelProperly(objectModel)

	local roseObject = CreateObject(objectModel, GetEntityCoords(playerPed), true, false, false)

	loadAnimDict(animDict)
	TaskPlayAnim(playerPed, animDict, animSet, 8.0, 8.0, -1, 49, 0, false, false, false)
	RemoveAnimDict(animDict)
	AttachEntityToEntity(roseObject, playerPed, GetPedBoneIndex(playerPed, 18905), vec3(0.13, 0.15, 0.0), vec3(-100.0, 0.0, -20.0), false, false, false, false, 2, true)

	local ptfxAsset = StartNetworkedParticleFxNonLoopedOnEntity(ptfxSet, playerPed, vec3(0.0, 0.0, 0.0), vec3(0.0, 0.0, 0.0), 1.0, false, false, false)
	Wait(3000)

	TriggerServerEvent('inventory:womensDay3DME')
	
	while IsEntityPlayingAnim(playerPed, animDict, animSet, 3) do
		Wait(0)
	end

	if DoesEntityExist(roseObject) then
		DeleteEntity(roseObject)
	end

	StopParticleFxLooped(ptfxAsset, 0)
	RemoveNamedPtfxAsset(ptfxDict)
	RemoveAnimDict(animDict)
	SetModelAsNoLongerNeeded(objectModel)
end)