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
Tunnel.bindInterface("shortcuts",Kaduzera)

local Shortcuts = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHORTCUTS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Shortcuts()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Inventory = vRP.Inventory(Passport)
		if Inventory then
			for i = 1,5 do
				local Slot = tostring(i)
				if Inventory[Slot] then
					Shortcuts[Slot] = itemIndex(Inventory[Slot]["item"])
				else
					Shortcuts[Slot] = ""
				end
			end

			return Shortcuts
		end
	end

	return false
end