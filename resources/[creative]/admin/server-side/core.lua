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
Tunnel.bindInterface("admin",Kaduzera)
vCLIENT = Tunnel.getInterface("admin")
vKEYBOARD = Tunnel.getInterface("keyboard")

local webhookaddcar = "https://discord.com/api/webhooks/1128132331559989389/IrJWl7TGNhE-Zv25CCcwZlvMkrBxk6pl6k4y_rqz273qOYtJ5qP_iE7ZEY3R47jK_jSW"
local webhookremcar = "https://discord.com/api/webhooks/1128132375088484462/eS9cLvEpQ8nYtQsP_TLcwdt2laUp_Eb3LwkJS7147lWNwzo422OaBpLAAEG-5tcJ03jM"

function SendWebhookMessage(webhook,message)
    if webhook ~= nil and webhook ~= "" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDVEHS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("addvehs",function(source,Message)
    local Passport = vRP.Passport(source)
    if vRP.HasGroup(Passport,"Admin",1) then
        if Message[1] and Message[2] then
            local OtherIdentity = Message[2]
            local OtherPlayer = vRP.Passport(OtherIdentity)
            if vRP.Request(source,"Deseja adicionar o carro <b>"..Message[1].."</b> para o Passaporte: <b>"..Message[2].." Sim ou Não") then
                vRP.Query("vehicles/addVehicles",{ Passport = Message[2], vehicle = Message[1], plate = vRP.GeneratePlate(), work = "false" })
                TriggerClientEvent("Notify",source,"verde", "Você adicionou o veículo <b>"..Message[1].."</b> para o Passaporte: <b>"..Message[2].."</b>.", 5000)
                TriggerClientEvent("Notify",OtherPlayer,"verde", "O veículo <b>"..Message[1].."</b> foi adicionado na sua garagem.", 5000)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("anuncioo",function(source)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) then
			local Keyboard = vKEYBOARD.keyTertiary(source,"Mensagem:","Cor:","Nome:")
			if Keyboard then
				TriggerClientEvent("Notify",-1,Keyboard[2],Keyboard[1],"<br><b>Mensagem enviada por:</b>",Keyboard[3],5000)
			end
		end
	end
end)
RegisterCommand('anuncioadm',function(source,args,rawCommand)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			local messagetype = vKEYBOARD.keyArea(source,"Mensagem","")
			if messagetype then
				return
			end

			local messagetype2 = vKEYBOARD.keyArea(source,"aqui coloque POLICE","")
			if messagetype2 then
				return
			end
			
			
			local message = vKEYBOARD.keyArea(source,"Seu Nome:","")
			if message then
				return
			end


			local timer = vKEYBOARD.keyArea(source,"Duração da mensagem:","")
			if timer then
				return
			end

			--TriggerClientEvent("Notify",-1,messagetype2,messagetype,message,timer)
			TriggerClientEvent("Notify",-1,messagetype2,messagetype,"<br><b>Mensagem enviada por:</b> ",message,timer)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- P
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("pp",function(source,Message,History)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] and vRP.GetHealth(source) > 100 then
		if vRP.HasService(Passport,"Police") then
			TriggerClientEvent("Notify",-1,"verde",History:sub(1).."<b>Enviado por: </b> "..History:sub(2),30000)

			TriggerEvent("Discord","Polices","**Passaporte:** "..Passport.."\n**Mensagem:** "..History:sub(2),9807270)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- P
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("p",function(source,Message,History)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] and vRP.GetHealth(source) > 100 then
		if vRP.HasService(Passport,"Police") then
			TriggerClientEvent("Notify",-1,"verde","<b>1º BPM de Energy informa:</b> "..History:sub(2),30000)

			TriggerEvent("Discord","Polices","**Passaporte:** "..Passport.."\n**Mensagem:** "..History:sub(2),9807270)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Checar a quantidade de players e ids online.     ~ admin/server-side/core.lua
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("pon",function(source,args,rawCommand)
    local user_id = vRP.Passport(source)
    if vRP.HasGroup(user_id, "Admin",1) then
        local users = vRP.Players()
        local players = ""
        local quantidade = 0
        for k,v in pairs(users) do
            if k ~= #users then
                players = players..", "
            end
            players = players..k
            quantidade = quantidade + 1
        end
        TriggerClientEvent("Notify",source,"amarelo","TOTAL ONLINE : <b>"..quantidade.."</b><br>ID's ONLINE : <b>"..players.."</b>",5000)
    end
end)
RegisterCommand("ptr",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1 or 2 or 3 or 4) then
			local id,Police = vRP.NumPermission("Police")
			local id, Mecanico = vRP.NumPermission("Mechanic")
			local id,Paramedico = vRP.NumPermission("Paramedic")
			
			TriggerClientEvent("Notify",source,"verde","POLICIAIS ONLINE : <b>"..Police.."</b><br>MEDICOS ONLINE : <b>"..Paramedico.."</b> MECANICOS ONLINE : <b>"..Mecanico.."</b>",5000)		
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REM CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("remvehs",function(source,Message)
    local Passport = vRP.Passport(source)
    if vRP.HasGroup(Passport,"Admin",1) then
        if Message[1] and Message[2] then
            local OtherPlayer = vRP.Passport(parseInt(Message[2]))
            local OtherIdentity = vRP.Identity(parseInt(Message[2]))
            if vRP.Request(source,"Deseja retirar o veículo <b>"..VehicleName(Message[1]).."</b> do Passaporte: <b>"..parseInt(Message[2]).." "..OtherIdentity.name.." "..OtherIdentity.name2.."</b> ?","Sim","Não") then
                vRP.Query("vehicles/removeVehicles",{ Passport = parseInt(Message[2]), vehicle = Message[1] })
                TriggerClientEvent("Notify",source,"verde", "Você removeu o veículo <b>"..VehicleName(Message[1]).."</b> do Passaporte: <b>"..parseInt(Message[2]).."</b>.", 5000)
                TriggerClientEvent("Notify",OtherPlayer,"vermelho", "O veículo <b>"..VehicleName(Message[1]).."</b> foi removido da sua garagem.", 5000)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BARBERSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("barbearia",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) then
			TriggerClientEvent("barbershop:Open",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("skinshop",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) then
			TriggerClientEvent("skinshop:Open",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDBACK - 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("addback",function(source,args,rawCommand)
    local Passport = vRP.Passport(source)
    if Passport and args[1] then
        if vRP.HasGroup(Passport,"Admin",1) then
            local nuser_id = parseInt(args[1])
            local amountWeight = parseInt(args[2])
            vRP.SetWeight(nuser_id,amountWeight)
            TriggerClientEvent("Notify",source,"verde","Mochila adicionado para <b>"..nuser_id.."</b> em "..amountWeight.."KG.",5000)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMBACK - 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("remback",function(source,args,rawCommand)
    local Passport = vRP.Passport(source)
    if Passport and args[1] then
        if vRP.HasGroup(Passport,"Admin",1) then
            local nuser_id = parseInt(args[1])
            local amountWeight = parseInt(args[2])
            vRP.RemoveWeight(nuser_id,amountWeight)
            TriggerClientEvent("Notify",source,"verde","Mochila removida de <b>"..nuser_id.."</b> em "..amountWeight.."KG.",5000)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDCAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("addcar",function(source,Message)
	local source = source
	local Passport = vRP.Passport(source)
	local Sources = vRP.Source(Message[1])
	if vRP.HasGroup(Passport,"Admin",1) then
		if Passport and Message[1] and Message[2] then
			vRP.Query("vehicles/addVehicles",{ Passport = parseInt(Message[1]), vehicle = Message[2], plate = vRP.GeneratePlate(), work = tostring(false) })
			TriggerClientEvent("Notify",source,"verde","Adicionado o veiculo <b>"..Message[2].."</b> na garagem de ID <b>"..Message[1].."</b>.",10000)
			TriggerClientEvent("Notify",Sources,"verde","Adicionado o veiculo <b>"..Message[2].."</b> em sua garagem<b> .",10000)
			SendWebhookMessage(webhookaddcar,"```prolog\n[Passaporte]: "..Passport.." \n[Colocou Veiculo:]: "..Message[2].."\n[Para ID:]: "..Message[1]..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
RegisterCommand("remcar",function(source,Message)
	local source = source
	local Passport = vRP.Passport(source)
	if vRP.HasGroup(Passport,"Admin",1) then
		if Passport and Message[1] and Message[2] then
			vRP.Query("vehicles/removeVehicles",{ Passport = parseInt(Message[1]), vehicle = Message[2]})
			TriggerClientEvent("Notify",source,"verde","Retirado o veiculo <b>"..Message[2].."</b> da garagem de ID <b>"..Message[1].."</b>.",10000)
			SendWebhookMessage(webhookremcar,"```prolog\n[Passaporte]: "..Passport.." \n[Para Id:]: "..Message[1].."\n[Retirou Veiculo:]: "..Message[2]..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("anunciar",function(source)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) then
			local Keyboard = vKEYBOARD.keyTertiary(source,"Mensagem:","Cor:","Tempo (em MS):")
			if Keyboard then
				TriggerClientEvent("Notify",-1,Keyboard[2],Keyboard[1],Keyboard[3])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("anuncioo",function(source)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) then
			local Keyboard = vKEYBOARD.keyTertiary(source,"Mensagem:","Cor:","Nome:")
			if Keyboard then
				TriggerClientEvent("Notify",-1,Keyboard[2],Keyboard[1],Keyboard[3])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("avisopm",function(source)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Police") then
			local Keyboard = vKEYBOARD.keyArea(source,"Mensagem:")
			if Keyboard then
				TriggerClientEvent("Notify",-1,"police",Keyboard[1],30000)
				--TriggerEvent("Discord","God","**avisopm**\n\n**Passaporte:** "..Passport.."\n**Deu God em Si mesmo:** \n**Horário:** "..os.date("%H:%M:%S"),3553599)
				TriggerEvent("Discord","Avisopm","**Aviso PM**\n\n**Passaporte:** "..Passport.."\n**Enviou no Avisopm:** "..Keyboard[1].."\n**Horário:** "..os.date("%H:%M:%S"),3553599)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("avisomec",function(source)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Mechanic") then
			local Keyboard = vKEYBOARD.keyArea(source,"Mensagem:")
			if Keyboard then
				TriggerClientEvent("Notify",-1,"mecanico",Keyboard[1],30000)
				TriggerEvent("Discord","Avisomec","**Aviso MEC**\n\n**Passaporte:** "..Passport.."\n**Enviou no AvisoMEC:** "..Keyboard[1].."\n**Horário:** "..os.date("%H:%M:%S"),3553599)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("debug",function(source)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			TriggerClientEvent("ToggleDebug",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MODMAIL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("modmail",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) and parseInt(Message[1]) > 0 then
			local OtherPassport = parseInt(Message[1])
			local ClosestPed = vRP.Source(OtherPassport)
			if ClosestPed then
			    local Keyboard = vKEYBOARD.keyTertiary(source,"Mensagem:","Cor:","Tempo (em MS):")
			        if Keyboard then
			        TriggerClientEvent("Notify",ClosestPed,Keyboard[2],Keyboard[1],Keyboard[3])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESTARTED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("restarte",function(source,Message,History)
	if source == 0 then
		GlobalState["Weather"] = "THUNDER"
		TriggerClientEvent("Notify",-1,"amarelo","Um grande terremoto se aproxima, abriguem-se enquanto há tempo pois o terremoto chegará em" ..History:sub(9).. " minutos.",60000)
		print("Terremoto anunciado")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESTARTEDCANCEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("restartecancel",function(source)
	if source == 0 then
		GlobalState["Weather"] = "EXTRASUNNY"
		TriggerClientEvent("Notify",-1,"amarelo","Nosso sistema meteorológico detectou que o terremoto passou por agora, porém o mesmo pode voltar a qualquer momento",60000)
		print("Terremoto cancelado")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UGROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ugroups",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and parseInt(Message[1]) > 0 then
		local Messages = ""
		local Groups = vRP.Groups()
		local OtherPassport = Message[1]
		for Permission,_ in pairs(Groups) do
			local Data = vRP.DataGroups(Permission)
			if Data[OtherPassport] then
				Messages = Messages..Permission.."<br>"
			end
		end

		if Messages ~= "" then
			TriggerClientEvent("Notify",source,"verde",Messages,30000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("wl",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		local OtherPassport = parseInt(Message[1])
		if vRP.HasGroup(Passport,"Admin",1 or 2 or 3 or 4 or 5) or vRP.HasGroup(Passport,"Staff",1) and OtherPassport > 0 then
			TriggerClientEvent("Notify",source,"verde","ID: <b>"..Message[1].."</b> Liberado <b>",5000)
			vRP.Query("accounts/updateWhitelist",{ id = Message[1], whitelist = 1 })
			TriggerEvent("Discord","Petroleo","**al**\n\n**Passaporte:** "..Passport.."\n**Aprovou ID:** "..Message[1]" Na Whitelist",3553599)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEARINV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("clearinv",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) and parseInt(Message[1]) > 0 then
			TriggerClientEvent("Notify",source,"verde","Limpeza concluída.",5000)
			vRP.ClearInventory(Message[1])

			TriggerEvent("Discord","Clearinv","**clearinv**\n\n**Passaporte:** "..Passport.."\n**Para:** "..Message[1],3553599)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEARCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("clearchest",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) and Message[1] then
			local Consult = vRP.Query("chests/GetChests",{ name = Message[1] })
			if Consult[1] then
				TriggerClientEvent("Notify",source,"verde","Limpeza concluída.",5000)
				vRP.SetSrvData("Chest:"..Message[1],{},true)
				
				TriggerEvent("Discord","Clearchest","**clearchest**\n\n**Passaporte:** "..Passport.."\n**Chest:** "..Message[2],3553599)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("gem",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) and parseInt(Message[1]) > 0 and parseInt(Message[2]) > 0 then
			local Amount = parseInt(Message[2])
			local OtherPassport = parseInt(Message[1])
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				TriggerClientEvent("Notify",source,"verde","Gemas entregues.",5000)
				vRP.Query("accounts/AddGems",{ license = Identity["license"], gems = Amount })
				vRP.UpgradeGemstone(Passport,Amount)
				TriggerEvent("Discord","Gemstone","**Source:** "..source.."\n**Passaporte:** "..Passport.."\n**Para:** "..OtherPassport.."\n**Gemas:** "..Amount.."\n**Address:** "..GetPlayerEndpoint(source),3092790)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("addgem",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) and parseInt(Message[1]) > 0 and parseInt(Message[2]) > 0 then
			local Amount = parseInt(Message[2])
			local OtherPassport = parseInt(Message[1])
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				TriggerClientEvent("Notify",source,"verde","Gemas entregues.",5000)
				vRP.UpgradeGemstone(OtherPassport,Amount)
				
				local OtherSource = vRP.Source(OtherPassport)
				if OtherSource then
					TriggerClientEvent("Notify",OtherSource,"azul","Você recebeu <b>"..Amount.."x Gemas</b>.",5000)
				end
				
				TriggerEvent("Discord","Gemstone","**Source:** "..source.."\n**Passaporte:** "..Passport.."\n**Para:** "..OtherPassport.."\n**Gemas:** "..Amount.."\n**Address:** "..GetPlayerEndpoint(source),3092790)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
local Blips = {}
RegisterCommand("blips",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1)  then
			local Text = ""
			
			if not Blips[Passport] then
				Blips[Passport] = true
				Text = "Ativado"
			else
				Blips[Passport] = nil
				Text = "Desativado"
			end
			
			vRPC.BlipAdmin(source)
			
			TriggerEvent("Discord","Blips","**blips**\n\n**Passaporte:** "..Passport.."\n**Situação:** "..Text.." \n**Horário:** "..os.date("%H:%M:%S"),3553599)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("god",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) then
			if Message[1] then
				TriggerEvent("Discord","God","**Passaporte:** "..Passport.."\n**Comando:** god "..Message[1],0xa3c846)
				local OtherPassport = parseInt(Message[1])
				local ClosestPed = vRP.Source(OtherPassport)
				if ClosestPed then
					vRP.UpgradeThirst(OtherPassport,100)
					vRP.UpgradeHunger(OtherPassport,100)
					vRP.DowngradeStress(OtherPassport,100)
					vRP.Revive(ClosestPed,200)
					--TriggerEvent("Discord","God","**god**\n\n**Passaporte:** "..Passport.."\n**Para:** "..OtherPassport.." \n**Horário:** "..os.date("%H:%M:%S"),3553599)
				end
			else
				vRP.Revive(source,200,true)
				vRP.SetArmour(source,99)
				vRP.UpgradeThirst(Passport,100)
				vRP.UpgradeHunger(Passport,100)
				vRP.DowngradeStress(Passport,100)
				--TriggerEvent("Discord","God","**god**\n\n**Passaporte:** "..Passport.."\n**Deu God em Si mesmo:** \n**Horário:** "..os.date("%H:%M:%S"),3553599)

				TriggerClientEvent("paramedic:Reset",source)

				vRPC.Destroy(source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("good",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			if Message[1] then
				local OtherPassport = parseInt(Message[1])
				local ClosestPed = vRP.Source(OtherPassport)
				if ClosestPed then
					vRP.UpgradeThirst(OtherPassport,100)
					vRP.UpgradeHunger(OtherPassport,100)
					vRP.DowngradeStress(OtherPassport,100)
					vRP.Revive(ClosestPed,200)
					vRP.SetArmour(source,99)
					TriggerEvent("Discord","God22","**god**\n\n**Passaporte:** "..Passport.."\n**Para:** "..OtherPassport.." \n**Horário:** "..os.date("%H:%M:%S"),3553599)
				end
			else
				vRP.Revive(source,200,true)
				vRP.SetArmour(source,99)
				vRP.UpgradeThirst(Passport,100)
				vRP.UpgradeHunger(Passport,100)
				vRP.DowngradeStress(Passport,100)
				TriggerEvent("Discord","God22","**god**\n\n**Passaporte:** "..Passport.."\n**Deu God em Si mesmo:** \n**Horário:** "..os.date("%H:%M:%S"),3553599)

				TriggerClientEvent("paramedic:Reset",source)

				vRPC.Destroy(source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("god2",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) then
			if Message[1] then
				local OtherPassport = parseInt(Message[1])
				local ClosestPed = vRP.Source(OtherPassport)
				if ClosestPed then
					vRP.UpgradeThirst(OtherPassport,100)
					vRP.UpgradeHunger(OtherPassport,100)
					vRP.DowngradeStress(OtherPassport,100)
					vRP.Revive(ClosestPed,150)
					--vRP.SetArmour(source,99)
					TriggerEvent("Discord","God22","**god**\n\n**Passaporte:** "..Passport.."\n**Para:** "..OtherPassport.." \n**Horário:** "..os.date("%H:%M:%S"),3553599)
				end
			else
				vRP.Revive(source,150,true)
				--vRP.SetArmour(source,99)
				vRP.UpgradeThirst(Passport,100)
				vRP.UpgradeHunger(Passport,100)
				vRP.DowngradeStress(Passport,100)
				TriggerEvent("Discord","God22","**god**\n\n**Passaporte:** "..Passport.."\n**Deu God em Si mesmo:** \n**Horário:** "..os.date("%H:%M:%S"),3553599)

				TriggerClientEvent("paramedic:Reset",source)

				vRPC.Destroy(source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("item",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		-- if vRP.HasGroup(Passport,"Admin",1) then
			if Message[1] and Message[2] and itemBody(Message[1]) ~= nil then
				local Amount = parseInt(Message[2])
				vRP.GenerateItem(Passport,Message[1],Amount,true)
				TriggerClientEvent("inventory:Update",source,"Backpack")
				TriggerEvent("Discord","Item","**item**\n\n**Passaporte:** "..Passport.."\n**Item:** "..Amount.."x "..itemName(Message[1]).." \n**Horário:** "..os.date("%H:%M:%S"),3553599)
			end
		-- end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("item2",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) and Message[3] and itemBody(Message[1]) then
			local OtherPassport = parseInt(Message[3])
			if OtherPassport > 0 then
				local Amount = parseInt(Message[2])
				local Item = itemName(Message[1])
				vRP.GenerateItem(Message[3],Message[1],Amount,true)
				TriggerClientEvent("Notify",source,"verde","Você enviou <b>"..Amount.."x "..Item.."</b> para o passaporte <b>"..OtherPassport.."</b>.",5000)
				
				TriggerEvent("Discord","Item2","**item2*\n\n**Passaporte:** "..Passport.."\n**Para:** "..OtherPassport.."\n**Item:** "..Amount.."x "..Item.." \n**Horário:** "..os.date("%H:%M:%S"),3553599)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("delete",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] then
		if vRP.HasGroup(Passport,"Admin",1) then
			local OtherPassport = parseInt(Message[1])
			vRP.Query("characters/removeCharacter",{ id = OtherPassport })
			TriggerClientEvent("Notify",source,"verde","Personagem <b>"..OtherPassport.."</b> deletado.",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
local Noclip = {}
RegisterCommand("nc",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		-- if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) then
			local Text = ""
			
			if not Noclip[Passport] then
				Noclip[Passport] = true
				Text = "Ativado"
			else
				Noclip[Passport] = nil
				Text = "Desativado"
			end
			
			vRPC.noClip(source)
			
			TriggerEvent("Discord","God","**nc**\n\n**Passaporte:** "..Passport.."\n**Situação:** "..Text.." \n**Horário:** "..os.date("%H:%M:%S"),3553599)
		-- end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("kick",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) and parseInt(Message[1]) > 0 then
			local OtherSource = vRP.Source(Message[1])
			if OtherSource then
				TriggerClientEvent("Notify",source,"amarelo","Passaporte <b>"..Message[1].."</b> expulso.",5000)
				vRP.Kick(OtherSource,"Expulso da cidade.")
				
				TriggerEvent("Discord","Kick","**kick**\n\n**Passaporte:** "..Passport.."\n**Expulsou Passaporte:** "..Message[1].." \n**Horário:** "..os.date("%H:%M:%S"),3553599)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ban",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) and parseInt(Message[1]) > 0 and parseInt(Message[2]) > 0 then
			local Days = parseInt(Message[2])
			local OtherPassport = parseInt(Message[1])
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				vRP.Query("banneds/InsertBanned",{ license = Identity["license"], time = Days })
				TriggerClientEvent("Notify",source,"amarelo","Passaporte <b>"..OtherPassport.."</b> banido por <b>"..Days.."</b> dias.",5000)
				TriggerEvent("Discord","Ban","**ban**\n\n**Passaporte:** "..Passport.."\n**Para:** "..Message[1].."\n**Tempo:** "..Message[2].." dias \n**Horário:** "..os.date("%H:%M:%S"),3553599)
				
				local OtherSource = vRP.Source(OtherPassport)
				if OtherSource then
					vRP.Kick(OtherSource,"Banido.")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNBAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("unban",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) and parseInt(Message[1]) > 0 then
			local OtherPassport = parseInt(Message[1])
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				vRP.Query("banneds/RemoveBanned",{ license = Identity["license"] })
				TriggerClientEvent("Notify",source,"verde","Passaporte <b>"..OtherPassport.."</b> desbanido.",5000)
				
				TriggerEvent("Discord","Unban","**unban**\n\n**Passaporte:** "..Passport.."\n**Para:** "..OtherPassport.." \n**Horário:** "..os.date("%H:%M:%S"),3553599)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpcds",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		-- if vRP.HasGroup(Passport,"Admin",2) then
			local Keyboard = vKEYBOARD.keySingle(source,"Cordenadas:")
			if Keyboard then
				local Split = splitString(Keyboard[1],",")
				vRP.Teleport(source,Split[1] or 0,Split[2] or 0,Split[3] or 0)
			end
		-- end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cds",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) or vRP.HasGroup(Passport,"Staff",1) then
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			local heading = GetEntityHeading(Ped)

			vKEYBOARD.keyCopy(source,"Cordenadas:",mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"])..","..mathLength(heading))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("group",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if  parseInt(Message[1]) > 0 and Message[2] and parseInt(Message[3]) then
			if Passport == 1 or Passport == 2 or Passport == 3 or Passport == 5 or vRP.HasGroup(Passport,"Admin",1) then
				TriggerClientEvent("Notify",source,"verde","Adicionado <b>"..Message[2].."</b> ao passaporte <b>"..Message[1].."</b>.",5000)
				TriggerEvent("Discord","Group","**ID:** "..Passport.."\n**Setou:** "..Message[1].." \n**Grupo:** "..Message[2].." \n**Horário:** "..os.date("%H:%M:%S"),3092790)
				vRP.SetPermission(Message[1],Message[2],Message[3])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ungroup",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) and parseInt(Message[1]) > 0 and Message[2] then
			TriggerClientEvent("Notify",source,"verde","Removido <b>"..Message[2].."</b> ao passaporte <b>"..Message[1].."</b>.",5000)
			TriggerEvent("Discord","Ungroup","**ID:** "..Passport.."\n**Removeu:** "..Message[1].." \n**Grupo:** "..Message[2].." \n**Horário:** "..os.date("%H:%M:%S"),3092790)
			vRP.RemovePermission(Message[1],Message[2])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTOME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tptome",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) and parseInt(Message[1]) > 0 then
			local ClosestPed = vRP.Source(Message[1])
			if ClosestPed then
				local Ped = GetPlayerPed(source)
				local Coords = GetEntityCoords(Ped)
				
				vRP.Teleport(ClosestPed,Coords["x"],Coords["y"],Coords["z"])
				TriggerEvent("Discord","Tptome","**tptome**\n\n**Passaporte:** "..Passport.."\n**Para:** "..Message[1].." \n**Horário:** "..os.date("%H:%M:%S"),3553599)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpto",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if  vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) and parseInt(Message[1]) > 0 then
			local ClosestPed = vRP.Source(Message[1])
			if ClosestPed then
				local Ped = GetPlayerPed(ClosestPed)
				local Coords = GetEntityCoords(Ped)
				vRP.Teleport(source,Coords["x"],Coords["y"],Coords["z"])
				TriggerEvent("Discord","Tpto","**tpto**\n\n**Passaporte:** "..Passport.."\n**Para:** "..Message[1].." \n**Horário:** "..os.date("%H:%M:%S"),3553599)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpway",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		-- if vRP.HasGroup(Passport,"Admin",1) then
			vCLIENT.teleportWay(source)
		-- end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("limbo",function(source)
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) <= 100 then
		vCLIENT.teleportLimbo(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hash",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			local vehicle = vRPC.VehicleHash(source)
			if vehicle then
				vKEYBOARD.keyCopy(source,"Hash do veículo:",Vehicle)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tuning",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			TriggerClientEvent("admin:vehicleTuning",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
	RegisterCommand("fix",function(source)
		local Passport = vRP.Passport(source)
		if Passport then
			if vRP.HasGroup(Passport,"Admin",1) then
				local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,10)
				if Vehicle then
					local Players = vRPC.Players(source)
					for _,v in pairs(Players) do
						async(function()
							TriggerClientEvent("inventory:repairAdmin",v,Network,Plate)
						end)
					end
					
					if VehicleExist(vehName) then
						TriggerEvent("Discord","Fix","**fix**\n\n**Passaporte:** "..Passport.."\n**Veículo:** "..VehicleName(vehName).."\n**Placa:** "..Plate,3553599)
					end
				end
			end
		end
	end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAREA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("limparea",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			TriggerClientEvent("syncarea",source,Coords["x"],Coords["y"],Coords["z"],100)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("players",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) then
			TriggerClientEvent("Notify",source,"azul","<b>Jogadores Conectados:</b> "..GetNumPlayerIndices(),5000)
		end
	end
end)
RegisterCommand("ids",function(source)
	if source ~= 0 then
		local Passport = vRP.Passport(source)
		if not vRP.HasGroup(Passport,"Admin",1) then
			return
		end
	end
	
	local Text = ""
	local List = vRP.Players()
	
	for OtherPlayer,_ in pairs(List) do
		if Text == "" then
			Text = OtherPlayer
		else
			Text = Text..", "..OtherPlayer
		end
	end
	
	if source ~= 0 then
		TriggerClientEvent("Notify",source,"azul","<b>Jogadores Conectados:</b> "..GetNumPlayerIndices()..".",10000)
		TriggerClientEvent("Notify",source,"azul","<b>IDs Conectados:</b> "..Text..".",20000)
	else
		print("^2IDs Conectados:^7 "..Text)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:COORDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("admin:Coords")
AddEventHandler("admin:Coords",function(Coords)
	vRP.Archive("coordenadas.txt",mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"]))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.buttonTxt()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			local heading = GetEntityHeading(Ped)

			vRP.Archive(Passport..".txt",mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"])..","..mathLength(heading))
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONSOLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("console",function(source,Message,History)
	if source == 0 then
		TriggerClientEvent("Notify",-1,"amarelo",History:sub(9),10000)
		print("Anuncio")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICKALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("kickall",function(source)
	if source ~= 0 then
		local Passport = vRP.Passport(source)
		if not vRP.HasGroup(Passport,"Admin",1) then
			return
		end
	end

	local List = vRP.Players()
	for _,Sources in pairs(List) do
		vRP.Kick(Sources,"Desconectado, a cidade reiniciou.")
		Wait(100)
	end

	TriggerEvent("SaveServer",false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("save",function(source)
	if source ~= 0 then
		local Passport = vRP.Passport(source)
		if not vRP.HasGroup(Passport,"Admin") then
			return
		end
	end

	TriggerEvent("SaveServer",false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("itemall",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			local Text = ""
			local List = vRP.Players()
			
			for OtherPlayer,_ in pairs(List) do
				async(function()
					if Text == "" then
						Text = OtherPlayer
					else
						Text = Text..", "..OtherPlayer
					end
					
					vRP.GenerateItem(OtherPlayer,Message[1],Message[2],true)
				end)
			end
			
			TriggerClientEvent("Notify",source,"verde","Envio concluído e Sua LOG foi Enviado para o Discord",10000)
				
				TriggerEvent("Discord","Itemall","**itemall**\n\n**Passaporte:** "..Passport.."\n**Para:** "..Text.."\n**Item:** "..Message[2].."x "..itemName(Message[1]).." \n**Horário:** "..os.date("%H:%M:%S"),3553599)
			end
		end
	end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RACECOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
local Checkpoint = 0
function Kaduzera.raceCoords(vehCoords,leftCoords,rightCoords)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		Checkpoint = Checkpoint + 1

		vRP.Archive("races.txt","["..Checkpoint.."] = {")

		vRP.Archive("races.txt","{ "..mathLength(vehCoords["x"])..","..mathLength(vehCoords["y"])..","..mathLength(vehCoords["z"]).." },")
		vRP.Archive("races.txt","{ "..mathLength(leftCoords["x"])..","..mathLength(leftCoords["y"])..","..mathLength(leftCoords["z"]).." },")
		vRP.Archive("races.txt","{ "..mathLength(rightCoords["x"])..","..mathLength(rightCoords["y"])..","..mathLength(rightCoords["z"]).." }")

		vRP.Archive("races.txt","},")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPECTATE
-----------------------------------------------------------------------------------------------------------------------------------------
local Spectate = {}
RegisterCommand("spectate",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Staff",1) then
			if Spectate[Passport] then
				local Ped = GetPlayerPed(Spectate[Passport])
				if DoesEntityExist(Ped) then
					SetEntityDistanceCullingRadius(Ped,0.0)
				end

				TriggerClientEvent("admin:resetSpectate",source)
				Spectate[Passport] = nil
			else
				local nsource = vRP.Source(Message[1])
				if nsource then
					local Ped = GetPlayerPed(nsource)
					if DoesEntityExist(Ped) then
						SetEntityDistanceCullingRadius(Ped,999999999.0)
						Wait(1000)
						TriggerClientEvent("admin:initSpectate",source,nsource)
						Spectate[Passport] = nsource
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Spectate[Passport] then
		Spectate[Passport] = nil
	end
end)