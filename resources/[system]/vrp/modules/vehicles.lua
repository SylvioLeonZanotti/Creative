-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEANVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("CleanVehicle")
AddEventHandler("CleanVehicle",function(entIndex)
	if DoesEntityExist(NetworkGetEntityFromNetworkId(entIndex)) and not IsPedAPlayer(NetworkGetEntityFromNetworkId(entIndex)) and 2 == GetEntityType(NetworkGetEntityFromNetworkId(entIndex)) then
		SetVehicleDirtLevel(NetworkGetEntityFromNetworkId(entIndex),0.0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESOURCESTART
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("onResourceStart",function(Resource)
    if "vrp" == Resource then
        Wait(3000)
    end
end)