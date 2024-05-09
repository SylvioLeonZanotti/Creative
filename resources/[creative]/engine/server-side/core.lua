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
Tunnel.bindInterface("engine",Kaduzera)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Vehicles = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTFUEL
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.RechargeFuel(Price)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Players = vRPC.Players(source)

		if vRP.PaymentFull(Passport,Price) then
			for _,v in pairs(Players) do
				async(function()
					TriggerClientEvent("engine:syncFuel",v,Plate,vehFuel,Network)
				end)
			end

			return true
		else
			for _,v in ipairs(Players) do
				async(function()
					TriggerClientEvent("engine:syncFuel",v,Plate,LastFuel,Network)
				end)
			end

			TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEFUEL
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.vehicleFuel(Plate)
	if not Vehicles[Plate] and Plate then
		Vehicles[Plate] = 50
	end

	return Vehicles[Plate]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYFUEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("engine:tryFuel")
AddEventHandler("engine:tryFuel",function(Plate,vehFuel)
	if Plate ~= nil then
		Vehicles[Plate] = vehFuel
	end
end)