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
Creative = {}
Tunnel.bindInterface("dynamic",Creative)
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:EMERGENCYANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:EmergencyAnnounceMedic")
AddEventHandler("dynamic:EmergencyAnnounceMedic",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Paramedic") then
			TriggerClientEvent("dynamic:closeSystem",source)
			local Keyboard = vKEYBOARD.keyTertiary(source,"Mensagem:","Seu Nome:","Tempo (em MS) coloque 30000:")
			if Keyboard then
				TriggerClientEvent("Notify",-1,"blood",Keyboard[1].. " Enviado por: "..Keyboard[2],Keyboard[3])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:EMERGENCYANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:EmergencyAnnounce")
AddEventHandler("dynamic:EmergencyAnnounce",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Police") or vRP.HasGroup(Passport,"Paramedic") then
			TriggerClientEvent("dynamic:closeSystem",source)
			local Keyboard = vKEYBOARD.keyTertiary(source,"Mensagem:","Cor:","Enviado por: ")
			if Keyboard then
				TriggerClientEvent("Notify",-1,Keyboard[2],Keyboard[1],"</b><br>ENVIADO POR : <b></b>"..Keyboard[2],30000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TENCODES
-----------------------------------------------------------------------------------------------------------------------------------------
local Tencodes = {
	[1] = {
		tag = "QTI",
		text = "Abordagem de trânsito",
		blip = 77
	},
	[2] = {
		tag = "QTH",
		text = "Localização",
		blip = 1
	},
	[3] = {
		tag = "QRR",
		text = "Apoio com prioridade",
		blip = 38
	},
	[4] = {
		tag = "QRT",
		text = "Oficial desmaiado/ferido",
		blip = 6
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:TENCODE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:Tencode")
AddEventHandler("dynamic:Tencode",function(Code)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		local Identity = vRP.Identity(Passport)
		local Service = vRP.NumPermission("Police")
		for Passports,Sources in pairs(Service) do
			async(function()
				if Code ~= 4 then
					vRPC.PlaySound(Sources,"Event_Start_Text","GTAO_FM_Events_Soundset")
				end

				TriggerClientEvent("NotifyPush",Sources,{ code = Tencodes[parseInt(Code)]["tag"], title = Tencodes[parseInt(Code)]["text"], x = Coords["x"], y = Coords["y"], z = Coords["z"], name = Identity["name"].." "..Identity["name2"], time = "Recebido às "..os.date("%H:%M"), blipColor = Tencodes[parseInt(Code)]["blip"] })
			end)
		end
	end
end)