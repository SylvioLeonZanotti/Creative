-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Kaduzera = {}
Tunnel.bindInterface("target",Kaduzera)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKIN
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.CheckIn()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.GetHealth(source) <= 100 then
			if vRP.PaymentFull(Passport,975) then
				vRP.UpgradeHunger(Passport,20)
				vRP.UpgradeThirst(Passport,20)
				TriggerEvent("Reposed",source,Passport,900)

				return true
			else
				TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
			end
		else
			if vRP.Request(source,"Prosseguir o tratamento por <b>$750</b> dólares?","Sim, iniciar tratamento","Não, volto mais tarde") then
				if vRP.PaymentFull(Passport,750) then
					vRP.UpgradeHunger(Passport,20)
					vRP.UpgradeThirst(Passport,20)

					return true
				else
					TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
				end
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:CALLWORKS
-----------------------------------------------------------------------------------------------------------------------------------------
local Calls = {}
RegisterServerEvent("target:CallWorks")
AddEventHandler("target:CallWorks",function(Perm)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not Calls[Perm] then
			Calls[Perm] = os.time()
		end

		if os.time() >= Calls[Perm] then
			if Perm == "Paramedic" then
				TriggerClientEvent("Notify",-1,"blood","<b>Pillbox Medical:</b> Estamos em busca de doadores de sangue, seja solidário e ajude o próximo, procure um de nossos profissionais.",15000)
			elseif Perm == "Mechanic" then
				TriggerClientEvent("Notify",-1,"blood","<b>Mecanica Sul:</b> Estamos atendendo, qualquer servico chamar ou vim ate a Mecanica!!!",15000)
			else
				TriggerClientEvent("Notify",-1,"amarelo","<b>"..Perm..":</b> Estamos em busca de trabalhadores, compareça ao estabelecimento, procure um de nossos funcionários e consulte nosso serviço de entregas.",15000)
			end

			Calls[Perm] = os.time() + 600
		else
			local Cooldown = parseInt(Calls[Perm] - os.time())
			TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..Cooldown.."</b> segundos.",5000)
		end
	end
end)