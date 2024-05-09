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
vCLIENT = Tunnel.getInterface("paramedic")
vSKINSHOP = Tunnel.getInterface("skinshop")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local bloodTimers = {}
local extractPerson = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:REPOSED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Reposed")
AddEventHandler("paramedic:Reposed",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 and vRP.GetHealth(entity) > 100 then
		if vRP.HasService(Passport,"Paramedic") then
			local Keyboard = vKEYBOARD.keySingle(source,"Minutos:")
			if Keyboard then
				if parseInt(Keyboard[1]) > 0 then
					local OtherPassport = vRP.Passport(entity)
					local Identity = vRP.Identity(OtherPassport)
					local playerTimer = parseInt(Keyboard[1] * 60)
					if Identity then
						if vRP.Request(source,"Adicionar <b>"..Keyboard[1].." minutos</b> de repouso no(a) <b>"..Identity["name"].."</b>?.","Sim, aplicar repouso","Não, mudei de ideia") then
							TriggerClientEvent("Notify",source,"azul","Aplicou <b>"..Keyboard[1].." minutos</b> de repouso.",10000)
							TriggerEvent("Reposed",entity,OtherPassport,playerTimer)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:TREATMENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Treatment")
AddEventHandler("paramedic:Treatment",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 and vRP.GetHealth(entity) > 100 then
		local OtherPassport = vRP.Passport(entity)
		local Identity = vRP.Identity(OtherPassport)
		if Identity then
			if not bloodTimers[OtherPassport] then
				bloodTimers[OtherPassport] = os.time() + 1800
			end

			TriggerClientEvent("target:StartTreatment",entity)
			TriggerClientEvent("paramedic:Reset",entity)
			TriggerClientEvent("Notify",source,"amarelo","Tratamento começou.",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:BED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Bed")
AddEventHandler("paramedic:Bed",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 then
		if vRP.HasService(Passport,"Paramedic") then
			TriggerClientEvent("target:BedDeitar",entity)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:REVIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Adrenaline")
AddEventHandler("paramedic:Adrenaline",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(entity) <= 100 then
		if vRP.ConsultItem(Passport,"adrenaline",1) then
			local OtherPassport = vRP.Passport(entity)
			Player(source)["state"]["Cancel"] = true
			TriggerClientEvent("Progress",source,"Tratando",10000)
			vRPC.playAnim(source,false,{"mini@cpr@char_a@cpr_str","cpr_pumpchest"},true)

			SetTimeout(10000,function()
				vRP.TakeItem(Passport,"adrenaline",1)
				vRP.Revive(entity,120)
				vRPC.Destroy(source)
				vRP.UpgradeThirst(OtherPassport,10)
				vRP.UpgradeHunger(OtherPassport,10)
				Player(source)["state"]["Cancel"] = false
			end)
		else
			TriggerClientEvent("Notify",source,"amarelo","Você não possui <b>1x "..itemName("adrenaline").."</b>.",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:REVIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Revive")
AddEventHandler("paramedic:Revive",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(entity) <= 100 then
		if vRP.HasService(Passport,"Paramedic") or vRP.HasService(Passport,"Police") then
			local OtherPassport = vRP.Passport(entity)
			Player(source)["state"]["Cancel"] = true
			TriggerClientEvent("Progress",source,"Tratando",10000)
			vRPC.playAnim(source,false,{"mini@cpr@char_a@cpr_str","cpr_pumpchest"},true)

			SetTimeout(10000,function()
				vRP.Revive(entity,120)
				vRPC.Destroy(source)
				vRP.UpgradeThirst(OtherPassport,10)
				vRP.UpgradeHunger(OtherPassport,10)
				Player(source)["state"]["Cancel"] = false
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:BANDAGE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Bandage")
AddEventHandler("paramedic:Bandage",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 and vRP.GetHealth(entity) > 100 then
		if vRP.HasService(Passport,"Paramedic") then
			if vCLIENT.Bleeding(entity) > 0 then
				if vRP.TakeItem(Passport,"gauze",1) then
					local Bandage = vCLIENT.Bandage(entity)
					TriggerClientEvent("Progress",source,"Passando",3000)
					vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
					SetTimeout(3000,function()
						TriggerClientEvent("Notify",source,"amarelo","Passou ataduras.",3000)
						TriggerClientEvent("sounds:Private",source,"bandage",0.5)
						TriggerClientEvent("paramedic:Reset",source)
						vRPC.Destroy(source)
					end)
				else
					TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("gauze").."</b>.",5000)
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Nenhum ferimento encontrado.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:DIAGNOSTIC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Diagnostic")
AddEventHandler("paramedic:Diagnostic",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 then
		if vRP.HasService(Passport,"Paramedic") then
			local Result = ""
			local OtherPassport = vRP.Passport(entity)
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				local Diagnostic,Bleeding = vCLIENT.Diagnostic(entity)

				if Bleeding <= 1 then
					Result = "<b>Sangramento:</b> Baixo<br>"
				elseif Bleeding == 2 then
					Result = "<b>Sangramento:</b> Médio<br>"
				elseif Bleeding >= 3 then
					Result = "<b>Sangramento:</b> Alto<br>"
				end

				Result = Result.."<b>Tipo Sangüíneo:</b> "..Sanguine(Identity["blood"])

				local Number = 0
				local Damaged = false
				for k,v in pairs(Diagnostic) do
					if not Damaged then
						Result = Result.."<br><br><b>Danos Superficiais:</b><br>"
						Damaged = true
					end

					Number = Number + 1
					Result = Result.."<b>"..Number.."</b>: "..Bone(k).."<br>"
				end

				TriggerClientEvent("Notify",source,"amarelo",Result,10000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
local preset = {
	["1"] = {
		["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 84, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 0, texture = 0 },
			["mask"] = { item = 0, texture = 0 },
			["shoes"] = { item = 25, texture = 0 },
			["tshirt"] = { item = 0, texture = 0 },
			["torso"] = { item = 186, texture = 0 },
			["accessory"] = { item = 0, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 110, texture = 3 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		},
		["mp_f_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 86, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 0, texture = 0 },
			["mask"] = { item = 0, texture = 0 },
			["shoes"] = { item = 25, texture = 0 },
			["tshirt"] = { item = 15, texture = 0 },
			["torso"] = { item = 188, texture = 0 },
			["accessory"] = { item = 0, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 127, texture = 3 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:PRESETPLASTER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:presetPlaster")
AddEventHandler("paramedic:presetPlaster",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasService(Passport,"Emergency") then
			local Model = vRP.ModelPlayer(entity)
			if Model == "mp_m_freemode_01" or "mp_f_freemode_01" then
				TriggerClientEvent("skinshop:Apply",entity,preset["1"][Model])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:BLOODDEATH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:bloodDeath")
AddEventHandler("paramedic:bloodDeath",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		bloodTimers[Passport] = os.time() + 10800
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if extractPerson[Passport] then
		extractPerson[Passport] = nil
	end
end)