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
Hypex = {}
Tunnel.bindInterface("skinshop",Hypex)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFY
-----------------------------------------------------------------------------------------------------------------------------------------
function Hypex.Verify()
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
end

function Hypex.CheckPerm()
	local source = source
	local Passport = vRP.Passport(source)
	if vRP.HasGroup(Passport,"Admin",1 or 2 or 3) then
		return true
	else
		return
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATECLOTHES
-----------------------------------------------------------------------------------------------------------------------------------------
function Hypex.Update(Clothes)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Clothings", dvalue = json.encode(Clothes) })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINSHOP:REMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("skinshop:Remove")
AddEventHandler("skinshop:Remove",function(Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			if vRP.HasService(Passport,"Policia") then
				TriggerClientEvent("skinshop:set"..Mode,ClosestPed)
			end
		end
	end
end)