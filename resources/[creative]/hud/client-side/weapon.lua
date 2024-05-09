-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local AmmoMax = -1
local AmmoMin = -1
local Active = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:WEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("hud:Weapon",function(Status,Hash)
	if Status then
		Active = true

		while Active do
			local Ped = PlayerPedId()
			local _,Min = GetAmmoInClip(Ped,Hash)
			local Max = GetAmmoInPedWeapon(Ped,Hash)

			if AmmoMax ~= Max or AmmoMin ~= Min then
				AmmoMax = Max
				AmmoMin = Min

				if (Max - Min) <= 0 then
					Max = 0
				else
					Max = Max - Min
				end

				SendNUIMessage({ name = "Weapons", payload = { true, Min, Max, itemName(Hash) } })
			end

			Wait(100)
		end
	else
		SendNUIMessage({ name = "Weapons", payload = false })
		Active = false
		AmmoMax = -1
		AmmoMin = -1
	end
end)