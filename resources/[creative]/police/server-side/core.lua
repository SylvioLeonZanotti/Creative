-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Kaduzera = {}
Tunnel.bindInterface("police",Kaduzera)
vCLIENT = Tunnel.getInterface("police")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFY
-----------------------------------------------------------------------------------------------------------------------------------------
--[[function Kaduzera.Verify()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.GetFine(Passport) > 0 then
			TriggerClientEvent("Notify",source,"amarelo","Você possui multas pendentes.",10000)
			return false
		end

		if exports["hud"]:Wanted(Passport,source) and exports["hud"]:Reposed(Passport) then
			return false
		end
	end

	return true
end]]--
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREPRARES
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("prison/cleanRecords","DELETE FROM prison WHERE nuser_id = @nuser_id")
vRP.Prepare("prison/getRecords","SELECT * FROM prison WHERE nuser_id = @nuser_id ORDER BY id DESC")
vRP.Prepare("prison/insertPrison","INSERT INTO prison(police,nuser_id,services,fines,text,date) VALUES(@police,@nuser_id,@services,@fines,@text,@date)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATETABLE
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare('priso/create',[[CREATE TABLE IF NOT EXISTS `prison` (
		`id` int(11) NOT NULL AUTO_INCREMENT,
		`police` varchar(255) DEFAULT '0',
		`nuser_id` int(11) NOT NULL DEFAULT '0',
		`services` int(11) NOT NULL DEFAULT '0',
		`fines` int(20) NOT NULL DEFAULT '0',
		`text` longtext,
		`date` text,
		PRIMARY KEY (`id`),
		KEY `id` (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=latin1;
]])
CreateThread(function()
	vRP.Query('priso/create')
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local actived = {}
local prisonMarkers = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
local Preset = {
	["mp_m_freemode_01"] = {
		["hat"] = { item = -1, texture = 0 },
		["pants"] = { item = 201, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["decals"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["shoes"] = { item = 12, texture = 0 },
		["tshirt"] = { item = 15, texture = 0 },
		["torso"] = { item = 537, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["arms"] = { item = 15, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 }
	},
	["mp_f_freemode_01"] = {
		["hat"] = { item = -1, texture = 0 },
		["pants"] = { item = 152, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["decals"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["shoes"] = { item = 25, texture = 0 },
		["tshirt"] = { item = 14, texture = 0 },
		["torso"] = { item = 418, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["arms"] = { item = 86, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:PRISONCLOTHES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("police:prisonClothes")
AddEventHandler("police:prisonClothes",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 then
		local mHash = vRP.ModelPlayer(entity[1])
		if mHash == "mp_m_freemode_01" or mHash == "mp_f_freemode_01" then
			TriggerClientEvent("updateRoupas",entity[1],Preset[mHash])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEANREC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cleanrec",function(source,args,rawCommand)
	local Passport = vRP.Passport(source)
	if Passport and args[1] then
		if vRP.HasPermission(Passport,"setPolice") then
			local nuser_id = parseInt(args[1])
			if nuser_id > 0 then
				vRP.Query("prison/cleanRecords",{ nuser_id = nuser_id })
				TriggerClientEvent("Notify",source,"verde","Limpeza efetuada.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INITPRISON
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.initPrison(nuser_id,services,fines,text)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if actived[Passport] == nil then
			actived[Passport] = true

			local Identity = vRP.Identity(Passport)
			if Identity then
				local otherPlayer = vRP.Source(nuser_id)
				if otherPlayer then
					vCLIENT.syncPrison(otherPlayer,true,false)
					TriggerClientEvent("hud:RadioClean",otherPlayer)
				end

				vRP.Query("prison/insertPrison",{ police = Identity["name"].." "..Identity["name2"], nuser_id = parseInt(nuser_id), services = services, fines = fines, text = text, date = os.date("%d/%m/%Y").." ás "..os.date("%H:%M") })
				vRPC.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
				TriggerClientEvent("Notify",source,"verde","Prisão efetuada.",10000)
				TriggerClientEvent("police:Update",source,"reloadPrison")
				vRP.InitPrison(nuser_id,services)

				if fines > 0 then
					vRP.GiveFine(nuser_id,fines)
				end

				TriggerEvent("Discord","Prisao","**Passaporte:** "..parseFormat(Passport).."\n**Prendeu Passaporte:** "..parseFormat(nuser_id).."\n**Total Serviços:** "..parseFormat(services).."\n**Valor Multa:** $"..parseFormat(fines).."\n**Horário:** "..os.date("%H:%M:%S").."\n**Motivo:** "..text,13541152)
			end

			actived[Passport] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCHUSER
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.searchUser(nuser_id)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local nuser_id = parseInt(nuser_id)
		local Identity = vRP.Identity(nuser_id)
		if Identity then
			local fines = vRP.GetFine(nuser_id)
			local records = vRP.Query("prison/getRecords",{ nuser_id = parseInt(nuser_id) })
			return { true,Identity["name"].." "..Identity["name2"],Identity["phone"],fines,records }
		end
	end

	return { false }
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INITFINE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.initFine(nuser_id,fines,text)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and fines > 0 then
		if actived[Passport] == nil then
			actived[Passport] = true

			TriggerEvent("Discord","Multas","**Passaporte:** "..parseFormat(Passport).."\n**Multou Passaporte:** "..parseFormat(nuser_id).."\n**Valor Multa:** $"..parseFormat(fines).."\n**Horário:** "..os.date("%H:%M:%S").."\n**Motivo:** "..text,2316674)
			TriggerClientEvent("Notify",source,"verde","Multa aplicada.",10000)
			TriggerClientEvent("police:Update",source,"reloadFine")
			vRP.GiveFine(nuser_id,fines)

			actived[Passport] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRISONSYNC
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		for k,v in pairs(prisonMarkers) do
			if prisonMarkers[k][1] > 0 then
				prisonMarkers[k][1] = prisonMarkers[k][1] - 1

				if prisonMarkers[k][1] <= 0 then
					if vRP.Source(prisonMarkers[k][2]) then
						TriggerEvent("blipsystem:serviceExit",k)
					end

					prisonMarkers[k] = nil
				end
			end
		end

		Citizen.Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REDUCEPRISON
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.reducePrison()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		vRP.UpdatePrison(Passport,math.random(4,8))

		local Identity = vRP.Identity(Passport)
		if parseInt(Identity["prison"]) <= 0 then
			vCLIENT.syncPrison(source,false,true)
		else
			vCLIENT.asyncServices(source)
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
--------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
	local Identity = vRP.Identity(Passport)
	if parseInt(Identity["prison"]) > 0 then
		TriggerClientEvent("Notify",source,"azul","Restam <b>"..parseInt(Identity["prison"]).." serviços</b>.",5000)
		vCLIENT.syncPrison(source,true,true)
	end
end)