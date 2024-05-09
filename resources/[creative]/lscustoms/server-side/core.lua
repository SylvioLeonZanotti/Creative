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
Tunnel.bindInterface("lscustoms",Kaduzera)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMERGENCY
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Emergency(Name)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local restrictedVehicles = {
            "bike"
        }

        for _, vehicle in ipairs(restrictedVehicles) do
            if Name == vehicle then
                TriggerClientEvent("Notify",source,"amarelo","Esse veículo não é permitido.",10000)
                return false
            end
        end
    end

    return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.checkPermission(hasPerm)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if exports["hud"]:Wanted(Passport,source) then
			return false
		end

		if not hasPerm then
			return true
		else
			if vRP.HasService(Passport,hasPerm) then
				return true
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("lscustoms:attemptPurchase")
AddEventHandler("lscustoms:attemptPurchase",function(type,mod)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if type == "engines" or type == "brakes" or type == "transmission" or type == "suspension" or type == "shield" then
			local Price = vehicleCustomisationPrices[type][mod]

			if vRP.PaymentFull(Passport,Price) then
				TriggerClientEvent("lscustoms:purchaseSuccessful",source)
			else
				TriggerClientEvent("lscustoms:purchaseFailed",source)
			end
		else
			if vRP.PaymentFull(Passport,vehicleCustomisationPrices[type]) then
				TriggerClientEvent("lscustoms:purchaseSuccessful",source)
			else
				TriggerClientEvent("lscustoms:purchaseFailed",source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("lscustoms:updateVehicle")
AddEventHandler("lscustoms:updateVehicle",function(Mods,Plate,vehName)
	local Passport = vRP.PassportPlate(Plate)
	if Passport then
		vRP.Query("entitydata/SetData",{ dkey = "Mods:"..Passport["Passport"]..":"..vehName, dvalue = json.encode(Mods) })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
local inVehicle = {}
RegisterServerEvent("lscustoms:inVehicle")
AddEventHandler("lscustoms:inVehicle",function(Network,Plate)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not Network then
			if inVehicle[Passport] then
				inVehicle[Passport] = nil
			end
		else
			inVehicle[Passport] = { Network,Plate }
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if inVehicle[Passport] then
		Wait(1000)
		TriggerEvent("garages:deleteVehicle",inVehicle[Passport][1],inVehicle[Passport][2])
		inVehicle[Passport] = nil
	end
end)