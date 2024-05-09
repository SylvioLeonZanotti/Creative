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
Tunnel.bindInterface("trucker",Kaduzera)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKEXIST
-----------------------------------------------------------------------------------------------------------------------------------------
local Trucker = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKEXIST
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.checkExist()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not Trucker[Passport] then
			Trucker[Passport] = os.time()
		end

		if os.time() >= Trucker[Passport] then
			return true
		else
			local truckerTimers = parseInt(Trucker[Passport] - os.time())
			TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..MinimalTimers(truckerTimers).."</b> para trabalhar novamente.",5000)
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELIVERY
-----------------------------------------------------------------------------------------------------------------------------------------
local Delivery = {
	["vehicles"] = {
		{ ["item"] = "dollars", ["min"] = 3500, ["max"] = 5000 },
		{ ["item"] = "tarp", ["min"] = 5, ["max"] = 8 },
		{ ["item"] = "copper", ["min"] = 45, ["max"] = 50 },
		{ ["item"] = "rubber", ["min"] = 40, ["max"] = 50 },
		{ ["item"] = "techtrash", ["min"] = 8, ["max"] = 10 },
		{ ["item"] = "roadsigns", ["min"] = 7, ["max"] = 9 },
		{ ["item"] = "aluminum", ["min"] = 40, ["max"] = 50 },
		{ ["item"] = "explosives", ["min"] = 8, ["max"] = 12 },
		{ ["item"] = "sheetmetal", ["min"] = 3, ["max"] = 4 },
		{ ["item"] = "glass", ["min"] = 42, ["max"] = 50 },
		{ ["item"] = "fabric", ["min"] = 5, ["max"] = 10 },
		{ ["item"] = "plastic", ["min"] = 40, ["max"] = 50 }
	},
	["diesel"] = {
		{ ["item"] = "dollars", ["min"] = 3500, ["max"] = 5000 },
		{ ["item"] = "tarp", ["min"] = 5, ["max"] = 8 },
		{ ["item"] = "copper", ["min"] = 45, ["max"] = 50 },
		{ ["item"] = "rubber", ["min"] = 40, ["max"] = 50 },
		{ ["item"] = "techtrash", ["min"] = 8, ["max"] = 10 },
		{ ["item"] = "roadsigns", ["min"] = 7, ["max"] = 9 },
		{ ["item"] = "aluminum", ["min"] = 40, ["max"] = 50 },
		{ ["item"] = "explosives", ["min"] = 8, ["max"] = 12 },
		{ ["item"] = "sheetmetal", ["min"] = 3, ["max"] = 4 },
		{ ["item"] = "glass", ["min"] = 42, ["max"] = 50 },
		{ ["item"] = "fabric", ["min"] = 5, ["max"] = 10 },
		{ ["item"] = "plastic", ["min"] = 40, ["max"] = 50 }
	},
	["fuel"] = {
		{ ["item"] = "dollars", ["min"] = 3500, ["max"] = 5000 },
		{ ["item"] = "tarp", ["min"] = 5, ["max"] = 8 },
		{ ["item"] = "copper", ["min"] = 45, ["max"] = 50 },
		{ ["item"] = "rubber", ["min"] = 40, ["max"] = 50 },
		{ ["item"] = "techtrash", ["min"] = 8, ["max"] = 10 },
		{ ["item"] = "roadsigns", ["min"] = 7, ["max"] = 9 },
		{ ["item"] = "aluminum", ["min"] = 40, ["max"] = 50 },
		{ ["item"] = "explosives", ["min"] = 8, ["max"] = 12 },
		{ ["item"] = "sheetmetal", ["min"] = 3, ["max"] = 4 },
		{ ["item"] = "glass", ["min"] = 42, ["max"] = 50 },
		{ ["item"] = "fabric", ["min"] = 5, ["max"] = 10 },
		{ ["item"] = "plastic", ["min"] = 40, ["max"] = 50 }
	},
	["wood"] = {
		{ ["item"] = "dollars", ["min"] = 3500, ["max"] = 5000 },
		{ ["item"] = "tarp", ["min"] = 5, ["max"] = 8 },
		{ ["item"] = "copper", ["min"] = 45, ["max"] = 50 },
		{ ["item"] = "rubber", ["min"] = 40, ["max"] = 50 },
		{ ["item"] = "techtrash", ["min"] = 8, ["max"] = 10 },
		{ ["item"] = "roadsigns", ["min"] = 7, ["max"] = 9 },
		{ ["item"] = "aluminum", ["min"] = 40, ["max"] = 50 },
		{ ["item"] = "explosives", ["min"] = 8, ["max"] = 12 },
		{ ["item"] = "sheetmetal", ["min"] = 3, ["max"] = 4 },
		{ ["item"] = "glass", ["min"] = 42, ["max"] = 50 },
		{ ["item"] = "fabric", ["min"] = 5, ["max"] = 10 },
		{ ["item"] = "plastic", ["min"] = 40, ["max"] = 50 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Payment(Service)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.UserPremium(Passport) then
			Trucker[Passport] = os.time() + 10800
		else
			Trucker[Passport] = os.time() + 21600
		end

		for k,v in pairs(Delivery[Service]) do
			local Rand = math.random(v["min"],v["max"])
			vRP.GenerateItem(Passport,v["item"],Rand,true)
		end
	end
end